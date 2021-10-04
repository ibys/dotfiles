# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# HIST_STAMPS="yyyy-mm-dd"
HIST_STAMPS="%y-%m-%d %H:%M"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  command-not-found
  direnv
  fasd
  fd
  fzf-tab
  git
  svn-fast-info
  wdnote
  you-should-use
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Alt-a to accept autosuggestion (equals END and Arrow-Right)
bindkey '^[a' autosuggest-accept
# Alt-r to execute autosuggestion
bindkey '^[r' autosuggest-execute
# zsh options
setopt +o nomatch # disable zsh error when pattern for filename generation has no matches
setopt glob_dots
# zsh history options
HISTSIZE=100000
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
export MANPATH="${HOME}/share/man:/usr/local/man:$MANPATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export COLOR_NONE='\e[0m'
export COLOR_BLACK='\e[0;30m'
export COLOR_GRAY='\e[1;30m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export COLOR_WHITE='\e[1;37m'
export WIN_IP="$(grep nameserver /etc/resolv.conf | awk '{print $2}')"
export WSL_IP="$(ip addr show eth0 | grep -w inet | awk '{print $2}' | awk -F'/' '{print $1}')"
# env
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export ORACLE_HOME="${HOME}/.local/lib/oracle/19.8/client64"
export LD_LIBRARY_PATH="${ORACLE_HOME}"
export PATH=".:${JAVA_HOME}/bin:${ORACLE_HOME}:${ORACLE_HOME}/sdk:${HOME}/bin:${HOME}/.local/bin:${PATH}"
# tools
export RIPGREP_CONFIG_PATH="${HOME}/.config/.ripgreprc"
export BAT_CONFIG_PATH="${HOME}/.config/bat/config"
[[ -f "${HOME}/.config/fzf/config" ]] && source "${HOME}/.config/fzf/config"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
#else
#  export EDITOR='mvim'
#fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
[[ -f ~/.myaliases ]] && source ~/.myaliases
[[ -f ~/.myfuncs ]] && source ~/.myfuncs

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ ${WSLENV} == "IDEA" ]] && [[ -f ~/.p10k.idea.zsh ]]; then
  ln -sf ~/.p10k.idea.zsh ~/.p10k.zsh
else
  ln -sf ~/.p10k.default.zsh ~/.p10k.zsh
fi
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# pip zsh completion (pip3 completion --zsh >> ~/.zshrc)
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip3

# fix WSL weird colors under /mnt (original: ow=34;42)
# UPDATE: seems like omz fixed this
# export LS_COLORS='ow=;34;'

zstyle ':completion:*:descriptions' format '[%d]'
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors "ow=;34"
zstyle ':fzf-tab:complete:*' fzf-flags '--preview-window=right:70%'
zstyle ':fzf-tab:complete:*' fzf-preview "$(echo $FZF_DEFAULT_PREVIEW | sed 's/{}/$realpath/g')"

GITSTATUS_LOG_LEVEL=DEBUG

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH_CUSTOM/plugins/fzf-tab/fzf-tab.plugin.zsh
