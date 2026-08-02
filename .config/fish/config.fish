if status is-interactive
   set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
   set -U fish_greeting
   fish_config theme choose catppuccin-mocha
end
