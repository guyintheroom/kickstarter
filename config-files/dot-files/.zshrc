# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source $HOME/.aliases

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Powerlevel10k Stuff - To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.config/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Other Plugins
source ~/.config/zsh-plugins/fsh/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
pokemon-colorscripts -r 1 --no-title
