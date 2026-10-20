# Keybindings
# └> Bind to stty signals are modified in .zshrc file.
#
# zvm_bindkey replaces bindkey since I use zsh-vi-mode plugin
# more info about this plugin: https://github.com/jeffreytse/zsh-vi-mode

# Some environment variables don't work in .zshenv
export KEYTIMEOUT=0 # seconds = x | 100

zvm_bindkey viins '^K' history-substring-search-up
zvm_bindkey viins '^J' history-substring-search-down

zvm_bindkey viins '^H' backward-delete-word

zvm_bindkey viins '^[m' 'udw-buffer-prepend-man '
zvm_bindkey viins '^[n' 'udw-buffer-prepend-nohup '
zvm_bindkey viins '^[s' 'udw-buffer-prepend-please '
zvm_bindkey viins '^[/' udw-buffer-prepend-backslash

# Toggle functions:
# ^F: Leader key
# t: Toggle
# ^Fts: toggle suggestions
# Useful while streaming or recording the screen.
# zvm_bindkey viins '^Fts' autosuggest-toggle

zvm_bindkey viins '^F' udw-more-bindings
# └> This reads input and trigger actions, but it is not
# affected by KEYTIMEOUT variable. Actions and bindings can
# be seen and configured in ./widgets.zsh in the function
# udf-more-bindings.

function zvm_after_lazy_keybindings () {
# └> zsh-vi-mode will auto execute this function after
# lazy keybindings are loaded.
# vicmd commands:
    zvm_bindkey vicmd '^K' history-substring-search-up
    zvm_bindkey vicmd '^J' history-substring-search-down
    zvm_bindkey vicmd '^H' backward-delete-word
    zvm_bindkey vicmd '^[m' 'udw-buffer-prepend-man '
    zvm_bindkey vicmd '^[n' 'udw-buffer-prepend-nohup '
    zvm_bindkey vicmd '^[s' 'udw-buffer-prepend-sudo '
    zvm_bindkey vicmd '^[/' udw-buffer-prepend-backslash
}
