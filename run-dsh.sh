#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Run DSH
# @raycast.mode silent

# Optional parameters:
# @raycast.icon https://api.iconify.design/logos:deepseek-icon.svg
# @raycast.description Starts a deepseek harness session in the background using tmux

# Documentation:
# @raycast.author andrei_hudalla
# @raycast.authorURL https://raycast.com/andrei_hudalla

set -euo pipefail

SESSION="dsh-web"

if ! tmux has-session -t "$SESSION" 2>/dev/null; then
  tmux new-session -d -s "$SESSION" -x 200 -y 50
fi

tmux has-session -t "$SESSION"

# Keep the pane alive even if the command inside it exits/crashes,
# so a dead 'dsh web' doesn't take the whole session/server down with it.
tmux set-option -t "$SESSION" remain-on-exit on

tmux send-keys -t "$SESSION" C-c ""
tmux send-keys -t "$SESSION" "exec zsh -i" Enter
sleep 0.3

pkill -TERM -f 'dsh web' 2>/dev/null || true
for i in $(seq 1 20); do
  pgrep -f 'dsh web' >/dev/null 2>&1 || break
  sleep 0.1
done
pkill -KILL -f 'dsh web' 2>/dev/null || true

tmux send-keys -t "$SESSION" "dsh web --no-open" Enter

echo "dsh web launched in tmux session '$SESSION'."
sleep 1   # give it a beat to crash if it's going to

if tmux has-session -t "$SESSION" 2>/dev/null; then
  echo "--- pane output ---"
  tmux capture-pane -p -t "$SESSION"
else
  echo "Session died — dsh web likely crashed on startup." >&2
  exit 1
fi
