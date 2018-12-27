#!/usr/bin/env bash
#
# install.sh - Padrão de instalação inicial no linux
#
# Site:             df.dacs.run
# Autor/Mantenedor: Felipe Silva - github.com/felipedacs
# ---------------------------------------------------------- #
# Esse sript instala pacotes, programas, temas e arquivos de
# configuração selecionados para linux conforme o cenário
# escolhido na interface gráfica.
#
# Utilização comum:
#   chmod +x install.sh
#   ./install.sh
#
# Utilização para testes:
#   chmod +x install.sh
#   ./install.sh -t
# ---------------------------------------------------------- #
# Testes:
#
# bash --version #versão do bash
#   4.4.19
#
# Sistema operacional:
#   Lubuntu 18.10 em:
#   Xubuntu 18.10 em:
# ---------------------------------------------------------- #
# Agradecimentos:
#
# Matheus Muller:
#   https://www.udemy.com/shell-script-do-basico-ao-profissional/
#
# gbencke durante o meetup de python:
#   https://github.com/gbencke
#
# A todos que disponibilizaram seus dotfiles online:
#   Luke Smith: https://github.com/LukeSmithxyz/voidrice
#   Filipe Deschamps: https://github.com/filipedeschamps/dotfiles
#   gbencke: https://github.com/gbencke/dotfiles
#   Denys Dovhan: https://github.com/denysdovhan/dotfiles
#   Mathias Bynens: https://github.com/mathiasbynens/dotfiles
#   Lars Kappert: https://github.com/webpro/dotfiles
#   Lars Kappert: https://github.com/webpro/awesome-dotfiles
# ---------------------------------------------------------- #

# ------------------------- IMPORT ------------------------- #
source ./config.sh
source $HOME/dev/dotfiles/$DISTRO/install.sh
source $HOME/dev/dotfiles/$DISTRO/$INTERFACE_GRAFICA/install.sh
# ---------------------------------------------------------- #

# ------------------------ VARIÁVEIS ----------------------- #

# ---------------------------------------------------------- #

# ------------------------- TESTES ------------------------- #

# ---------------------------------------------------------- #

# ------------------------- FUNÇÕES ------------------------ #
linkandoDotfiles(){
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install -y
    ln -v -s -f $(pwd)/dotfiles/.fzf.bash $HOME/.fzf.bash

    ln -v -s -f $(pwd)/dotfiles/.bashrc $HOME/.bashrc
    ln -v -s -f $(pwd)/dotfiles/.inputrc $HOME/.inputrc
    ln -v -s -f $(pwd)/dotfiles/.bash_profile $HOME/.bash_profile
    ln -v -s -f $(pwd)/dotfiles/.bash_prompt $HOME/.bash_prompt
    ln -v -s -f $(pwd)/dotfiles/.exports $HOME/.exports
    ln -v -s -f $(pwd)/dotfiles/.functions $HOME/.functions
    ln -v -s -f $(pwd)/dotfiles/.aliases $HOME/.aliases
    ln -v -s -f $(pwd)/dotfiles/.scripts $HOME/.scripts

    ln -v -s -f $(pwd)/dotfiles/.vimrc $HOME/.vimrc
    ln -v -s -f $(pwd)/.vim/dacs-snippets $HOME/.vim

    # existe a pasta doc?
    [ -d "$HOME/.vim/doc" ] && rm -r $HOME/.vim/doc
    informaAcaoCenario "CONFIGURANDO HELP VIM"
    ln -v -s -f $(pwd)/.vim/doc $HOME/.vim/doc
}

cenarioBase (){
    informaCenario "BASE"
    if [[ "$TEST_MODE" = false ]]; then
        informaAcaoCenario "INSTALANDO WGET"
        instalaWGet

        informaAcaoCenario "INSTALANDO CURL"
        instalaCURL

        informaAcaoCenario "INSTALANDO VIM"
        instalaVim

        informaAcaoCenario "INSTALANDO ATOM"
        instalaAtom

        informaAcaoCenario "INSTALANDO SCROT"
        instalaScrot

        informaAcaoCenario "INSTALANDO TEMAS"
        instalaTemas

        informaAcaoCenario "LINKANDO DOTFILES"
        linkandoDotfiles

        configuraInterfaceGrafica

        instalaDiversos
    fi
}

cenarioJava(){
    informaCenario "JAVA"
    if [[ "$TEST_MODE" = false ]]; then
        informaCenario "INSTALANDO JDK"
        instalaJDK
    fi
}

cenarioNode(){
    informaCenario "NODE"
    if [[ "$TEST_MODE" = false ]]; then
        informaCenario "NODE"
        instalaNODE
    fi
}

cenarioPHP(){
    informaCenario "PHP"
    if [[ "$TEST_MODE" = false ]]; then
        informaCenario "INSTALANDO PHP"
        instalaPHP

        informaCenario "INSTALANDO COMPOSER"
        instalaComposer
    fi
}

cenarioPython3(){
    informaCenario "INSTALANDO PYTHON3"
    if [[ "$TEST_MODE" = false ]]; then
        informaAcaoCenario "INSTALANDO PYTHON3"
        instalaPython3
    fi
}

cenarioGo(){
    informaCenario "GO"
    if [[ "$TEST_MODE" = false ]]; then
        informaAcaoCenario "INSTALANDO INSTALANDO GO"
        instalaGO
    fi
}

cenarioDevExtra(){
    informaCenario "EXTRA PARA DESENVOLVIMENTO"
    if [[ "$TEST_MODE" = false ]]; then
        informaAcaoCenario "INSTALANDO PANDOC"
        installPandc

        informaAcaoCenario "INSTALANDO LATEX"
        installLatex

        informaAcaoCenario "INSTALANDO EVINCE"
        installEvince

        informaAcaoCenario "INSTALANDO POSTMAN"
        installPostman

        informaAcaoCenario "INSTALANDO UMBRELLO"
        installUmbrello
    fi
}

cenarioUserExtra(){
    informaCenario "CONFIGURAÇÕES CASUAIS EXTRAS"
    if [[ "$TEST_MODE" = false ]]; then
        informaAcaoCenario "INSTALANDO DISCORD"
        installDiscord

        informaAcaoCenario "INSTALANDO CALIBRE"
        installCalibre

        informaAcaoCenario "INSTALANDO INKSCAPE"
        installInkscape

        informaAcaoCenario "INSTALANDO GIMP"
        installGimp
    fi
}

# ---------------------------------------------------------- #

# -------------------------- MAIN -------------------------- #
instalaWhiptail

[ "$1" = "-t" ] && TEST_MODE=true

whiptail --title "installer.sh for lubuntu" --checklist --separate-output \
    "↓, ↑, <space>, <tab> and <enter> to confirm"\
    20 70 12 \
    "user-dev-base" "" ON \
    "user-extra" "" OFF \
    "dev-java" "" OFF \
    "dev-node" "" ON \
    "dev-php" "" ON \
    "dev-python3" "" ON \
    "dev-go" "" ON \
    "dev-extra" "" ON \
    2>arquivoResultadosWhiptail

# teste para ver se o arquivo está vazio
if [ -s arquivoResultadosWhiptail ]
then

    [ "$TEST_MODE" = true ] && informaAcao "INICIO DA INSTALAÇÃO COMO TESTE"
    [ "$TEST_MODE" = false ] && informaAcao "INICIO DA INSTALAÇÃO"

    cenarioBase

    # ler e executar cenarios escolhidos
    while read choice
    do
        case $choice in
            dev-java) cenarioJava
                ;;
            dev-node) cenarioNode
                ;;
            dev-php) cenarioPHP
                ;;
            dev-python3) cenarioPython3
                ;;
            dev-go) cenarioGo
                ;;
            dev-extra) cenarioDevExtra
                ;;
            user-extra) cenarioUserExtra
                ;;
        esac
    done < arquivoResultadosWhiptail
    informaAcao "UPDATE"
    sudo -E apt-get update
else
    informaAcao "CANCELADO"
fi

# ---------------------------------------------------------- #
