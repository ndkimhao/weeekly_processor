import sys
import argparse

import serial


class Communicator:
    def __init__(self, ser):
        self.ser: serial.Serial = ser

    def close(self):
        self.ser.close()

    def _read_line(self):
        d = self.ser.readline()
        if len(d) > 0 and d[-1] == ord('\n'):
            d = d[:-1]
        return d

    def send_cmd(self, cmd: bytes | str, expected=None, no_wait=False):
        if isinstance(cmd, str):
            cmd = cmd.encode()
        print(f'-- {cmd.decode()}', end='')
        self.ser.write(cmd + b'\n')
        echoed = self._read_line()
        assert echoed == cmd, (echoed, cmd)
        if no_wait:
            print()
            return
        resp = self._read_line()
        resp = resp.decode()
        print(f' ==> {resp}')
        if expected is not None:
            assert resp == expected, (resp, expected)
        return resp


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-p', '--port', help='COM port', required=True)
    parser.add_argument('-f', '--file', help='Hex file', required=True)
    parser.add_argument('-t', '--verify', help='Verify uploaded data',
                        default=True, action=argparse.BooleanOptionalAction)
    parser.add_argument('-j', '--jmp', help='Jump to code after uploading',
                        default=True, action=argparse.BooleanOptionalAction)
    args = parser.parse_args()

    with open(args.file, 'r') as f:
        lines = f.readlines()

    configs = {}
    data_builder = bytearray()
    config_section = True
    for line in lines:
        hexcode, rest = line.split('#', 1)
        addr, comment = rest.split('|', 1)

        comment: str = comment.strip()
        if config_section and comment.startswith('.config '):
            parts = comment.split(' ', 2)
            configs[parts[1]] = parts[2]
        else:
            config_section = False

        data_builder.extend(bytearray.fromhex(hexcode))

    if len(data_builder) % 2 == 1:
        data_builder.append(0)

    data = bytes(data_builder)
    code_offset = int(configs['CODE_OFFSET'][2:], 16)
    print(f'data len = {len(data)}')
    print(f'code offset = 0x{code_offset:04x}')
    print()

    CHUNK_SIZE = 64  # bytes

    with serial.Serial(args.port, 115200, timeout=1) as ser:
        comm = Communicator(ser)
        comm.send_cmd('PING', 'PONG')
        print(f'Pinged device at {args.port}')

        for i in range(0, len(data), CHUNK_SIZE):
            chunk = data[i: i + CHUNK_SIZE]
            chunk_start = code_offset + i
            chunk_end = chunk_start + len(chunk)
            comm.send_cmd(f'WRITE {chunk_start:04x} {chunk.hex()}',
                          f'OK {chunk_start:04x} {chunk_end:04x}')

        if args.verify:
            for i in range(0, len(data), CHUNK_SIZE):
                chunk = data[i: i + CHUNK_SIZE]
                chunk_start = code_offset + i
                chunk_end = chunk_start + len(chunk)
                comm.send_cmd(f'READ {chunk_start:04x} {chunk_end:04x}',
                              f'{chunk_start:04x} {chunk_end:04x} {chunk.hex()}')

        if args.jmp:
            comm.send_cmd(f'JMP {code_offset:04x}', no_wait=True)


if __name__ == '__main__':
    main()
