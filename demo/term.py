import os
import signal

def handle_winch(signum, frame):
    rows, columns = os.popen('stty size', 'r').read().split()
    print("Terminal window resized to %d rows and %d columns" % (int(rows), int(columns)))

signal.signal(signal.SIGWINCH, handle_winch)

while True:

    pass


