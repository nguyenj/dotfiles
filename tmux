# motion like vi motions
set-option -g mode-keys vi
set-option -g set-titles on
# faster way to source tmux config
bind-key C-r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"
bind-key s split-window -h "vim ~/.tmux.conf"

# set default tmux display in 256 colors
set-option -g default-terminal "screen-256color"

# better pane splitting
bind-key - split-window -v -c "#{pane_current_path}"
bind-key \ split-window -h -c "#{pane_current_path}"

# better window creation
bind-key c new-window -c "#{pane_current_path}"
set -g base-index 1
set -g renumber-windows on

# break pane into new window
bind-key b break-pane -d

# custom statusbar info on the right
set-option -g status-right " #(battery -t -p -a) #(date '+%a, %b %d - %H:%M') "

# Vim style pane selection
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

bind-key t split-window -h "vim ~/TODO.md"

# Fine adjustment (1 or 2 cursor cells per bump)
bind -n S-Left resize-pane -L 2
bind -n S-Right resize-pane -R 2
bind -n S-Down resize-pane -D 1
bind -n S-Up resize-pane -U 1
