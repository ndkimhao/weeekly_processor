import sys
import argparse
from types import NoneType
from typing import Optional

import serial
from serial.tools.miniterm import Miniterm, key_description

PRINT_MAX_LEN = 64


class Communicator:
    def __init__(self, ser):
        self.ser: serial.Serial = ser

    def close(self):
        self.ser.close()

    def _print(self, msg: bytes | str = '', end='\n'):
        if isinstance(msg, bytes) and all(32 <= c < 128 or c == ord('\n') for c in msg):
            msg = msg.decode().rstrip()
        if isinstance(msg, bytes):
            msg = '$raw:' + msg.hex()
        if len(msg) > PRINT_MAX_LEN:
            msg = msg[:PRINT_MAX_LEN] + '...'
        print(msg, end=end)

    def send_cmd(self,
                 cmd: Optional[bytes | str],
                 expected: Optional[bytes | str] = None,
                 no_wait=False):
        if cmd is not None:
            is_cmd_binary = isinstance(cmd, bytes)
            self._print(cmd, end='')
            if isinstance(cmd, str):
                cmd = cmd.encode()

            to_send = cmd + b'\n'
            self.ser.write(to_send)

            if not is_cmd_binary:
                echoed = self.ser.readline()
            else:
                echoed = self.ser.read(len(to_send))
            assert echoed == to_send, (echoed, to_send)

            if no_wait:
                self._print()
                return
        ##################
        resp = None
        if expected is not None:
            if isinstance(expected, str):
                resp = self.ser.readline()
                expected = expected.encode()
            else:
                resp = self.ser.read(len(expected) + 1)
            expected += '\n'.encode()
            self._print(f' ==> ', end='')
            self._print(resp, end='')
            assert resp == expected, (resp, expected)
        ##################
        self._print()
        return resp

    def run_miniterm(self):
        miniterm = Miniterm(self.ser, eol='lf')
        miniterm.set_rx_encoding('UTF-8')
        miniterm.set_tx_encoding('UTF-8')
        miniterm.exit_character = chr(0x03)
        miniterm.menu_character = chr(0x14)

        print('--- Miniterm on {p.name}  {p.baudrate},{p.bytesize},{p.parity},{p.stopbits} ---'
              .format(p=miniterm.serial))
        print('--- Quit: {} | Menu: {} | Help: {} followed by {} ---\n'.format(
            key_description(miniterm.exit_character),
            key_description(miniterm.menu_character),
            key_description(miniterm.menu_character),
            key_description('\x08')))

        miniterm.start()
        try:
            miniterm.join(True)
        except KeyboardInterrupt:
            pass
        sys.stderr.write('\n--- exit ---\n')
        miniterm.join()
        miniterm.close()


SEP = '============================================================'


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-p', '--port', help='COM port', required=True)
    parser.add_argument('-f', '--file', help='Hex file')
    parser.add_argument('-t', '--verify', help='Verify uploaded data',
                        default=True, action=argparse.BooleanOptionalAction)
    parser.add_argument('-j', '--jmp', help='Jump to code after uploading',
                        default=True, action=argparse.BooleanOptionalAction)
    parser.add_argument('-m', '--monitor', help='Monitor serial port after uploading',
                        default=False, action=argparse.BooleanOptionalAction)
    parser.add_argument('--hex', help='Use hex transfer mode',
                        default=False, action=argparse.BooleanOptionalAction)
    parser.add_argument('--persist', help='Persist jmp address',
                        default=True, action=argparse.BooleanOptionalAction)
    args = parser.parse_args()

    if args.file:
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
        print(f'\nLoaded hex code at {args.file}\n\n{SEP}\n')

    CHUNK_SIZE = 256  # bytes

    with serial.Serial(args.port, 115200, timeout=0.5) as ser:
        comm = Communicator(ser)
        if args.file:
            comm.send_cmd('PING', 'PONG')
            print(f'\nPinged device at {args.port}\n\n{SEP}\n')

            for i in range(0, len(data), CHUNK_SIZE):
                chunk = data[i: i + CHUNK_SIZE]
                chunk_start = code_offset + i
                chunk_end = chunk_start + len(chunk)
                write_cmd = 'WRITE' if args.hex else 'WRITEB'
                comm.send_cmd(f'{write_cmd} {chunk_start:04x} {chunk_end:04x}')
                comm.send_cmd(chunk.hex() if args.hex else chunk,
                              f'WRITE_OK {chunk_start:04x} {chunk_end:04x}')

            print(f'\nUploaded\n\n{SEP}\n')

            if args.verify:
                for i in range(0, len(data), CHUNK_SIZE):
                    chunk = data[i: i + CHUNK_SIZE]
                    chunk_start = code_offset + i
                    chunk_end = chunk_start + len(chunk)
                    read_cmd = 'READ' if args.hex else 'READB'
                    comm.send_cmd(f'{read_cmd} {chunk_start:04x} {chunk_end:04x}',
                                  f'READ_OK {chunk_start:04x} {chunk_end:04x}')
                    comm.send_cmd(None, chunk.hex() if args.hex else chunk)

                print(f'\nVerified\n\n{SEP}\n')

        if args.file and args.jmp:
            if args.persist:
                comm.send_cmd(f'JMP_PERSIST {code_offset:04x}', f'JMP_PERSISTED {code_offset:04x}')
            else:
                comm.send_cmd(f'JMP {code_offset:04x}', f'JMP_TO {code_offset:04x}')

        if args.monitor:
            print(f'\n{SEP}')
            comm.run_miniterm()


if __name__ == '__main__':
    main()
