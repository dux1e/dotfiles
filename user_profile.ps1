# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Promt
Import-Module posh-git
Import-Module oh-my-posh
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -Colors @{InlinePrediction = '#909090'}
# Choose one or the other, Inline view is default
# Set-PSReadLineOption --PredictionViewStyle InlineView
# Set-PSReadLineOption --PredictionViewStyle ListView

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias Functions
Function poweroff {shutdown /s /t 0}
Function reboot {shutdown /r /t 0}
Function close {exit}
Function up {cd ..}
Function cdgit {C:\git}

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias g git
Set-Alias cl clear
Set-Alias -Name y-dl -Value youtube-dl
Set-Alias -Name file -Value explorer

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
