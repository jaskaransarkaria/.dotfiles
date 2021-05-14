#! /bin/zsh
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

# The function search path ($fpath) defines a set of directories, which contain files that can be marked to be loaded automatically when the function they contain is needed for the first time.
fpath=(
	$HOME/utils/.dotfiles/zsh/plugins/
	$HOME/.cache/antibody/
	$fpath
)

# Notes
# The autoload command load a file containing shell commands. To find this file, Zsh will look in the directories of the Zsh file search path, defined in the variable $fpath, and search a file called compinit.

# When compinit is found, its content will be loaded as a function. The function name will be the name of the file. You can then call this function like any other shell function.

# -U means don't expand this as an alias

# Completion
autoload -Uz colors && colors
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r $HOME/utils/.dotfiles/zsh/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' $HOME/utils/.dotfiles/zsh/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Prompt
autoload -Uz promptinit
promptinit
prompt gentoo

# provides a menu list from where we can highlight and select completion results
zmodload -i zsh/complist

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' menu select # select completions with arrow keys
# zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Correction
setopt correctall
setopt autocd
setopt extendedglob
setopt always_to_end # move cursor to end if word had one match

# Set History
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
# prevent history from being recorded -- prefix with whitespace
setopt hist_ignore_space

source ~/utils/.dotfiles/fonts/*.sh

# Git Prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Prompt
PS1='%F{98}jaskaran %F{green}%c %F{yellow}→ %F{99} '

# alias
alias cat="bat"
alias ls="ls -a --color=auto"
alias toClipBoard="xclip -i -selection clipboard"

# Vi mode
bindkey -v # switch between INSERT and NORMAL mode with `esc`
export KEYTIMEOUT=1

# Load Vi cursor plugin
autoload -Uz cursor_mode; cursor_mode

# Vim keys for menuselect
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Edit commands in text editor -- <3 this
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# delete key deletes	
#bindkey '^[[3~' delete-char
#bindkey '^[3;5~' delete-char

# up and down keys for history search ?
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

# Plugins
# antibody plugin manager
source <(antibody init)
antibody bundle "
	zdharma/fast-syntax-highlighting
	zsh-users/zsh-autosuggestions
	zsh-users/zsh-history-substring-search
	zsh-users/zsh-completions
	ohmyzsh/ohmyzsh path:plugins/git
	ohmyzsh/ohmyzsh path:plugins/aws
	ohmyzsh/ohmyzsh path:plugins/colored-man-pages
	ohmyzsh/ohmyzsh path:plugins/jsontools
	ohmyzsh/ohmyzsh path:plugins/command-not-found
	ohmyzsh/ohmyzsh path:plugins/emoji
	ohmyzsh/ohmyzsh path:plugins/node
	ohmyzsh/ohmyzsh path:plugins/npm
	ohmyzsh/ohmyzsh path:plugins/dotenv
	ohmyzsh/ohmyzsh path:plugins/docker
	ohmyzsh/ohmyzsh path:plugins/kubectl
	ohmyzsh/ohmyzsh path:plugins/python
	ohmyzsh/ohmyzsh path:plugins/pip
	ohmyzsh/ohmyzsh path:plugins/man
	"

