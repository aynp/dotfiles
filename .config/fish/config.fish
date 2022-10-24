set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

#export SUDO_PROMPT="[sudo] password for aryan:"

# Aliases

# ls to exa
alias ls='exa --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias la='exa -al --color=always --group-directories-first'

alias lt='exa -T --color=always --group-directories-first'
alias lat='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

# package managers
alias update='sudo pacman -Syu && yay'
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# git

# confirm before overwriting something
#alias cp="cp -i"
#alias mv='mv -i'
#alias rm='rm -i'

# Misc
alias ydl='yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4'

alias wf='neofetch --config /home/aryan/.config/neofetch/configs/waifu.conf'

alias cfile='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

starship init fish | source
zoxide init fish | source
pfetch

alias cd='z'

