from pathlib import Path

if __name__ == "__main__":
    Path("BP/python-hello-bp.txt").write_text("Hello from Python in BP!")
    Path("RP/python-hello-rp.txt").write_text("Hello from Python in RP!")
