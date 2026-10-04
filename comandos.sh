```bash
#!/bin/bash

# AWS re/Start - Laboratório 237
# Gerenciar Permissões de Arquivo
#
# Este arquivo documenta os principais comandos utilizados no laboratório.
# Os comandos não devem necessariamente ser executados todos de uma vez,
# pois dependem do diretório atual e da estrutura existente.
#
# A conexão real com a instância foi feita no Windows utilizando PuTTY,
# a chave labsuser.ppk e o usuário ec2-user.


# ==========================================================
# VERIFICAR O DIRETÓRIO ATUAL
# ==========================================================

# Mostrar o diretório atual
pwd

# Acessar o diretório principal do laboratório
cd /home/ec2-user/companyA


# ==========================================================
# ALTERAR PROPRIETÁRIO E GRUPO DE COMPANYA
# ==========================================================

# Alterar recursivamente o proprietário para mjackson
# e o grupo para Personnel
sudo chown -R mjackson:Personnel /home/ec2-user/companyA


# ==========================================================
# ALTERAR PROPRIETÁRIO E GRUPO DE HR
# ==========================================================

# Alterar o proprietário para ljuan
# e o grupo para HR
sudo chown -R ljuan:HR HR


# ==========================================================
# ALTERAR PROPRIETÁRIO E GRUPO DE FINANCE
# ==========================================================

# Alterar o proprietário de HR/Finance para mmajor
# e o grupo para Finance
sudo chown -R mmajor:Finance HR/Finance


# ==========================================================
# VALIDAR PROPRIEDADE E PERMISSÕES
# ==========================================================

# Listar recursivamente arquivos e diretórios
# mostrando propriedades e permissões
ls -laR


# ==========================================================
# CRIAR ARQUIVO PARA TESTAR MODO SIMBÓLICO
# ==========================================================

# Criar o arquivo utilizando o Vim
sudo vi symbolic_mode_file

# Dentro do Vim:
#
# ESC
# :wq
#
# O comando abaixo adiciona permissão de escrita ao grupo
sudo chmod g+w symbolic_mode_file


# ==========================================================
# CRIAR ARQUIVO PARA TESTAR MODO ABSOLUTO
# ==========================================================

# Criar o arquivo utilizando o Vim
sudo vi absolute_mode_file

# Dentro do Vim:
#
# ESC
# :wq
#
# Definir as permissões utilizando o modo absoluto
sudo chmod 764 absolute_mode_file


# ==========================================================
# VALIDAR AS PERMISSÕES
# ==========================================================

# Mostrar permissões, proprietário e grupo dos arquivos
ls -l


# ==========================================================
# ALTERAR PROPRIEDADE DE SHIPPING
# ==========================================================

# Definir eowusu como proprietário
# e Shipping como grupo
sudo chown -R eowusu:Shipping Shipping

# Verificar as alterações
ls -laR Shipping


# ==========================================================
# ALTERAR PROPRIEDADE DE SALES
# ==========================================================

# Definir nwolf como proprietário
# e Sales como grupo
sudo chown -R nwolf:Sales Sales

# Verificar as alterações
ls -laR Sales


# ==========================================================
# RESUMO DOS COMANDOS
# ==========================================================

# chown
# Altera o proprietário e/ou grupo de um arquivo ou diretório.
#
# chmod
# Altera as permissões de acesso.
#
# ls -l
# Mostra permissões, proprietário e grupo.
#
# ls -laR
# Mostra recursivamente a estrutura com detalhes.
#
# chmod g+w arquivo
# Adiciona permissão de escrita ao grupo.
#
# chmod 764 arquivo
# Define:
# Usuário: rwx
# Grupo:   rw-
# Outros:  r--
```
