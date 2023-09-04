# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/andreavaghi/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting asdf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export EDITOR=/usr/local/bin/code

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
alias zo="$EDITOR ~/.zshrc"
alias zz="source ~/.zshrc"
alias dev="cd ~/Development"
alias wproj="cd ~/Development/wproj"
alias elektra="cd ~/Development/elektra-lib"
alias ws="cd ~/Development/webspark"
alias ws-rev="cd ~/Development/webspark-revolution"
alias ws-theme="cd ~/Development/webspark-theme"
alias ws-boilerplate="cd ~/Development/webspark-boilerplate-theme"
alias ws-example="cd ~/Development/webspark-examples-plugin"
alias ws-paa="cd ~/Development/ws-product-audit-app"
alias links="ls -F node_modules | sed -n 's/@$//p' | xargs npm ls -g --depth 0"
alias exp="cd ~/Experiment"
alias rm="trash"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zsh: Place this in .zshrc after "source /Users/georgen/.iterm2_shell_integration.zsh".
iterm2_print_user_vars() {
    iterm2_set_user_var phpVersion $(php -v | awk '/^PHP/ { print $2 }')
    iterm2_set_user_var nodeVersion $(node -v)
    iterm2_set_user_var npmVersion $(npm -v)
}

devk() {
    cd ~/Development/mkdocker
    make $1 service=webspark_dev
}

ws_setup() {
    ln -sfn ~/Development/wdd/wproj_$1 ~/Development/wproj
    ln -sfn ~/Development/wdd/wproj_$1/vendor/drivek/elektra-lib ~/Development/elektra-lib
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/mu-plugins/webspark-revolution ~/Development/webspark-revolution
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/plugins/content-repo ~/Development/content-repo
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/plugins/webspark ~/Development/webspark
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/plugins/webspark-network-content-mirror ~/Development/webspark-network-content-mirror
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/plugins/webspark-plugin-$1 ~/Development/webspark-plugin-$1
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/plugins/webspark-product-audit/ ~/Development/webspark-product-audit
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/plugins/webspark-site-generator ~/Development/webspark-site-generator
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/plugins/webspark-tc-automations ~/Development/webspark-tc-automations
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/plugins/webspark-vehicle-repo ~/Development/webspark-vehicle-repo
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/plugins/wp-marketing-automation ~/Development/wp-marketing-automation
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/themes/webspark-boilerplate-theme ~/Development/webspark-boilerplate-theme
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/themes/webspark-theme ~/Development/webspark-theme
    ln -sfn ~/Development/wdd/wproj_$1/public/wp-content/themes/webspark-theme-$1 ~/Development/webspark-theme-$1
}

ws_setup_app() {
    ln -sfn ~/Development/mkdocker/services-webspark/$1/ws-$1 ~/Development/ws-$1
}

start() {
    docker start mkdocker-$1-php-1 mkdocker-$1-1 mkdocker-mariadb-1 mkdocker-phpmyadmin-1 mkdocker-redis-1 mkdocker-ssh-agent-1 mkdocker-traefik-1
}

stop() {
    docker stop $(docker ps -a -q)
}

lonfo () {
    echo 
    echo "  IL LONFO"
    echo 
    echo "  Il Lonfo non vaterca né gluisce"
    echo "  e molto raramente barigatta,"
    echo "  ma quando soffia il bego a bisce bisce,"
    echo "  sdilenca un poco e gnagio s'archipatta."
    echo "  È frusco il Lonfo! È pieno di lupigna"
    echo "  arrafferia malversa e sofolenta!"
    echo "  Se cionfi ti sbiduglia e ti arrupigna"
    echo "  se lugri ti botalla e ti criventa."
    echo "  Eppure il vecchio Lonfo ammargelluto"
    echo "  che bete e zugghia e fonca nei trombazzi"
    echo "  fa legica busia, fa gisbuto;"
    echo "  e quasi quasi in segno di sberdazzi"
    echo "  gli affarferesti un gniffo. Ma lui, zuto"
    echo "  t'alloppa, ti sbernecchia; e tu l'accazzi."
    echo 
}

eval "$(rbenv init -)"
export RUBYOPT='-W:no-deprecated -W:no-experimental'

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/Applications/PhpStorm.app/Contents/MacOS:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/local/opt/kube-ps1/share/kube-ps1.sh
PS1='$(kube_ps1)'$PS1




test_func() {
    opt=${1:-world}
    echo "Hello $opt"
}

mov2gif () {
    scale=${2:-480}
    output=${3:-~/Desktop/Screenshots/gifs}
	ffmpeg -i ~/Desktop/Screenshots/$1.mov -vf "fps=10,scale=$scale:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 $output/$1.gif
}

switchphp() {
    brew unlink php && brew link --force --overwrite php@$1
}

stampyt() {
    env=${2:-v1}
    apiKey=${3:-5L8EBAaz1canp7t5wRiJJ6opqZCn0q9m7u6UeYjj}
    curl -X GET https://api.stampyt.io/$env/panorama-shootings/exists\?ref\=$1 -H "x-api-key: $apiKey"
}

kubexec() {
    kubectl exec -ti -n wp-feature $1 -c php -- bash
}

kubexecp() {
    kubectl exec -ti -n wp $1 -c php -- bash
}

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
export PATH="/usr/local/sbin:$PATH"

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

export ERL_AFLAGS="-kernel shell_history enabled"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

export PIPENV_VENV_IN_PROJECT=1
