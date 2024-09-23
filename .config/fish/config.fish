set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type

if status is-interactive
  starship init fish | source
  zoxide init fish | source
  pfetch
end

# Functions needed for !! and !$
function history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function history_previous_command_arguments
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
  bind -Minsert ! history_previous_command
  bind -Minsert '$' history_previous_command_arguments
else
  bind ! history_previous_command
  bind '$' history_previous_command_arguments
end

# Aliases

# cd to zoxide
alias cd='z'

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

# Misc
alias copy='wl-copy'
alias ydl='yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4'
alias wf='neofetch --config /home/aryan/.config/neofetch/configs/waifu.conf'
alias cfile='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

export KUBECONFIG={$HOME}/.kube/config
export GOPATH=/home/aryan/go
export GOBIN={$GOPATH}/bin

set EDITOR nvim

# pnpm
set -gx PNPM_HOME "/home/aryan/.local/share/pnpm"
set -gx CARGO_BIN "/home/aryan/.cargo/bin"
set -gx PATH "$PNPM_HOME" "$CARGO_BIN" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# GCP
if [ -f '/home/aryan/.local/google-cloud-sdk/path.fish.inc' ]; . '/home/aryan/.local/google-cloud-sdk/path.fish.inc'; end

