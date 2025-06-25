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

#alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
alias ls="exa --group-directories-first"
alias tre="exa -T"
# Git aliases
abbr gl "git log"
abbr gaa "git add ."
abbr gc "git checkout"
abbr gb "git branch"
abbr gs "git status"
<<<<<<< HEAD
abbr gm "git commit"
=======
abbr gd "git diff"
abbr gm "git commit"
abbr gmm "git commit --amend"
>>>>>>> 0f63b09 (Initial commit)

## Run StarShip promt ##
starship init fish | source
fish_add_path /home/shelo/.cargo/bin
