# -------------------------- MAIN -------------------------- #
instalaWhiptail(){
    sudo apt-get install -y whiptail
}
# --------------------------- BASE ------------------------- #
instalaWGet(){
    sudo apt-get install -y wget
}

instalaCURL(){
    sudo apt-get install -y curl
}

instalaVim(){
    sudo apt-get install -y vim

    #tagbar
    sudo apt-get install -y exuberant-ctags
}

instalaAtom(){
    sudo add-apt-repository -y ppa:webupd8team/atom
    sudo apt-get update
    sudo apt-get install -y atom
}

instalaScrot(){
    sudo apt-get install -y scrot
}

instalaTemas(){
    sudo add-apt-repository -y ppa:noobslab/themes
    sudo add-apt-repository -y ppa:papirus/papirus
    sudo add-apt-repository -y ppa:noobslab/icons
    sudo apt-get install -y arc-theme
    sudo apt-get install -y papirus-icon-theme
}

instalaDiversos(){
    echo "..."
}
# ---------------------------------------------------------- #

# -------------------------- JAVA -------------------------- #
instalaJDK(){
    sudo -E apt-get install -y oracle-java8-installer
    sudo -E apt-get install -y oracle-java8-set-default
}
# ---------------------------------------------------------- #

# -------------------------- NODE -------------------------- #
instalaNODE(){
    wget -qO- https://deb.nodesource.com/setup_8.x | sudo -E bash -
}
# ---------------------------------------------------------- #

# --------------------------- PHP -------------------------- #
instalaPHP(){
    sudo apt-get install -y php
}

instalaComposer(){
    # https://www.digitalocean.com/community/tutorials/how-to-install-and-use-composer-on-ubuntu-14-04
    curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
}
# ---------------------------------------------------------- #

# ------------------------- PYTHON3 ------------------------ #
instalaPython3(){
    sudo apt-get install -y python3 python3-pip python3-dev cmake
}
# ---------------------------------------------------------- #

# --------------------------- GO --------------------------- #
instalaGO(){
    #sudo add-apt-repository ppa:longsleep/golang-backports
    sudo apt-get install -y golang-go
}
# ---------------------------------------------------------- #

# ------------------------ DEV-EXTRA ----------------------- #
installPandc(){
    sudo apt-get install -y pandoc
}

installLatex(){
    sudo apt-get install -y texlive-full
}

installEvince(){
    sudo apt-get install -y evince
    # https://www.raspberrypi.org/forums/viewtopic.php?t=196070
    #(evince:14932): dbind-WARNING **: 05:14:44.336: Error retrieving accessibility bus address: org.freedesktop.DBus.Error.ServiceUnknown: The name org.a11y.Bus was not provided by any .service files
    sudo apt-get install -y at-spi2-core
}

installPostman(){
    # dicas postman: http://agiletesters.com.br/topic/1270/automatizando-testes-de-apis-rest-com-postman-e-newman
    #https://matheuslima.com.br/como-instalar-o-postman-no-ubuntu
    if [ ${ARQUITETURA} == 'x86_64' ]; then
        # 64-bit stuff here
        wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
    else
        # 32-bit stuff here
        wget https://dl.pstmn.io/download/latest/linux32 -O postman.tar.gz
    fi
    sudo tar -xzf postman.tar.gz -C /opt
    rm postman.tar.gz
    sudo ln -s /opt/Postman/Postman /usr/bin/postman
}

installUmbrello(){
    sudo apt-get install -y umbrello
}

# ---------------------------------------------------------- #


# ------------------------ USER-EXTRA ---------------------- #
installDiscord(){
    #https://www.edivaldobrito.com.br/discord-no-ubuntu-debian-mint/
    wget "https://discordapp.com/api/download?platform=linux&format=deb" -O discord.deb
    sudo dpkg -i discord.deb
    sudo apt-get install -f
    rm discord.deb
}

installCalibre(){
    #https://www.edivaldobrito.com.br/instalar-o-calibre-no-linux/
    sudo -v && wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"
}

installInkscape(){
    sudo add-apt-repository ppa:inkscape.dev/stable
    sudo apt-get update
    sudo apt-get install inkscape
}

installGimp(){
    sudo add-apt-repository ppa:otto-kesselgulasch/gimp
    sudo apt-get update
    sudo apt-get install gimp gimp-gmic gmic
    sudo apt-get install gimp-plugin-registry
}
# ---------------------------------------------------------- #
