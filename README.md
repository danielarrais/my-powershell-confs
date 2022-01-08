
# Edição do [Powershell Profile](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.2)

No powershell é possível criar um arquivo com scripts seus e configurações que alteram o comportamento do seu terminal. Para acessar ou criar esse arquivo basta rodar o comando abaixo (code é o comando que abre o VSCode, você pode usar qualquer outro):

```bash
code $PROFILE
```

Depois de fazer isso você pode copiar o conteúdo do arquivo [profile.ps1](https://github.com/danielarrais/my-powershell-confs/blob/main/Powershell/profile.ps1), colar no aberto pelo terminal e alterá-lo como desejar (continue a leitura do readme para entender o conteúdo).

# Instalação manual do windows terminal

Caso sua organização proíba a instalação de apps direto na loja do windows você pode instalá-lo manualmente baixando o *.msixbundle* mais atual do windows terminal neste [link](https://github.com/microsoft/terminal/releases) e executar.

# Instalação/Atualização de módulos Power Shell

Para funcionar algumas configurações definidas no arquivo [profile.ps1](https://github.com/danielarrais/my-powershell-confs/blob/main/Powershell/profile.ps1) é necessário que alguns módulos sejam instalados/atualizados.

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

Esse módulo já vem embarcado no powershell, porém precisamos instalar uma versão mais atual e para isso precisamos rodar os seguintes comandos:

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

# Configurações do powershell

Abaixo segue uma explanação das configurações do powershell encontradas no arquivo [profile.ps1](https://github.com/danielarrais/my-powershell-confs/blob/main/Powershell/profile.ps1).

## Importação dos módulos

O arquivo profile é um script powershell que é executado toda vez que abrimos o terminal e nele podemos importar módulos e configurá-los a nossa maneira. Além de podermos definir funções que podemos executar no terminal a qualquer momento.

Alguns módulos já são importados por padrão e estão disponíveis para executarmos suas funções a qualquer momento, porém alguns dos que instalamos precisamos importar, para isso usamos a função `Import-Module`:

```bash
Import-Module oh-my-posh # modulo de customização
Import-Module posh-git # modulo para exibição de infors do repositório
Import-Module PSReadLine # modulo para adicionarmos o auto complete
```

## Definição do tema utilizado pelo oh-my-posh

Importado o módulo do oh-my-posh, podemos definir o tema que será utilizado e você pode escolher entre um [desses](https://ohmyposh.dev/docs/themes). Para alterar o tema podemos usar o comando abaixo:

> Para o correto funcionamento dessa configuração é importante a instalação de uma [Nerd Font](https://www.nerdfonts.com/font-downloads), que forneça todos os ícones necessários para o oh-my-posh. Após instalar a fonte você tem que defini-la como a padrão do terminal.
> 
```bash
Set-PoshPrompt -Theme material
```

## Configurando o auto-complete do PSReadLine

Com o módulo PSReadline podemos adicionar autocomplete no powershell com base no hitórico de comando, para isso podemos utilizar os comandos abaixo:

```bash
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView # ou InlineView
```

# Configurações do windows terminal

Aqui não há muito o que explanar, vou apenas destacar a **definição de fonte dos terminais** executados pelo windows terminal, que é feita na seção `profiles > defaults > font > face` do [settings.json](https://github.com/danielarrais/my-powershell-confs/blob/main/Windows-Terminal/settings.json "settings.json") da seguinte forma:

```json
...
"face":  "MesloLGM Nerd Font Mono",
"size":  10
...
```

e a **ocultação dos textos padrões** do powershell, que pode ser feito passando o parametro `-nologo` no comando de execução dele. Você pode fazer isso no profile do powershell definido no [settings.json](https://github.com/danielarrais/my-powershell-confs/blob/main/Windows-Terminal/settings.json "settings.json"), através da propriedade `comandLine`, onde é possível definir o comando de execução do powershell. No nosso arquivo ficou assim:

```json
...
"commandline":  "C:\\Program Files\\PowerShell\\7\\pwsh.exe -nologo",
...
```
