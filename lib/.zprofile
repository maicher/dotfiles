export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/status"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.rvm/bin"

# Completions for custom scripts
export FPATH="$FPATH:$HOME/.local/completion/"

export BROWSER="firefox"
export EDITOR="vim"
export TERMINAL="st"
export OPENER="mimeopen"

export XDG_CONFIG_HOME="$HOME/.config"
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.lua"
export VIMINIT="source $MYVIMRC"

export USER_TMPDIR="/dev/shm/tmp_$(whoami)" # /dev/shm means in RAM
export DMENU_SNIPPETS="$HOME/.local/dmenu_snippets"
export DMENU_URLS="$HOME/.local/dmenu_urls"
export DMENU_PASS="$USER_TMPDIR/dmenu_pass"
export DWM_TEXT="$USER_TMPDIR/dwm_text"
export IMAGE_JOBS=8
export VIDEO_JOBS=8
export SXIV_MINIATURES_DIR="$USER_TMPDIR/sxiv"
export VIDEO_FRAMES_DIR="$USER_TMPDIR/frames"
export FVSEP_CUSTOMERS="A B C"      # used by fvsep completions
export USB_DEVICES="keyboard mouse" # used by usb completions
export BT_DEVICES="MDR JBL"         # used by bt completions
export POMODORO_SECONDS=2000

# Create custom tmp dirs
mkdir -p $USER_TMPDIR
chmod 700 "$USER_TMPDIR"
mkdir -p $SXIV_MINIATURES_DIR

export TMUX_MOD_KEY='='
# DOT SKIP kinesis
export TMUX_MOD_KEY='`'
# DOT END

# Colors for man pages.
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS=-r

# DOT SKIP server
# Icons for lf file manager.
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.webp=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.xcf=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.aiff=:\
*.ape=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
# DOT END

# DOT SKIP server
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep -x dwm || startx
fi
# DOT END
