# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jaskaran/.oh-my-zsh"
export GOPATH="/home/jaskaran/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/npm/bin:$HOME/kubectx"
export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"
export KUBE_EDITOR="code -w"
export NPM_TOKEN="8c90dc86-da34-46eb-991a-7fb09d7666f9"
export TERM="xterm-256color"
export OPENFAAS_URL="https://openfaas.jobspeed.uk"

 #Set name of the theme to load --- if set to "random", it will
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

source ~/.fonts/*.sh
#POWERLEVEL9K_USER_DEFAULT_BACKGROUND=022
#POWERLEVEL9K_USER_DEFAULT_FOREGROUND=220
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=015
#POWERLEVEL9K_DIR_HOME_FOREGROUND=015
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9k_SHORTEN_DIR_LENGTH=2
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon newline dir vcs)
#POWERLEVEL9K_MODE='awesome-fontconfig'
#ZSH_THEME="powerlevel9k/powerlevel9k"

# These were always commented out for POWERLEVEL9k
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user newline dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator

# Norm Theme
PROMPT='%{$fg[red]%}jaskaran %{$fg[green]%}%c %{$fg[yellow]%}→ $(git_prompt_info)$(hg_prompt_info)%{$reset_color%}'
#λ
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%} → %{$reset_color%}"
ZSH_THEME_HG_PROMPT_PREFIX="%{$fg[blue]%}hg %{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$fg[yellow]%} → %{$reset_color%}"

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
#powerlevel9k/powerlevel9k# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git man pip python ubuntu colored-man-pages jsontools command-not-found emoji aws node npm dotenv docker kubectl)

source $ZSH/oh-my-zsh.sh

# User configuration
bindkey "\e[1;3D" end-of-line
bindkey "\e[1;3A" end-of-line
bindkey "\e[1;3B" end-of-line
bindkey "\e[1;3C" end-of-line
bindkey "\e[1;7D" end-of-line
bindkey "\e[1;7A" end-of-line
bindkey "\e[1;7B" end-of-line
bindkey "\e[1;7C" end-of-line


# Custom Plugins
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(dirname $(gem which colorls))/tab_complete.sh
fpath=($fpath ~/.zsh/completion)

#export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jaskaran/.sdkman"
[[ -s "/home/jaskaran/.sdkman/bin/sdkman-init.sh" ]] && source "/home/jaskaran/.sdkman/bin/sdkman-init.sh"

# added by travis gem
[ ! -s /home/jaskaran/.travis/travis.sh ] || source /home/jaskaran/.travis/travis.sh
