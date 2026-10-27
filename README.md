# arabfix

Fixes Arabic in Termux and Windows PowerShell: connected letters + correct right-to-left order.

## Install

**Termux**
```bash
pkg install curl -y && curl -fsSL https://raw.githubusercontent.com/fozo-code/arabfix/main/install.sh | bash
```

**Windows PowerShell**
```powershell
irm https://raw.githubusercontent.com/fozo-code/arabfix/main/install.ps1 | iex
```

Close the terminal and open it again.

## Use

```
ar cat file.txt            # run a command, fix its output
any_command | arfix        # fix any output
python ~/.arabfix/arabfix.py test
```

Update: run the install command again.
Remove: `python ~/.arabfix/arabfix.py uninstall`
