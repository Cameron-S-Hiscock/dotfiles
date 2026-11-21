#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[ -z "$PS1" ] && return

alias tism='sl -Ge'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -la'
alias gpom='git push origin main'
alias clr='clear && ll'
alias jv='cd src/main/java/com/cameronsh'
alias kt='cd src/main/kotlin/com/cameronsh'
alias vim='nvim'
alias update='sudo pacman -Syu --noconfirm && yay -Syu --noconfirm'
alias libreoffice='SAL_USE_VCLPLUGIN=gtk3 GTK_THEME=Adwaita:dark soffice'
cl() {
    cd "$1" && ll && tism;
}

PS1='[\u@\h \W]\$ '
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
. "$HOME/.cargo/env"

if [ "$TERM" = "xterm-kitty" ] && [ -z "$NO_FASTFETCH" ]; then
    fastfetch
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
