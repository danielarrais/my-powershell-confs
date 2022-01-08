Import-Module oh-my-posh
Import-Module posh-git
Import-Module PSReadLine

Set-PoshPrompt -Theme material
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView