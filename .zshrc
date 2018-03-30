# If moving from bash, go ahead and update the PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=/home/josh/.oh-my-zsh

ZSH_THEME="agnoster"

export UPDATE_ZSH_DAYS=13

ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

source /home/josh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
