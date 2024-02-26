# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Options
#
export FZF_CTRL_T_OPTS="--preview '(bat {} 2> /dev/null || tree -L 5 -C {}) 2> /dev/null | head -200'"

export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:5:wrap"

export FZF_ALT_C_OPTS="--preview 'tree -L 5 -C {} | head -200'"

