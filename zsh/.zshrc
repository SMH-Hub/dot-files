# My zsh config
# Enable colour
autoload -U colors && colors

# Set Prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{220}(%b)%f'
PROMPT='%(?.%F{green}√.%F{red}?)%f %B%F{240}%5~%f $vcs_info_msg_0_%b %# '

# History settings
HISTFILE=~/.zsh_hist
HISTSIZE=10000
SAVEHIST=1000

# options
unsetopt autocd extendedglob

# Set Vi keybinds
bindkey -v

# tab complete settings
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Vi keybinds for menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Load auto suggestions
source $HOME/dot-files/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Load syntax highlighting
source $HOME/dot-files/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
