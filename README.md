Catering-server
---

## Setup

### 0. Install `gum` for refined TUI

[🔗 Reference](https://github.com/charmbracelet/gum#installation)

### 1. Create virtual environment

For posix systems with `bash`
```bash
# use python 3.11
python -m venv .venv
source ./.venv/bin/activate
```
or use `./setup.sh`

For Windows with `cmd`
```cmd
REM use python 3.11
python -m venv .venv
.venv\Scripts\activate.bat
```

### 2. Install dependencies
```bash
pip install -r ./requirements
```