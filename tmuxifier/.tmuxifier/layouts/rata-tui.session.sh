# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.

session_root "~/Dev/rata-tui"

session_name="rata-tui"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "rata-tui"; then

  # Create a new window inline within session layout definition.
  new_window "$USER"
  split_v 30
  run_cmd "cd ./$session_name && git status"
  split_h 50
  run_cmd "cd ./build && cmake $session_root/rata-tui/"
  select_pane 0
  run_cmd "cd ./$session_name && nvim"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
