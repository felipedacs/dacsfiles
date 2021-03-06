# config.sh - Padronização de variaveis e funções
#
# Site:             df.dacs.run
# Autor/Mantenedor: Felipe Silva - github.com/felipedacs
# ---------------------------------------------------------- #
# Esse sript define variáveis e funções comuns ao instalador
# principal em $HOME/dev/dotfiles e aos seus sub-instaladores
# em $HOME/dev/dotfiles/$DISTRO e
# $HOME/dev/dotfiles/$DISTRO/$INTERFACE_GRAFICA
#
# Utilização:
#   Ver em $HOME/dev/dotfiles/install.sh
# ---------------------------------------------------------- #

# ------------------------ VARIÁVEIS ----------------------- #
TEST_MODE=false                         # testes do script: true -> ./install.sh -t

ARQUITETURA=`uname -m`                  # 64 ou 32
DISTRO=$(lsb_release -i | cut -f 2-)    # Ubuntu
INTERFACE_GRAFICA=$XDG_CURRENT_DESKTOP  # LXDE

# cores
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
NC='\e[39m' # No Color
BLACK='\e[30m'
RED='\e[31m'
GREEN='\e[32m'
ORANGE='\e[33m'
BLUE='\e[34m'
PURPLE='\e[35m'
CYAN='\e[36m'
LIGHT_GRAY='\e[37m'
DARK_GRAY='\e[90m'
LIGHT_RED='\e[91m'
LIGHT_GREEN='\e[92m'
YELLOW='\e[93m'
LIGHT_BLUE='\e[94m'
LIGHT_PURPLE='\e[95m'
LIGHT_CYAN='\e[96m'
WHITE='\e[97m'

BG_NC='\e[49m' # No Color
BG_BLACK='\e[40m'
BG_RED='\e[41m'
BG_GREEN='\e[42m'
BG_ORANGE='\e[43m'
BG_BLUE='\e[44m'
BG_PURPLE='\e[45m'
BG_CYAN='\e[46m'
BG_LIGHT_GRAY='\e[47m'
BG_DARK_GRAY='\e[100m'
BG_LIGHT_RED='\e[101m'
BG_LIGHT_GREEN='\e[102m'
BG_YELLOW='\e[103m'
BG_LIGHT_BLUE='\e[104m'
BG_LIGHT_PURPLE='\e[105m'
BG_LIGHT_CYAN='\e[106m'
BG_WHITE='\e[107m'
# ---------------------------------------------------------- #

# ------------------------- FUNÇÕES ------------------------ #
# parametros em shell:
# https://www.vivaolinux.com.br/topico/Shell-Script/Passando-parametros-entre-funcoes
informaErro (){
    printf "${BG_RED}${WHITE}!!!!!!!!!!!!!!!!!!!!!! $1${BG_NC}${NC}\n"
}

informaAcao (){
    printf "${BG_PURPLE}${WHITE}______________________ $1${BG_NC}${NC}\n"
}

informaCenario (){
    printf "${BG_BLUE}${WHITE}====================== CENÁRIO $1${BG_NC}${NC}\n"
}

informaAcaoCenario (){
    printf "${BG_CYAN}${WHITE}---------------------- $1${BG_NC}${NC}\n"
}
# ---------------------------------------------------------- #
