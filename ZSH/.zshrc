# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#if [[ "nvim" != $(ps -p $(ps -p $$ -o ppid=) o args= | awk '{print $1 }') ]]
#then
#    neofetch
#fi

#transparencia
term="$(cat /proc/$PPID/comm)"
if [[ $term = "st" ]];
then
  transset-df "1" --id "$WINDOWID" >/dev/null
fi

export ZSH="/home/shadow/.oh-my-zsh"
export EDITOR="nvim"

ZSH_THEME="powerlevel10k/powerlevel10k"
HIST_STAMPS="dd.mm.yyyy"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting vi-mode)

source $ZSH/oh-my-zsh.sh

alias zrc="nvim ~/.zshrc"
alias rr=". ranger"
alias h="htop"
alias campow="v4l2-ctl -d /dev/video0 --set-ctrl=power_line_frequency=1"
alias c="clear"
alias q="exit"
alias ls='exa --color=always --group-directories-first --icons'  # all files and dirs
alias la='exa -al --color=always --group-directories-first --icons --git' # my preferred listing
alias ll='exa -l --color=always --group-directories-first --icons --git'  # long format
alias l.='exa -a | rg "^\."'
alias icat='kitty +kitten icat'
alias clip='tr -d "\n" | xclip -selection clipbaord'
alias firomine='/home/shadow/.program/trex/t-rex -a firopow -o stratum+tcp://asia-firo.2miners.com:8181 -u aLe4UJ7QoZBpHVAPwzdVqq14rFQFGH1wrS.PC -p x'
alias rvnmine='/home/shadow/.program/trex/t-rex -a kawpow -o stratum+tcp://rvn.2miners.com:6060 -u RNtZ47Wd7z6bbSqsQEuN5ExvBtzim8C1Wj -p x'
alias n='nvim'
alias du='/sbin/du -h'
alias mtp='aft-mtp-mount ~/mnt'
alias ssh='kitty +kitten ssh'
alias winmount='sudo mount /dev/nvme0n1p3 /win'
alias mkdwm='rm -rf config.h && sudo make clean install'
alias rgb="sudo systemctl restart openrgb.service && openrgb -c 000000"
alias popen="sudo cryptsetup luksOpen /dev/sda2 cryptpart && sudo mount /dev/mapper/cryptpart /oth"
alias pclose="sudo umount /oth && sudo cryptsetup luksClose /dev/mapper/cryptpart"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$HOME/.npm-global/bin:$HOME/.cargo/bin:$HOME/.platformio/penv/bin:$HOME/bin:/usr/local/bin:/sbin:/usr/sbin:/var/lib/snapd/snap/bin:/home/shadow/.local/bin:/home/shadow/.program:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


[[ -s /home/shadow/.autojump/etc/profile.d/autojump.sh ]] && source /home/shadow/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
