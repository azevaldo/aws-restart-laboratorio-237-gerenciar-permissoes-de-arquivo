# AWS re/Start — Laboratório 237: Gerenciar Permissões de Arquivo

Laboratório prático do programa **AWS re/Start** sobre gerenciamento de propriedade, grupos e permissões de arquivos e diretórios no Linux.

Neste laboratório foram praticadas operações com `chown` e `chmod`, utilizando permissões simbólicas e absolutas, além da atualização da propriedade de diferentes diretórios de uma empresa.

## Objetivos

* Alterar a propriedade de arquivos e diretórios.
* Alterar o grupo proprietário de arquivos e diretórios.
* Modificar permissões utilizando `chmod`.
* Utilizar o modo simbólico do `chmod`.
* Utilizar o modo absoluto do `chmod`.
* Associar diretórios aos usuários e grupos apropriados.
* Validar as alterações utilizando `ls -l` e `ls -laR`.

O laboratório tem duração aproximada de 35 minutos.

## Ambiente

* **Programa:** AWS re/Start
* **Laboratório:** 237 — Gerenciar Permissões de Arquivo
* **Ambiente:** AWS Vocareum
* **Serviço:** Amazon EC2
* **Sistema operacional:** Amazon Linux
* **Acesso:** SSH
* **Cliente SSH utilizado:** PuTTY
* **Sistema local:** Windows
* **Usuário:** `ec2-user`
* **Chave utilizada:** `labsuser.ppk`
* **Porta SSH:** `22`

## 1. Conexão com a instância EC2

Após iniciar o laboratório, foi obtido o endereço IP público da instância e realizado o download da chave:

```text
labsuser.ppk
```

No Windows, a conexão foi realizada utilizando o **PuTTY**.

Configuração:

```text
Host Name: <PublicIP>
Port: 22
Connection type: SSH
```

A chave foi configurada em:

```text
Connection
└── SSH
    └── Auth
        └── Credentials
```

O acesso à instância foi realizado utilizando o usuário:

```text
ec2-user
```

> A conexão utilizada neste laboratório foi feita no Windows através do PuTTY e da chave `labsuser.ppk`.

## 2. Alterando propriedade e grupo

O primeiro exercício teve como objetivo alterar o proprietário e o grupo de diferentes diretórios.

As alterações realizadas foram:

| Diretório    | Proprietário | Grupo       |
| ------------ | ------------ | ----------- |
| `companyA`   | `mjackson`   | `Personnel` |
| `HR`         | `ljuan`      | `HR`        |
| `HR/Finance` | `mmajor`     | `Finance`   |
| `Shipping`   | `eowusu`     | `Shipping`  |
| `Sales`      | `nwolf`      | `Sales`     |

### Verificar o diretório atual

```bash
pwd
```

O diretório utilizado foi:

```text
/home/ec2-user/companyA
```

### Alterar propriedade de CompanyA

```bash
sudo chown -R mjackson:Personnel /home/ec2-user/companyA
```

A opção `-R` permite aplicar a alteração recursivamente ao diretório e ao seu conteúdo.

### Alterar propriedade de HR

```bash
sudo chown -R ljuan:HR HR
```

### Alterar propriedade de Finance

```bash
sudo chown -R mmajor:Finance HR/Finance
```

### Validar as alterações

```bash
ls -laR
```

O comando permite visualizar recursivamente informações de arquivos e diretórios, incluindo proprietário e grupo.

## 3. Alterando permissões com chmod

O comando `chmod` é utilizado para modificar as permissões de arquivos.

O laboratório apresenta duas formas principais:

* **Modo simbólico**
* **Modo absoluto**

## 4. Modo simbólico

Foi criado um arquivo utilizando o Vim:

```bash
sudo vi symbolic_mode_file
```

Depois de salvar e sair do Vim:

```text
ESC
:wq
```

A permissão de escrita para o grupo foi adicionada utilizando:

```bash
sudo chmod g+w symbolic_mode_file
```

### Entendendo o comando

```text
g+w
```

Significa:

* `g` → grupo
* `+` → adicionar
* `w` → permissão de escrita

Portanto, o comando adiciona permissão de escrita ao grupo proprietário do arquivo.

## 5. Modo absoluto

Foi criado outro arquivo:

```bash
sudo vi absolute_mode_file
```

Depois de salvar:

```text
ESC
:wq
```

A permissão foi definida utilizando:

```bash
sudo chmod 764 absolute_mode_file
```

### Entendendo `764`

O valor é dividido em três partes:

```text
7   6   4
│   │   │
│   │   └── Outros
│   └────── Grupo
└────────── Usuário
```

Cada número representa um conjunto de permissões:

```text
4 = leitura (r)
2 = escrita (w)
1 = execução (x)
```

Assim:

```text
7 = 4 + 2 + 1 = rwx
6 = 4 + 2     = rw-
4 = 4         = r--
```

Portanto:

```text
764 = rwxr--? 
```

A representação correta é:

```text
764 = rwxrw-r--
```

Ou seja:

* Usuário: `rwx`
* Grupo: `rw-`
* Outros: `r--`

### Validar as permissões

```bash
ls -l
```

Esse comando permite verificar as permissões dos arquivos criados.

## 6. Atribuindo permissões aos diretórios

Também foram atualizadas as propriedades dos diretórios `Shipping` e `Sales`.

### Shipping

O proprietário foi definido como `eowusu` e o grupo como `Shipping`:

```bash
sudo chown -R eowusu:Shipping Shipping
```

### Sales

O proprietário foi definido como `nwolf` e o grupo como `Sales`:

```bash
sudo chown -R nwolf:Sales Sales
```

### Validar Shipping

```bash
ls -laR Shipping
```

### Validar Sales

```bash
ls -laR Sales
```

## 7. Principais comandos praticados

| Comando   | Função                                                  |
| --------- | ------------------------------------------------------- |
| `pwd`     | Mostra o diretório atual                                |
| `ls -l`   | Lista arquivos com permissões e propriedade             |
| `ls -laR` | Lista recursivamente arquivos e diretórios com detalhes |
| `chown`   | Altera proprietário e grupo                             |
| `chmod`   | Altera permissões                                       |
| `vi`      | Editor de texto utilizado para criar arquivos           |
| `sudo`    | Executa comandos com privilégios administrativos        |

## 8. O que aprendi

Neste laboratório pratiquei:

* Conceito de proprietário e grupo de arquivos.
* Alteração de propriedade com `chown`.
* Alteração recursiva de propriedade com `chown -R`.
* Gerenciamento de permissões com `chmod`.
* Utilização do modo simbólico do `chmod`.
* Utilização do modo absoluto do `chmod`.
* Interpretação de permissões utilizando valores numéricos.
* Validação de permissões e propriedade com `ls -l` e `ls -laR`.
* Organização de permissões de acordo com usuários e grupos.

## Conclusão

O Laboratório 237 reforçou os fundamentos de segurança e controle de acesso no Linux.

Através dos comandos `chown` e `chmod`, foi possível controlar quem é proprietário dos diretórios, quais grupos possuem acesso e quais permissões cada categoria de usuário possui sobre os arquivos.

## Arquivos do repositório

```text
README.md       # Documentação do laboratório
comandos.sh     # Comandos praticados durante o laboratório
.gitignore      # Arquivos que não devem ser enviados ao GitHub
```
