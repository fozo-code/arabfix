# arabfix installer for Windows PowerShell
$raw = "https://raw.githubusercontent.com/fozo-code/arabfix/main"
$dir = Join-Path $HOME ".arabfix"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$py = $null
foreach ($c in "py", "python") {
    if (Get-Command $c -ErrorAction SilentlyContinue) { $py = $c; break }
}
if (-not $py) {
    Write-Host "Python not found. Install it first:  winget install Python.Python.3.12"
    return
}

New-Item -ItemType Directory -Force -Path $dir | Out-Null
Invoke-WebRequest "$raw/arabfix.py" -OutFile "$dir\arabfix.py" -UseBasicParsing

# PowerShell blocks profile scripts by default; allow local ones for this user only
$pol = Get-ExecutionPolicy -Scope CurrentUser
if ($pol -in "Undefined", "Restricted") {
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
}

& $py "$dir\arabfix.py" install
