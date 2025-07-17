if status is-interactive
    # Commands to run in interactive sessions can go here
end

# [[ Remapping FUNDAMENTAL console binds ]]
stty quit '^T' # send quit signal
stty intr '^G' # send interrumpt signal
stty susp '^B' # suspend process
# use `sasd` to see all actions with their bindings.

# [[ Fish keybindings ]]
# Erase some
bind -e --preset ctrl-c
bind -e --preset ctrl-v
bind -e --preset ctrl-x

# Bind some
bind ctrl-c fish_clipboard_copy
bind ctrl-v fish_clipboard_paste

bind ctrl-z undo
bind ctrl-shift-z redo

bind ctrl-shift-l 'reset' clear-screen
bind ctrl-g clear-commandline

# Prepend commands
bind alt-m 'fish_commandline_prepend man'
bind alt-n 'fish_commandline_prepend nohup'

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

#alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
alias update="~/.config/fish/scripts/update-arch.sh"
alias lss="ls"
alias ls="exa --group-directories-first"
alias la="exa --group-directories-first -Gghla"
alias laa="exa -1a --group-directories-first"
alias tre="exa -T"
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

## Run StarShip promt ##
starship init fish | source
fish_add_path /home/shelo/.cargo/bin
