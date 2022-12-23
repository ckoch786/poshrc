# TODO Check to see if running as admin

# TODO add check to see if already exists first or if physical 
# file is in the way.
<#
New-Item -ItemType SymbolicLink `
    -Path "C:\Users\Ckoch\OneDrive - ARCOS LLC\Documents\.emacs.d\" `
    -Target "C:\Users\Ckoch\OneDrive - ARCOS LLC\Documents\PowerShell\.emacs.d\" 

New-Item -ItemType SymbolicLink `
    -Path "C:\Users\Ckoch\.ideavimrc" `
    -Target "C:\Users\Ckoch\OneDrive - ARCOS LLC\Documents\PowerShell\RiderIDE\.ideavimrc"

New-Item -ItemType SymbolicLink `
    -Path "C:\Users\Ckoch\AppData\Local\nvim" `
    -Target "C:\Users\Ckoch\OneDrive - ARCOS LLC\Documents\PowerShell\NeoVim"

New-Item -ItemType SymbolicLink `
    -Path "C:\Users\Ckoch\.intellimacs"
    -Target "C:\Users\Ckoch\OneDrive - ARCOS LLC\Documents\PowerShell\.intellimacs.d\"
#>

New-Item -ItemType SymbolicLink `
    -Path "C:\Users\Ckoch\OneDrive - ARCOS LLC\Documents\.spacemacs" `
    -Target "C:\Users\Ckoch\OneDrive - ARCOS LLC\Documents\PowerShell\.spacemacs.d\.spacemacs"

New-Item -ItemType SymbolicLink `
    -Path "C:\Users\Ckoch\OneDrive - ARCOS LLC\Documents\.spacemacs.env" `
    -Target "C:\Users\Ckoch\OneDrive - ARCOS LLC\Documents\PowerShell\.spacemacs.d\.spacemacs.env"

