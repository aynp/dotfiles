set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type

source $HOME/.config/fish/abbr.fish
if test -f $HOME/.config/fish/secrets.fish
    source $HOME/.config/fish/secrets.fish
end

if status is-interactive
  starship init fish | source
  zoxide init fish | source
  #pfetch
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

# ls to eza
alias ls='eza --color=always --group-directories-first'
alias ll='eza -l --color=always --group-directories-first'
alias la='eza -al --color=always --group-directories-first'
alias lt='eza -T --color=always --group-directories-first'
alias lat='eza -aT --color=always --group-directories-first'
alias l.='eza -a | egrep "^\."'

# Misc
export KUBECONFIG={$HOME}/.kube/config

set EDITOR nvim

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


# opencode
fish_add_path /Users/aryan/.opencode/bin

# pnpm
set -gx PNPM_HOME "/Users/aryan/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

pfetch

set -gx GITHUB_TOKEN (gh auth token)
direnv hook fish | source

