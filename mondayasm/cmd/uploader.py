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

    def send_cmd(self, cmd, expected=None):
        if isinstance(cmd, str):
            cmd = cmd.encode()
        self.ser.write(cmd + b'\n')
        echoed = self._read_line()
        assert echoed == cmd, (echoed, cmd)
        resp = self._read_line()
        resp = resp.decode()
        if expected is not None:
            assert resp == expected, (resp, expected)
        return resp


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-p', '--port', help='COM port', required=True)
    parser.add_argument('-f', '--file', help='Hex file', required=True)
    args = parser.parse_args()

    with serial.Serial(args.port, 115200, timeout=1) as ser:
        comm = Communicator(ser)
        comm.send_cmd('PING', 'PONG')
        print(f'Pinged device at {args.port}')


if __name__ == '__main__':
    main()
