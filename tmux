set-option -g mode-keys vi
# faster way to source tmux config
bind-key C-r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"

# set default tmux display in 256 colors
set -g default-terminal "screen-256color"

# Vim style pane selection
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
