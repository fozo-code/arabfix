#!/usr/bin/env bash
# arabfix installer for Termux / Linux / macOS
RAW="https://raw.githubusercontent.com/fozo-code/arabfix/main"
DIR="$HOME/.arabfix"

if ! command -v python >/dev/null 2>&1 && ! command -v python3 >/dev/null 2>&1; then
  if [ -d /data/data/com.termux ]; then
    pkg install -y python
  else
    echo "Please install python3 first."; exit 1
  fi
fi
PY="$(command -v python || command -v python3)"

mkdir -p "$DIR"
if ! curl -fsSL "$RAW/arabfix.py" -o "$DIR/arabfix.py"; then
  echo "Download failed. Check your connection."; exit 1
fi

"$PY" "$DIR/arabfix.py" install
