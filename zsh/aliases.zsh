
alias update="$XDG_CONFIG_HOME/common_scripts/update-arch.sh"
alias please="sudo"
alias diff='diff --color=auto'
alias df='df -h'
alias -- -='cd -' # `$ -` -> `$ cd -`
alias Bconverter="numfmt --from=auto --to=iec-i --format='%.4f'"
alias mylsblk="lsblk -o LABEL,TYPE,FSTYPE,NAME,SIZE,MOUNTPOINTS | grep -v 'loop'"

# ~~~~~~ GIT COMMANDS ~~~~~~
# TODO: make these alias abreviations like abbr in fish shell.
alias gl="git log"
alias gaa="git add ."
alias gc="git checkout"
alias gb="git branch"
alias gs="git status"
alias gd="git diff"
alias gm="git commit"
alias gmm="git commit --amend"
alias gpl="git pull"
alias gps="git push"
alias grs="git reset --soft"
alias gpr="git pull --rebase"
alias grundo="git rebase --abort"


# ~~~~~~ PRETTIER COMMANDS ~~~~~~
# This section defines aliases as prettier options for common commands
# For using original commands prepend `\` or `command `
# like `\ls` or `command ls`.

alias tree="exa -T --icons auto"
alias help='bat -plhelp'
alias tetris='autoload -Uz tetriscurses ; tetriscurses'
alias .grep='rg' #ripgrep
alias ls="exa --group-directories-first"
alias .ls="exa --group-directories-first --icons"
alias la="exa --group-directories-first -Gghla --time-style=long-iso --git --icons"
alias laa="exa -1a --group-directories-first"

alias .find='fd -H'
alias ..find='() {
    fd -H ${@} | \tree --fromfile | bat
}'

alias man='() {
    if echo "${@}" | \grep -- '--help'  &> /dev/null; then
        man "${@}" | bat -plhelp
    else
        man "${@}" | bat -plman
    fi
}'
# └>
# NOTE: This causes parse error in commands like
# MANPAGER='bat -plman' man git-pull`, but it doesn't matter.

# Replacement for cat
# Arch
if command -v bat &> /dev/null; then
    alias cat='bat -p'
    alias .cat='bat'
# Old debian releases
elif command -v batcat &> /dev/null; then
    alias cat='batcat -p'
    alias .cat='batcat'
fi

