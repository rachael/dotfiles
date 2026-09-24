# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf zsh-interactive-cd fasd nvm per-directory-history yarn)

# custom config
[ -e "$HOME/.oh-my-zsh/custom/.zshrc" ] && source "$HOME/.oh-my-zsh/custom/.zshrc"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# fasd
alias v='f -e vim' # quick opening files with vim
alias m='f -e vlc' # quick opening files with vlc
alias o='a -e open' # quick opening files with open

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# use gawk as awk, for fasd
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
# use gnu-sed as sed, for fasd
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# homebrew shell integration
eval "$(/opt/homebrew/bin/brew shellenv)"
# fzf shell integration https://github.com/junegunn/fzf
eval "$(fzf --zsh)"
# fasd shell integration https://github.com/d10xa/fasd
eval "$(fasd --init auto)"


eval $(thefuck --alias)
export PATH="$HOME/.local/bin:$PATH"

# dotfiles: the git dir lives at ~/.dotfiles.git so that ~ itself is not a git
# worktree (otherwise every tool run under ~ thinks it is inside this repo).
# Files stay in place at ~; manage them with `dotfiles` instead of `git`.
alias dotfiles='git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME"'

# pnpm
export PNPM_HOME="/Users/rae/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# OpenClaw Completion
[ -f "/Users/rae/.openclaw/completions/openclaw.zsh" ] && source "/Users/rae/.openclaw/completions/openclaw.zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# opencode
export PATH=/Users/rae/.opencode/bin:$PATH

# Commit this tab's iTerm capture (~/logs/iterm2, auto-logged by the "Dark"
# profile) to the logs repo when the shell exits. Waits a few seconds so iTerm
# has flushed and closed the file; the nightly archivist scan catches anything
# missed. Closing a tab sends HUP, which skips zshexit, hence the trap too.
if [[ -n "$ITERM_SESSION_ID" && -z "$CLAUDECODE" ]]; then
  _archive_iterm_capture() {
    nohup /bin/sh -c 'sleep 5; exec /opt/homebrew/bin/python3 "$0" "$HOME/logs" -m "iTerm capture: tab closed" --push -- iterm2' \
      "$HOME/Documents/Documents - RaeM2Pro/Projects/AI-OS/dev/skills/archivist/tools/commit-now.py" >/dev/null 2>&1 &!
  }
  autoload -Uz add-zsh-hook
  add-zsh-hook zshexit _archive_iterm_capture
  TRAPHUP() { _archive_iterm_capture; return $(( 128 + $1 )) }
fi
