if status is-interactive
    # Commands to run in interactive sessions can go here
end

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
alias ls="exa --group-directories-first"
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
