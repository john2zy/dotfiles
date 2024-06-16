eval "$(/opt/homebrew/bin/brew shellenv)"

autoload zmv

# Openjdk takes precedence before /usr/bin
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Poetry python package manager
export PATH="/Users/johnzeng/Library/Python/3.9/bin:$PATH"

# Go installs
export PATH="$HOME/go/bin:$PATH"

# Cargo installs
export PATH="$HOME/.cargo/bin:$PATH"

# JetBrains toolbox
export PATH="$PATH:/Users/johnzeng/Library/Application Support/JetBrains/Toolbox/scripts"
