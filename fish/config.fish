if status is-interactive
    # Commands to run in interactive sessions can go here
end

#alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
alias update="~/.config/common_scripts/update-arch.sh"
alias lss="ls"
alias ls="exa --group-directories-first"
alias la="exa --group-directories-first -Gghla --time-style=long-iso"
alias laa="exa -1a --group-directories-first"
alias tre="exa -T"
alias please="sudo"

# Git aliases
abbr gl "git log"
abbr gaa "git add ."
abbr gc "git checkout"
abbr gb "git branch"
abbr gs "git status"
abbr gd "git diff"
abbr gm "git commit"
abbr gmm "git commit --amend"
abbr gpl "git pull origin"
abbr gps "git push origin"
abbr grs "git reset --soft"

# [[ KEY BINDINGS ]]

# Remapping BASIC console binds (ctrl-c, ctrl-z, etc...):
stty quit '^T' # send quit signal
stty intr '^G' # send interrumpt signal
stty susp '^B' # suspend process
# I'g thinking to change these.
# use `sasd` to see all actions with their bindings.

# FISH KEY BINDGINS
# help: file:///usr/share/doc/fish/cmds/bind.html

# Using vi-like keybindings
set -g fish_key_bindings fish_vi_key_bindings
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_external line
set fish_cursor_visual block
# help: file:///usr/share/doc/fish/cmds/fish_vi_key_bindings.html

# Erase some presets
bind --erase --preset ctrl-c
bind --erase --preset ctrl-v
bind --erase --preset ctrl-x
bind --erase --preset -M insert ctrl-c
bind --erase --preset -M insert ctrl-v
bind --erase --preset -M insert ctrl-x
bind --erase --preset -M visual ctrl-c
bind --erase --preset -M visual ctrl-v
bind --erase --preset -M visual ctrl-x
bind --erase --preset ctrl-j
bind --erase --preset -M insert ctrl-j
bind --erase --preset -M replace ctrl-j
bind --erase --preset -M replace_one ctrl-j

# Bind some
# make it like my neovim config
bind --erase --preset b
bind --erase --preset -M visual b
bind q backward-word
bind -M visual q backward-word

bind ctrl-c fish_clipboard_copy
bind ctrl-v fish_clipboard_paste
bind -M insert ctrl-c fish_clipboard_copy
bind -M insert ctrl-v fish_clipboard_paste

bind ctrl-z undo
bind ctrl-y redo
bind ctrl-shift-z redo
bind -M insert ctrl-z undo
bind -M insert ctrl-y redo
bind -M insert ctrl-shift-z redo

bind ctrl-w 'commandline -rt ""'
bind ctrl-w -M insert 'commandline -rt ""'

bind ctrl-backspace backward-kill-path-component
bind ctrl-backspace -M insert backward-kill-path-component
bind alt-backspace backward-kill-path-component
bind alt-backspace -M insert backward-kill-path-component

bind ctrl-g clear-commandline
bind ctrl-l 'reset' clear-screen
bind -M insert ctrl-g clear-commandline
# bind -M insert ctrl-shift-l 'reset' clear-screen

# bind ctrl-comma "cd $HOME/.config/fish && pwd && la && echo && fish_prompt"
bind ctrl-comma "cd $HOME/.config/fish" clear-screen
bind -M insert ctrl-comma "cd $HOME/.config/fish" clear-screen

# Prepend commands
bind alt-m 'fish_commandline_prepend man'
bind alt-n 'fish_commandline_prepend nohup'
bind -M insert alt-m 'fish_commandline_prepend man'
bind -M insert alt-n 'fish_commandline_prepend nohup'

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

export VISUAL=vim
if test -d $HOME/.local/bin
    export PATH="$PATH:$HOME/.local/bin"
end
if test -d $HOME/.bin
    export PATH="$PATH:$HOME/.bin"
end
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

## Run StarShip promt ##
starship init fish | source
fish_add_path /home/shelo/.cargo/bin
