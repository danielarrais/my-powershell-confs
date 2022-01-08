# Edição do [Powershell Profile](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.2)
No powershell é possível criar um arquivo com scripts seus e configurações que alteram o comportamento do seu terminal. Para acessar ou criar esse arquivo basta rodar o comando abaixo (code é o comando que abre o VSCode, você pode usar qualquer outro):

# Instalação manual do windows terminal
Caso sua organização proíba a instalação de apps das lojas você pode instalar manualmente baixando o *.msixbundle* mais atual do windows terminal neste [link](https://github.com/microsoft/terminal/releases).
```bash
code $PROFILE
```
Depois de fazer isso você pode copiar o conteúdo deste arquivo e alter=a-lo como desejar.

# Módulos Power Shell
Para funcionar algumas configurações definidas no arquivo de profile é necessário que alguns módulos sejam instalados/atualizados.
## [oh-my-posh](https://ohmyposh.dev/docs/windows)
O oh-my-posh é um módulo que nos permite fazer várias customizações no visual do terminal.
### Instalação:
```bash
Install-Module oh-my-posh -Scope CurrentUser
```
### Atualização:
```bash
Update-Module oh-my-posh
```

## [PowerShellGet](https://docs.microsoft.com/en-us/powershell/scripting/gallery/installing-psget?view=powershell-7.2)
Esse módulo é fundamental para conseguirmos atualizar o módulo seguinte, o PSReadLine.
### Atualização:
Esse módulo já vem embarcado no powershell, porém precisamos instalar a versão mais atualizada possível e para isso precisamos rodar os seguintes comandos:

```bash
Install-PackageProvider Nuget –Force
Install-Module –Name PowerShellGet –Force
Update-Module PowerShellGet
```

## [PSReadLine](https://github.com/PowerShell/PSReadLine)
Esse módulo fornece alguns recursos interessantes, como o de predict, que já está configurado em nosso profile.
### Atualização:

Não é algo trivial atualizar esse módulo, mas existe um caminho fácil que consiste em remover a pasta do módulo manualmente e depois rodar os seguinte comando:

```bash
Get-Module PSReadLine
```

## [posh-git](https://github.com/dahlbyk/posh-git)
Esse módulo adiciona informações do repositório na linha corrente do terminal, é muito útil para quem usa o git.

### Instalação:
```bash
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
Install-Module Posh-Git
```