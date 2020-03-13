# instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/leroi/.oh-my-zsh"

# zsh configs
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git osx zsh-autosuggestions zsh-syntax-highlighting nvm)

source $ZSH/oh-my-zsh.sh

# User configuration
#############custom aliases############
alias c="clear"
alias gbc="git branch | cat" #pipes git branch output to cat instead of less

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


####### NVM CONFIG #############
# NVM impacts terminal startup time for this reason nvm is lazy loaded
export NVM_DIR="$HOME/.nvm"

nvm_init() {
	echo "Lazy loading nvm..."
	# Remove nvm functions
  	unfunction nvm
  	unfunction npm
  	unfunction node
    # Load nvm
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  	[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}

nvm() {
    nvm_init
    # Call nvm
    $0 "$@"
}

npm() {
	nvm_init # init 
    $0 "$@"  # re execute command
}

node() {
	nvm_init
    # Call nvm
    $0 "$@"
}