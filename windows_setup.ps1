echo "installing winget stuff..."
winget import winget.json

echo "installing pwsh modules..."
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name posh-git -Repository PSGallery

echo "shell theme..."
oh-my-posh init pwsh --config 'C:\Users\dmenninger\AppData\Local\Programs\oh-my-posh\themes\onehalf.minimal.omp.json' | Invoke-Expression

echo "installing WSL"
wsl --install -d Ubuntu-24.04
