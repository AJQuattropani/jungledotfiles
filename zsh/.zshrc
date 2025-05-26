eval "$(starship init zsh)"

export EDITOR='nvim'
export SUDO_EDITOR="$EDITOR"

export PATH="$HOME/.tmuxifier/bin:$PATH"



eval "$(tmuxifier init -)"
eval "$(ssh-agent -s)"

