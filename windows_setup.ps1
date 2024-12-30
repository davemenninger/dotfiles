echo "installing winget stuff..."
winget import winget.json

echo "installing pwsh modules..."
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name posh-git -Repository PSGallery

echo "installing WSL"
wsl --install -d Ubuntu-24.04
