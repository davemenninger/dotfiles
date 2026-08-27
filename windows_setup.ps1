cp ~\git\dotfiles\.tmux.conf ~\.tmux.conf

echo "installing winget stuff..."
winget import winget.json

echo "installing pwsh modules..."
# Install-Module -Name Terminal-Icons -Repository PSGallery
# Install-Module -Name posh-git -Repository PSGallery
# Install-Module -Name PsReadLine -Repository PSGallery

echo "shell theme..."
# oh-my-posh init pwsh --config 'C:\Users\dmenninger\AppData\Local\Programs\oh-my-posh\themes\onehalf.minimal.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Program Files (x86)\oh-my-posh\themes\onehalf.minimal.omp.json' | Invoke-Expression
# oh-my-posh init powershell --config 'onehalf.minimal' | Invoke-Expression

echo "installing WSL"
wsl --install -d Ubuntu-24.04
