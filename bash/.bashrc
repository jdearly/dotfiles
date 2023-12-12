# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

alias ..="cd .."
alias gst="git status"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias ubuntu_packages="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"
alias vim="nvim"
alias weather="curl wttr.in"
alias doppler="mpv --loop-file=inf https://radar.weather.gov/lite/N0R/FCX_loop.gif"
alias raudio="pulseaudio -k && sudo alsa force-reload"

export PATH="$HOME/neovim/build/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=Red
#export PS1='[\u@\h]-[\W$(__git_ps1 " (%s)")]\$ '
export PS1='[\W$(__git_ps1 " (%s)")]\$ '

# opam configuration
[[ ! -r /home/josh/.opam/opam-init/init.zsh ]] || source /home/josh/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/josh/.sdkman"
[[ -s "/home/josh/.sdkman/bin/sdkman-init.sh" ]] && source "/home/josh/.sdkman/bin/sdkman-init.sh"
