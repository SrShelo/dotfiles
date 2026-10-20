# Interactive login configuration
# ZSH docs: https://zsh.sourceforge.io/Doc/
# ZSH Builtin commands: https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html
# ZSH Completion system (builtin funcions and more): https://zsh.sourceforge.io/Doc/Release/Completion-System.html
# or `$ man zshcompsys`

# ~~~~~~~~~ BASICS ~~~~~~~~~

# Custom binds for tty signals
stty quit '^T' # quit
stty intr '^G' # interrumpt
stty susp '^B' # suspend process

# Avoid unwanted behaviour
stty stop undef
stty start undef

# ~~~~~~~~~ SHELL BEHAVIOUR ~~~~~~~~~
setopt AUTO_CD # CD to the typed command if possible
setopt NOBEEP # Disable completely the beep sound
setopt NUMERIC_GLOB_SORT

# ~~~~~~~~~ HISTORY ~~~~~~~~~
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt HIST_IGNORE_SPACE
# └> Commands prefixed with a space won't be cached in history
setopt HIST_IGNORE_DUPS

autoload -Uz colors && colors

# ~~~~~~~~~ COMPLETION SYSTEM ~~~~~~~~~
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# └> make the completion case insensitive
zmodload zsh/complist
compinit -d "$XDG_STATE_HOME/zsh/zcompdump"
_comp_options+=(globdots) # include hidden files


# ~~~~~~~~~ EXTERNAL ~~~~~~~~~
# - fzf
# Arch
if [[ -d /usr/share/fzf ]]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
# Ubuntu
elif [[ -d /usr/share/doc/fzf ]]; then
    source /usr/share/doc/fzf/key-bindings.zsh
    source /usr/share/doc/fzf/completion.zsh
fi


# ~~~~~~~~~ MODULAR CONFIG FILES ~~~~~~~~~
# Aliases
[ -f "$ZDOTDIR/aliases.zsh" ] && source "$ZDOTDIR/aliases.zsh"

# Plugins
[ -f "$ZDOTDIR/plugins.zsh" ] && source "$ZDOTDIR/plugins.zsh"

# Functions
# for i in $(\ls -1 "$ZDOTDIR/functions"); do
#     echo 'un poco' $i
#     # $([[ "$i" = *'.zsh' ]] && echo "${i:0:-4}" || echo "$i") () {
#     $i () {
#         "$ZDOTDIR/functions/$i"
#     }
# done

# Widgets
[ -f "$ZDOTDIR/widgets.zsh" ] && source "$ZDOTDIR/widgets.zsh"

# fzf
zvm_after_init_commands+=('[ -f "$ZDOTDIR/fzf.zsh" ] && source "$ZDOTDIR/fzf.zsh"')
# └> Ensure the keybindings to be loaded properly
# after zsh-vim-mode plugin initialization.

# Keybindings
# NOTE: Bindings for stty signals are modified above in BASICS section
zvm_after_init_commands+=('[ -f "$ZDOTDIR/keybindings.zsh" ] && source "$ZDOTDIR/keybindings.zsh"')

# ~~~~~~~~~ END ~~~~~~~~~
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
