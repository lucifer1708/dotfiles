# # # # # # #
# ~/.zshrc  #
# # # # # # #

# # # # # # # # # # # # # # # # # # # #
#     __               _              #
#    / /   __  _______(_) ______ ____ #
#   / /   / / / / ___/ / /_/ _ |/___/ #
#  / /___/ /_/ / /__/ / __/  __/ /    #
# /_____/|__,_/|___/_/_/  |___/_/     #
#                                     #
# # # # # # # # # # # # # # # # # # # #
#         Author: Sumit Dhiman        #
#     Email: hello@sumitdhiman.in     #
# # # # # # # # # # # # # # # # # # # #

#------------------------ ZSH shell configurations -------------------------------------
alias ssh='TERM=xterm-256color ssh'
export PATH="/opt/flutter/bin:$PATH"
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
export PATH=$HOME/.local/bin:$HOME/go/bin:$PATH:$GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin:$HOME/.config/emacs/bin:/opt/mssql/bin:/opt/android-sdk/tools/bin:/opt/android-sdk//platform-tools/:/opt/android-sdk/cmdline-tools/bin/:/opt/android-sdk/emulator/:/opt/dart-sdk/bin/:$HOME/.emacs.d/bin/:$HOME/.cargo/bin/:$CUDA_HOME/bin:/home/lucifer/.local/share/solana/install/active_release/bin:/home/lucifer/.avm/bin:/opt/dbeaver/

alias dslr-webcam="gphoto2 --stdout --set-config liveviewsize=0 --capture-movie | ffmpeg  -i - -vcodec rawvideo -pix_fmt yuv420p -vf lut3d='$HOME/.config/dotfiles/luts/7.cube' -threads 0 -f v4l2 -s:v 1920x1080 -r 60 /dev/video2"

export GOPATH=$HOME/go
autoload -U compinit
compinit
export ANDROID_HOME=/opt/android-sdk
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh

# eval "$(mcfly init zsh)"

source "$HOME/.cargo/env"

eval "$(starship init zsh)"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
#------------------------ END -----------------------------------------------
_fzf_compgen_path() {
     fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
     fd --type d --hidden --follow --exclude ".git" . "$1"
}

[[ $- != *i* ]] && return
EDITOR='nvim' # Variable for $EDITOR
alias cufix='sudo modprobe nvidia-current-uvm'
alias logout="hyprctl dispatch exit"
alias ls='eza'
alias gallery="eog . & disown"
alias cat='bat'
alias ll='eza -l'
alias lla='eza -la'
alias docx="cd ~/Docx"
alias dols="cd ~/Downloads/"
alias vi='nvim'
# alias vim='nvim'
alias nvi='nvim'
alias vim='nvim'
alias nvimm='nvim'
alias clr='clear'
alias bye='exit'
alias fm='ranger'
# alias copy='xclip -selection clipboard'
alias copy='wl-copy'
alias vim-config='cd ~/.config/nvim/'
alias chwal='feh --bg-fill --randomize ~/Pictures/walls/images/'
alias gclone1='git clone --depth=1'
alias run-server='npm run dev -- --open'
alias compile-tex="latexmk -pvc -pdf"
alias emacs="emacsclient -c -a 'emacs' & disown"
alias ssh-stage="ssh -i ~/Downloads/athena_eumlet.pem ubuntu@ec2-18-192-176-85.eu-central-1.compute.amazonaws.com"
alias ssh-dev="ssh -i ~/Downloads/athena_eumlet.pem ubuntu@ec2-3-28-195-4.me-central-1.compute.amazonaws.com"
alias ssh-prod="ssh -i ~/Downloads/athena_eumlet.pem ubuntu@ec2-3-28-47-73.me-central-1.compute.amazonaws.com"

#------------------ GIT ALIASES -------------
alias g='git'
alias ga='git add'
alias gcommit='git commit -m'
alias gb='git branch'
alias gclone='git clone'
alias gc='git checkout'
alias gpush='git push origin'
alias ggpush='git push -u origin'

#--------------------- Python Stuff Going Here ----------------------------
alias pyrun="python manage.py runserver"                           # For Django
alias pyrun-remote="python manage.py runserver 192.168.65.34:8000" # For Django
alias migrate="python manage.py migrate"                           # For Django
alias makemigrations="python manage.py makemigrations"             # For Django
alias createsuperuser="python manage.py createsuperuser"           # For Django
alias collectstatic="python manage.py collectstatic"               # For Django
alias activate-env='source venv/bin/activate'
alias create-env='python -m venv venv'

#----------------------------- list -----------------------------------
alias lfa='ls -ap | grep -v /'
alias ld='ls -p | grep /'
alias lda='ls -Ap | grep /'
alias la='ls -a'
alias l.="ls -A | egrep '^\.'"

#----------------------------------- fix obvious typo's -----------------------------------
alias cd..='cd ..'
alias pdw="pwd"
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upqll="paru -Syu --noconfirm"
alias upal="paru -Syu --noconfirm"

#------------ Colorize the grep command output for ease of use (good for log files) ------------
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#-------------------- readable output for looking on the disk usage of storage -------------------------------
alias df='df -h'

#------------------- pacman unlock ---------------------
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#------------------------- take a look at free memory -------------------
alias free="free -mt"

# continue download
alias wget="wget -c"

# Will list all the users in "pswd"
alias userlist="cut -d: -f1 /etc/passwd"

# merge new settings
alias merge="xrdb -merge ~/.Xresources"

# ALIAS FOR SOFTWARE MANAGEMENT
# pacman or pm
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias pacman='sudo pacman --color auto'
alias update='sudo apt update && sudo apt upgrade'

# paru as aur helper - updates everything
alias pksyua="paru -Syu --noconfirm"
alias upall="paru -Syu --noconfirm"

# ps commands for looking at system services running
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

# grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# add new fonts
alias update-fc='sudo fc-cache -fv'

# copy/paste all content of /etc/skel over to home folder - backup of config created - beware
alias skel='[ -d ~/.config ] || mkdir ~/.config && cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/skel/* ~'
# backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

# copy /etc/skel/.bashrc  over on ~/.bashrc - cb= copy bashrc
alias cb='sudo cp /etc/skel/.bashrc ~/.bashrc && source ~/.bashrc'
# copy /etc/skel/.zshrc over on ~/.zshrc - cz= copy zshrc
alias cz='sudo cp /etc/skel/.zshrc ~/.zshrc && exec zsh'

# switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

# switch between lightdm and sddm
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"

# kill commands
# quickly kill conkies
alias kc='killall conky'
# quickly kill polybar
alias kp='killall polybar'

# hardware info --short
alias hw="hwinfo --short"

# skip integrity check
alias paruskip='paru -S --mflags --skipinteg'
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

# check vulnerabilities in microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

# get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
# our experimental - best option for the moment
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram='rate-mirrors --allow-root arch | sudo tee /etc/pacman.d/mirrorlist'

#--------------------- youtube download -------------------------------
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

# Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# search content with ripgrep
alias rg="rg --sort path"

# get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# know what you do in these files
alias nlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="sudo $EDITOR /etc/pacman.conf"
alias ngrub="sudo $EDITOR /etc/default/grub"
alias nconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias nsddm="sudo $EDITOR /etc/sddm.conf"
alias nsddmk="sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias nfstab="sudo $EDITOR /etc/fstab"
alias nnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias nsamba="sudo $EDITOR /etc/samba/smb.conf"
alias ngnupgconf="sudo nano /etc/pacman.d/gnupg/gpg.conf"
alias nb="$EDITOR ~/.bashrc"
alias nz="$EDITOR ~/.zshrc"
alias nalacritty="$EDITOR ~/.config/alacritty/alacritty.yml"

# gpg
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

# fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"

# maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
# use unhblock to stop using hblock
alias unhblock="hblock -S none -D none"

# systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

# shutdown or reboot
alias ssn="sudo shutdown now"
alias sn='systemctl poweroff'
alias sr="systemctl reboot"

# give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

# ex = EXtractor for all kinds of archives
# usage: ex <file>
ex() {
     if [ -f $1 ]; then
          case $1 in
          *.tar.bz2) tar xjf $1 ;;
          *.tar.gz) tar xzf $1 ;;
          *.bz2) bunzip2 $1 ;;
          *.rar) unrar x $1 ;;
          *.gz) gunzip $1 ;;
          *.tar) tar xf $1 ;;
          *.tbz2) tar xjf $1 ;;
          *.tgz) tar xzf $1 ;;
          *.zip) unzip $1 ;;
          *.Z) uncompress $1 ;;
          *.7z) 7z x $1 ;;
          *.deb) ar x $1 ;;
          *.tar.xz) tar xf $1 ;;
          *.tar.zst) tar xf $1 ;;
          *) echo "'$1' cannot be extracted via ex()" ;;
          esac
     else
          echo "'$1' is not a valid file"
     fi
}

function cdf() {
     cd "$(find $HOME -type d | fzf)"
}

open() {
     if [ -f $1 ]; then
          case $1 in
          *.pdf)
               zathura $1 &
               disown
               ;;
          *.mp3)
               mpv $1 &
               disown
               ;;
          *.mp4)
               mpv $1 &
               disown
               ;;
          *.png)
               sxiv $1 &
               disown
               ;;
          *.jpg)
               sxiv $1 &
               disown
               ;;
          *.jpeg)
               sxiv $1 &
               disown
               ;;
          *.webp)
               sxiv $1 &
               disown
               ;;
          *) echo "'$1' cannot be openned" ;;
          esac
     else
          echo "'$1' is not valid file"
     fi
}

function run {
     if ! pgrep $1; then
          $@ &
          disown
     fi
}
#remove
alias rmgitcache="rm -r ~/.cache/git"

# USELESS ALIASES
alias fetch='fastfetch'
export PATH="$PATH:/opt/mssql-tools18/bin"
export PATH="$PATH:/opt/mssql-tools/bin"

export RUST_BACKTRACE=1

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
#compdef rustup

autoload -U is-at-least

# export DRI_PRIME=1
