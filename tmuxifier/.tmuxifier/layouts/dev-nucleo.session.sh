# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Dev/stm32-f446re-nucleo/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "dev-nucleo"; then
  new_window "$USER"
  split_v 30
  run_cmd "git status"
  
  select_pane 0
  run_cmd "nvim"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
