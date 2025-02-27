POWERLEVEL9K_DIR_FOREGROUND=0
POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=0
POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=0
POWERLEVEL9K_DIR_ANCHOR_BOLD=false
POWERLEVEL9K_DISABLE_RPROMPT=true

if [[ ! -f ~/.antigen/antigen.zsh ]]; then
  mkdir ~/.antigen
  curl -L git.io/antigen > ~/.antigen/antigen.zsh
fi
source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting, colors & autosuggestion bundles.
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle b4b4r07/emoji-cli
antigen bundle joel-porquet/zsh-dircolors-solarized.git
# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"


# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

if [[ -n $TERM=="xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
  alias icat="kitty +kitten icat"
  kitty +kitten icat --align left ~/Pictures/rick_alpha_small.png
fi

setupsolarized
eval "$(dircolors)"
alias ls='exa --icons'

# Kubernetes
alias k=kubecolor
complete -F __start_kubectl k

# Python
export PATH="$PATH:$HOME/.poetry/bin"
export PATH="$PATH:$HOME/.pyenv/bin"
export PATH="$PATH:$HOME/.local/bin"
# https://stackoverflow.com/a/68228627/13242975
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Node.js
source /usr/share/nvm/init-nvm.sh

# Vector
export PATH="$PATH:$HOME/.cargo/bin"

# Other
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.vector/bin:$PATH"

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/n0nvme/yandex-cloud/path.bash.inc' ]; then source '/home/n0nvme/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/n0nvme/yandex-cloud/completion.zsh.inc' ]; then source '/home/n0nvme/yandex-cloud/completion.zsh.inc'; fi
