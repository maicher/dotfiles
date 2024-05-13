alias \
	ls="ls -hN --color=auto --group-directories-first" \
	ll="ls -lh" \
	la="ls -alh" \
	l="ls -CF" \
	grep="grep --colour=auto" \
	v="vim" \
	t="tmux" \
	o="octave" \
	c="cal -m" \
	m="make" \
	cuts="cut -d ' '" \
	cutt="cut -d$'\t'" \
	copy="xclip -i -selection clipboard" \
	trd="tr -d '\",'" \

alias so="source $HOME/.rvm/scripts/rvm"
alias sonpx="source /usr/share/nvm/init-nvm.sh $$ nvm use --lts"

alias ipt='sudo /sbin/iptables'
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'

alias psmem='ps aux | sort -nr -k4 | sed 5q'
alias pscpu='ps axch -o cmd:20,%cpu --sort=-%cpu | head'

# Source aliases
[ -f $HOME/.aliasrc ] && source $HOME/.aliasrc

# Source custom functions
[ -f $HOME/.zfunc ] && source $HOME/.zfunc

typeset -U path

setopt nobeep
setopt autocd
set -o ignoreeof

HISTCONTROL=ignoreboth
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt inc_append_history

autoload -Uz compinit promptinit
zmodload zsh/complist
compinit
promptinit
zstyle ':completion:*' menu select
_comp_options+=(globdots) # Include hidden files.
prompt adam1

# Unused
setopt noflowcontrol

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu.
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^R' history-incremental-search-backward

# Change cursor shape for different vi modes.
function zle-keymap-select () {
	case $KEYMAP in
		vicmd) echo -ne '\e[1 q';;      # block
		viins|main) echo -ne '\e[5 q';; # beam
	esac
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins # initiate `vi insert` as keymap
	echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e.
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey '^k' up-line-or-history
bindkey '^j' down-line-or-history

# Auto escape when pasting url to the command line.
autoload -U url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic

# Now the fix, setup these two hooks:
pasteinit() {
	OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
	zle -N self-insert url-quote-magic
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# and finally, make sure zsh-autosuggestions does not interfere with it:
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)
# end auto escape

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

cdtrash () {
	cd $(trashpath)
}

cleanup () {
	sudo journalctl --vacuum-size=512M

	# DOT SKIP server
	sudo paccache -rk 1
	yay -Yc
	yay -Scc
	kmstatus --refresh
	docker system prune --all --volumes
	kmstatus --refresh
	# DOT END
}

# Conveniently mount given device.
cmount () {
	if [ -z $1 ]; then
		echo "Missing argument"
	else
		mounted_info=$(udisksctl mount -b $1)
		if [ $? -eq 0 ]; then
			kmstatus --refresh
			cd "$(echo $mounted_info | cut -d ' ' -f4-)"
			lf
		else
			echo "$mounted_info"
		fi
	fi

	unset mounted_info
}

# Conveniently unmount.
cumount () {
	pwd_buf="$PWD"

	if [ -z $1 ]; then
		# Unmount current dir.
		mounting_point=$(lsblk -l | grep "`echo $PWD | awk -F\/ '{ print $5 }'`" | awk '{ print "/dev/"$1 }')
	else
		mounting_point="$1"
	fi

	cd $HOME
	udisksctl unmount -b $mounting_point

	if [ $? -eq 0 ]; then
		kmstatus --refresh
	else
		cd "$pwd_buf"
	fi

	unset mounting_point
	unset pwd_buf
}
