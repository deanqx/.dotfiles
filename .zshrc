export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.cargo/bin:$PATH"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Djdk.xml.totalEntitySizeLimit=1000000'
export ARDUINO_LANGUAGE_SERVER_CLIPATH="~/.arduino15/arduino-cli.yaml"
#export NODE_OPTIONS="--no-experimental-require-module"

ZSH_THEME="superjarin"

plugins=(git sudo history encode64 copypath )

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='bold'

function vim_wrapper()
{
    if [[ $# -eq 0 ]]; then
        if [[ -e .session.vim ]]; then
            nvim -S .session.vim
        else
            nvim .
        fi
    else
        command nvim "$@"
    fi
}

alias vim='vim_wrapper'

# Disable confirm
alias yayc='yay --noconfirm'
alias get_idf='. $HOME/esp/esp-idf/export.sh'
