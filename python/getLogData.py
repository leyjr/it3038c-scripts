import oops

filename = "test.txt"

with open (filename) as f:
        lines = set(f.read().splitlines())
        for line in lines:
            if"Jared" in line:
                print(line)