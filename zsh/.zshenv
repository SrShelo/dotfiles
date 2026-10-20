# Environment variables
# NOTE: Setup $ZDOTDIR variable in /etc/zsh/zshenv to "$HOME/.config/zsh" to make this directory readble by zsh.

# ~* XDG variables *~
# https://specifications.freedesktop.org/basedir/latest/#basics
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
local arr=($XDG_CACHE_HOME $XDG_DATA_HOME $XDG_STATE_HOME)
for i in "${arr[@]}"; do
    mkdir -p "$i/zsh"
done
unset arr

# ~* Editor *~
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER='less'
export TERMINAL="kitty -e"

export XCURSOR_SIZE=30
export XCURSOR_THEME=retrosmart-xcursor-black
export QT_QPA_PLATFORMTHEME=qt6ct

# ~* MAN *~
# This make man command colorful, but I defined an alias which make
# it work even better. Use `\man` and `man` to see the difference.
# Arch
if command -v bat &> /dev/null; then
    export MANPAGER='bat -plman'
# Old debian releases
elif command -v batcat &> /dev/null; then
    export MANPAGER='batcat -plman'
fi

# ~* PATH *~
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"
[ -d "$HOME/.bin" ] && export PATH="$PATH:$HOME/.bin"

[ -d "$HOME/.cabal/bin" ] && export PATH="$PATH:$HOME/.cabal/bin"
[ -d "$HOME/.ghcup/bin" ] && export PATH="$PATH:$HOME/.ghcup/bin"
# └> Haskell programs

# ~* PLUGINS *~
ZVM_LAZY_KEYBINDINGS=true
