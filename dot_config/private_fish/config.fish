# Editors
set -gx EDITOR nvim
set -gx VISUAL nvim

# Give me current time
alias now='date +%T'

# Zellij
alias zj='zellij'
alias zc='zellij -l compact'
alias zr='zellij run'

# Clear
alias cl='clear'

# FZF
set -gx FZF_DEFAULT_COMMAND "fd --type f -u -E .git -E .venv -E '*.pyc' -E __pycache__ -E .mypy_cache -E node_modules -E .ruff_cache"
alias ff='fzf --preview "bat --color=always --style=header,grid,numbers --line-range :500 {}" --bind=ctrl-v:toggle-preview,ctrl-u:half-page-up,ctrl-d:half-page-down'
alias fcd='cd (fd --type d -u -E .git -E .venv -E __pycache__ -E node_modules -E .mypy_cache | fzf)'
alias fco='git checkout (git branch | fzf)'
alias fa='alias | fzf --bind "ctrl-u:half-page-up,ctrl-d:half-page-down"'
alias fal='eval $(alias | fzf --bind "ctrl-u:half-page-up,ctrl-d:half-page-down" | cut -d = -f 1)'

# Neovim
alias v='nvim'
alias fv='nvim (ff)'

# Clipboard
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# Git
# alias ga='git add'
# alias gbD='git branch -D'
# alias gbc='git branch --show-current'
# alias gbd='git branch -d'
# alias gc='git commit'
# alias gco='git checkout'
# alias gcob='git checkout -b'
# alias gcs='git commit -S'
# alias gcsm='git commit -S -m'
# alias gd='git diff'
# alias gds='git diff --staged'
# alias gfa='git fetch --all'
# alias glog='git log --decorate=no --pretty'
# alias glol='git log --oneline --decorate=no --graph'
# alias gst='git status'
alias treeg="tree --gitignore"

# Rust tools
alias l='exa --long --color=always --icons -a --git-ignore'
alias lt='exa --long --color=always --icons -T -L 2 -a --git-ignore'
alias cat='bat'

# Chezmoi
alias cza='chezmoi apply'
alias czd='chezmoi diff'
alias czcd='chezmoi cd'
alias czadd='chezmoi add'
alias czra='chezmoi re-add'
alias czed='chezmoi edit'
alias ez='chezmoi edit ~/.zshrc'
alias ezz='chezmoi edit ~/.config/zellij/config.kdl'
alias ev='chezmoi edit ~/.config/nvim'

# Python
set -gx PYTHONPYCACHEPREFIX /tmp

function removecontainers
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
end

function armageddon
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
end

fish_add_path $HOME/.cargo/bin

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Start SSH-agent
    eval (ssh-agent -c) >/dev/null 2>&1

    # Homebrew
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

    # asdf
    source ~/.asdf/asdf.fish

    # Starship
    starship init fish | source
end
