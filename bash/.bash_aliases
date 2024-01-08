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
alias bg-scale="feh --bg-scale ~/Pictures/island.png"
