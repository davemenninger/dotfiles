echo "installing winget stuff..."
winget import winget_dump.json

echo "installing terminal icons..."
Install-Module -Name Terminal-Icons -Repository PSGallery

echo "installing WSL"
wsl --install -d Ubuntu-24.04
