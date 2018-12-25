configuraInterfaceGrafica(){
    # existe lubuntu-rc?
        [ -f "$HOME/.config/openbox/lubuntu-rc.xml" ] && rm -r $HOME/.config/openbox/lubuntu-rc.xml
        informaAcaoCenario "CONFIGURANDO ATALHOS $INTERFACE_GRAFICA"
        ln -v -s -f $(pwd)/$DISTRO/$INTERFACE_GRAFICA/openbox/lubuntu-rc.xml $HOME/.config/openbox/lubuntu-rc.xml

        informaAcaoCenario "CONFIGURANDO WALLPAPER $INTERFACE_GRAFICA"
        pcmanfm --set-wallpaper="$HOME/dev/dotfiles/images/dotwallpaper.jpg"
}
