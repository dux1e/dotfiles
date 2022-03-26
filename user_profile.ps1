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
# Choose one or the other, Inline view is default
# Set-PSReadLineOption --PredictionViewStyle InlineView
# Set-PSReadLineOption --PredictionViewStyle ListView

# Alias
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias g git
