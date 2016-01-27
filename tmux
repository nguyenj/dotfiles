set-option -g mode-keys vi
# faster way to source tmux config
bind-key C-r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"

# set default tmux display in 256 colors
set -g default-terminal "screen-256color"

# better pane splitting
bind-key - split-window -v -c "#{pane_current_path}"
bind-key \ split-window -h -c "#{pane_current_path}"

# better window creation
bind-key c new-window -c "#{pane_current_path}"

# gray out the statusbar
set-option -g status-bg "#666666"
set-option -g status-fg "#aaaaaa"

# custom statusbar info on the right
set-option -g status-right " #(battery -t -p -a) #(date '+%a, %b %d - %I:%M') "

# # Vim style pane selection
# bind h select-pane -L
# bind j select-pane -D
# bind k select-pane -U
# bind l select-pane -R
