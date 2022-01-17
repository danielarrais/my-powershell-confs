Import-Module oh-my-posh
Import-Module posh-git
Import-Module PSReadLine

Set-PoshPrompt -Theme material
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView # Default conf

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
