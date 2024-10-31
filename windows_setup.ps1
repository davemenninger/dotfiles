echo "installing winget stuff..."
winget import winget_dump.json

echo "installing WSL"
wsl --install -d Ubuntu-24.04
