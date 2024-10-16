export ZSH="$HOME/.oh-my-zsh"

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
