set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type

if status is-interactive
  #  atuin init fish | source
end

if set -q abbr_init
   set -U abbr_init
   abbr -a so wow
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

alias copy='wl-copy'

# git

# confirm before overwriting something
#alias cp="cp -i"
#alias mv='mv -i'
#alias rm='rm -i'

# Misc
alias ydl='yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4'

alias wf='neofetch --config /home/aryan/.config/neofetch/configs/waifu.conf'

alias cfile='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

##
set EDITOR nvim

# load_nvm > /dev/stderr

export KUBECONFIG={$HOME}/.kube/config
export GOPATH=/home/aryan/go
export GOBIN={$GOPATH}/bin

starship init fish | source
zoxide init fish | source
pfetch

alias cd='z'

# pnpm
set -gx PNPM_HOME "/home/aryan/.local/share/pnpm"
set -gx CARGO_BIN "/home/aryan/.cargo/bin"
set -gx PATH "$PNPM_HOME" "$CARGO_BIN" $PATH
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/aryan/.local/google-cloud-sdk/path.fish.inc' ]; . '/home/aryan/.local/google-cloud-sdk/path.fish.inc'; end

