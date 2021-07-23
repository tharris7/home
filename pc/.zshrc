# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
# DISABLE_MAGIC_FUNCTIONS=true

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
plugins=(git tmux tmuxinator alias-finder)

export EDITOR='vim'

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias l='less'
alias hi='history'
alias path='echo -e ${PATH//:/\\n}'
alias ..='cd ..'
alias x='exit'
alias q='exit'
alias c='clear'
alias aw='ps aux | grep apache'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

#-------------------------------------------------------------
# git aliases
#-------------------------------------------------------------
alias g='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias ga='git add --update'
alias gc='git commit -v -m'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -Alv"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.

alias w="cd /cygdrive/c/work"
alias h="cd /cygdrive/c/work/hyperv"
alias t="cd /cygdrive/c/Users/timha"
alias gup="git checkout master && git fetch upstream && git merge upstream/master && git push"
alias tmu="script -c tmux /dev/null"
alias vs="vagrant ssh"
alias vrl="vagrant reload"
alias vup="vagrant up"
alias vht="vagrant halt"
alias wr="cd /cygdrive/c/work/webroot"

# Git sync wrapper with optional branch parameter to make it easier to sync your branch.
#
# Usage 1: Sync master only.
#       gs
#
# Usage 2: Sync master, then checkout and rebase.
#       gs my-feature-branch
#
function gs() {
        local branch="${1}"
        local branchPrettyCmd=""

        echo "----------------"
        echo "Performing git sync with master on the current branch."
        if [ -n "$branch" ]; then
                echo "+ Checking out $branch after and rebasing master."
                branchPrettyCmd="&& git checkout $branch && git rebase master"
        fi
        echo "----------------"

        # This is on two lines because it's an easy way to achieve newlines in debugging output with embedded variables.
        echo "Running:"
        if [ -n "$branch" ]; then
                echo -e "git checkout master && git fetch upstream && git merge upstream/master && git push \\"
                echo -e "\t$branchPrettyCmd"
        else
                echo -e "git checkout master && git fetch upstream && git merge upstream/master && git push"
        fi
        echo "----------------"

        git checkout master && git fetch upstream && git merge upstream/master && git push

        if [ $? -eq 0 ]; then
                if [ -n "$branch" ]; then
                        git checkout $branch && git rebase master
                fi
        else
                echo -e "WARNING: Master sync command failed, this should not happen. Figure out why."
        fi

        echo "----------------"
}

# Git sync wrapper with optional branch parameter to make it easier to sync your branch.
#
# Usage 1: Sync master only.
#       gs
#
# Usage 2: Sync master, then checkout and rebase.
#       gs my-feature-branch
#
function gsti() {
        local branch="${1}"
        local branchPrettyCmd=""

        echo "----------------"
        echo "Performing git sync with TI on the current branch."
        if [ -n "$branch" ]; then
                echo "+ Checking out $branch after and rebasing master."
                branchPrettyCmd="&& git checkout $branch && git rebase tourism-ireland"
        fi
        echo "----------------"

        # This is on two lines because it's an easy way to achieve newlines in debugging output with embedded variables.
        echo "Running:"
        if [ -n "$branch" ]; then
                echo -e "git checkout tourism-ireland && git fetch upstream && git merge upstream/master && git push \\"
                echo -e "\t$branchPrettyCmd"
        else
                echo -e "git checkout tourism-ireland && git fetch upstream && git merge upstream/master && git push"
        fi
        echo "----------------"

        git checkout tourism-ireland && git fetch upstream && git merge upstream/tourism-ireland && git push

        if [ $? -eq 0 ]; then
                if [ -n "$branch" ]; then
                        git checkout $branch && git rebase tourism-ireland
                fi
        else
                echo -e "WARNING: Master sync command failed, this should not happen. Figure out why."
        fi

        echo "----------------"
}

_simple_git_branch_names () {
      compadd "${(@)${(f)$(git branch)}#??}"
  }
compdef _simple_git_branch_names gs

#w # open work dir

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
