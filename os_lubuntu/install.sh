#!/bin/bash

#chmod +x install.sh
#./install.sh

rotinaBase (){
    echo "=======================================================rotina base"

    #-----------------------
    #wget
    sudo apt install -y wget

    #-----------------------
    #curl
    sudo apt-get installl -y curl

    #-----------------------
    #vim
    sudo apt-get installl -y vim

    #-----------------------
    #atom
    sudo add-apt-repository -y ppa:webupd8team/atom
    sudo apt-get update
    sudo apt-get install -y atom

    #-----------------------
    #scrot
    sudo apt-get install -y scrot
    sudo apt-get install -y synapse

    #-----------------------
    #theme
    sudo add-apt-repository -y ppa:noobslab/themes
    sudo add-apt-repository -y ppa:papirus/papirus
    sudo add-apt-repository -y ppa:noobslab/icons
    #theme
    sudo apt-get install -y arc-theme
    #icones
    sudo apt-get install -y papirus-icon-theme

    #-----------------------
    #dotfiles
    ln -v -s -f $(pwd)/.bashrc ~/.bashrc
    ln -v -s -f $(pwd)/.inputrc ~/.inputrc
    ln -v -s -f $(pwd)/.bash_profile ~/.bash_profile
    ln -v -s -f $(pwd)/.bash_prompt ~/.bash_prompt
    ln -v -s -f $(pwd)/.exports ~/.exports
    ln -v -s -f $(pwd)/.functions ~/.functions
    ln -v -s -f $(pwd)/.aliases ~/.aliases
    ln -v -s -f $(pwd)/.scripts ~/.scripts

    ln -v -s -f $(pwd)/.vimrc ~/.vimrc
    ln -v -s -f $(pwd)/.vimrc.local ~/.vimrc.local
    ln -v -s -f $(pwd)/.vimrc.local.bundles ~/.vimrc.local.bundles
    ln -v -s -f $(pwd)/.vim/UltiSnips ~/.vim/UltiSnips

    if [ -d "$HOME/.vim/doc" ]; then
        echo "=======================================================apagando doc existente"
        rm -r ~/.vim/doc
    fi
    ln -v -s -f $(pwd)/.vim/doc ~/.vim/doc

    #lubunturc
    if [ -f "$HOME/.config/openbox/lubuntu-rc.xml" ]; then
        echo "=======================================================apagando doc existente"
        rm -r ~/.config/openbox/lubuntu-rc.xml
    fi
    ln -v -s -f $(pwd)/.config/openbox/lubuntu-rc.xml ~/.config/openbox/lubuntu-rc.xml

    #wallpaper
    pcmanfm --set-wallpaper="$HOME/dev/dotfiles/dw.jpg"

}

rotinaJava(){
    echo "=======================================================rotina java"

    #-----------------------
    # jdk
    sudo -E apt-get install -y oracle-java8-installer
    sudo -E apt-get install -y oracle-java8-set-default
}

rotinaNode (){
    echo "=======================================================rotina node"

    #-----------------------
    #node
    wget -qO- https://deb.nodesource.com/setup_8.x | sudo -E bash -
}

rotinaPHP (){
    echo "=======================================================rotina php"

    #-----------------------
    #php
    apt-get install -y php

    #-----------------------
    #composer
    sudo curl -s https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
}

rotinaPython3 (){
    echo "=======================================================rotina python"

    #-----------------------
    #python3
    sudo apt-get install -y python3 python3-pip python3-dev cmake
}

rotinaGo (){
    echo "=======================================================rotina go"

    #-----------------------
    # go
    #sudo add-apt-repository ppa:longsleep/golang-backports
    sudo apt-get install -y golang-go
}

rotinaDevBase (){
    echo "=======================================================rotina dev base"

    #-----------------------
    #pandoc
    sudo apt-get install -y pandoc
}



whiptail --title "installer.sh for lubuntu" --checklist --separate-output \
    "↓, ↑, <space>, <tab> and <enter> to confirm\nSerão instalados: wget, curl, vim, scrot, synapse, tema, dotfiles"\
    20 80 12 \
    "dev-java" "jdk" OFF \
    "dev-node" "node, npm" ON \
    "dev-php" "php, composer" ON \
    "dev-python3" "python3, pip" ON \
    "dev-go" "go" ON \
    "dev-base" "pandoc  " ON \
    2>arquivoResultadosWhiptail

# teste para ver se o arquivo está vazio
if [ -s arquivoResultadosWhiptail ]
then
    echo "=======================================================INICIO"

    # rotina da base de instalação
    rotinaBase

    # ler e executar rotinas escolhidas
    while read choice
    do
        case $choice in
            dev-java) rotinaJava
                ;;
            dev-node) rotinaNode
                ;;
            dev-php) rotinaPHP
                ;;
            dev-python3) rotinaPython3
                ;;
            dev-go) rotinaGo
                ;;
            dev-base) rotinaDevBase
                ;;
        esac
        sudo -E apt-get update
    done < arquivoResultadosWhiptail
else
    echo "=======================================================CANCELADO"
fi


# referencias: 
# Filipe Deschamps: https://github.com/filipedeschamps/dotfiles
# gbencke: https://github.com/gbencke/dotfiles
# Denys Dovhan: https://github.com/denysdovhan/dotfiles
# Mathias Bynens: https://github.com/mathiasbynens/dotfiles
# Lars Kappert: https://github.com/webpro/dotfiles
# Lars Kappert: https://github.com/webpro/awesome-dotfiles

#ln -s $(pwd)/.vimrc ~/testes/.vimrc
