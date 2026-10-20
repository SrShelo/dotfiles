# Plugins & loader

# NOTE: Plugins activation at the end

# Loader
ZPLUGINDIR="$XDG_DATA_HOME/zsh/plugins"
mkdir -p $ZPLUGINDIR

local firstCall='yes'
_zplugin_load() {
    local plugin_path="$ZPLUGINDIR/$2"
    if [[ ! -d $plugin_path ]]; then
        if [[ $firstCall == 'yes' ]]; then
            echo "Do you wish to avoid the installation of missing zsh plugins right now?"
            printf '[y/N]: ' ; read -k1 -t10 foo ; echo
            if [[ "$foo" == 'y' || "$foo" == 'Y' ]]; then
                firstCall=''
                printf "\033[1;33mAny missing zsh plugin won't be installed right now.\n\033[0;0m" >&2
            else
                [ -z $foo ] && printf "\033[1;33mTime out.\n\033[0;0m" >&2
                firstCall='install missing plugins'
                printf "\033[1;32mStarting the installation of missing plugins...\n\033[0;0m"
            fi
            unset foo
        fi
        if [[ $firstCall == 'install missing plugins' ]]; then
            git clone --depth=1 "https://github.com/${1}/${2}" "$plugin_path" \
                || { echo "ERROR: failed to install ${2} >&2"; return 1; }
        fi
    fi
    [ -d $plugin_path ] && source "${plugin_path}/${2}.plugin.zsh"
}

zplugin_update() {
    # local dir
    for dir in "${ZPLUGINDIR}"/*/; do
        echo "Updating ${dir:t}..."
        git -C "$dir" pull --ff-only
    done
}

# Plugins
# └> Just comment to deactivate
# Consider some plugins must load before others
_zplugin_load zdharma-continuum fast-syntax-highlighting
_zplugin_load zsh-users zsh-autosuggestions
_zplugin_load zsh-users zsh-history-substring-search
_zplugin_load jeffreytse zsh-vi-mode # Don't deactivate this, that can break some configs

unset firstCall
# Some options
ZVM_SYSTEM_CLIPBOARD_ENABLED=true
