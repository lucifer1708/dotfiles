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
#       Author: Sumit Dhiman          #
#     Email: hello@sumitdhiman.in     #
# # # # # # # # # # # # # # # # # # # # 


#------------------------ ZSH shell configurations -------------------------------------
export PATH=$HOME/.local/bin:$HOME/go/bin:$PATH:$GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin:$HOME/.config/emacs/bin
export GOPATH=$HOME/go
autoload -U compinit; compinit
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word 
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
source /usr/share/zsh/plugins/fzf-tab-bin-git/fzf-tab.zsh 
source /usr/share/doc/mcfly/mcfly.zsh 
 
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
alias ls='ls --color=auto'
alias docx="cd ~/Docx"
alias dols="cd ~/Downloads/"
alias vi='nvim'
alias vim='nvim'
alias clr='clear'
alias bye='exit'
alias fm='ranger'
alias copy='xclip -selection clipboard'
alias vim-config='cd ~/.config/nvim/'
alias chwal='feh --bg-fill --randomize ~/Pictures/walls/images/'
alias gclone1='git clone --depth=1' 
alias run-server='npm run dev -- --open'
alias compile-tex="latexmk -pvc -pdf"
alias emacs="emacsclient -c -a 'emacs' & disown"
alias ssh-stage="ssh -i ~/Downloads/athena_eumlet.pem ubuntu@ec2-18-192-176-85.eu-central-1.compute.amazonaws.com"
alias ssh-dev="ssh -i ~/Downloads/athena_eumlet.pem ubuntu@ec2-3-70-192-214.eu-central-1.compute.amazonaws.com"
alias ssh-prod="ssh -i ~/Downloads/athena_eumlet.pem ubuntu@ec2-18-159-254-137.eu-central-1.compute.amazonaws.com"

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
alias pyrun="python manage.py runserver" # For Django
alias pyrun-remote="python manage.py runserver 192.168.65.34:8000" # For Django
alias migrate="python manage.py migrate" # For Django
alias makemigrations="python manage.py makemigrations" # For Django
alias createsuperuser="python manage.py createsuperuser" # For Django
alias collectstatic="python manage.py collectstatic" # For Django
alias activate-env='source venv/bin/activate'
alias create-env='python -m venv venv'

#----------------------------- list -----------------------------------
alias lfa='ls -ap | grep -v /'
alias ld='ls -p | grep /'
alias lda='ls -Ap | grep /'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls'
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
alias update='sudo pacman -Syyu'

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

# nano for important configuration files
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
alias sn='shutdown now'
alias sr="sudo reboot"

# give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

# ex = EXtractor for all kinds of archives
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function cdf(){
cd "$(find $HOME -type d|fzf)"
}

open ()
{
if [ -f $1 ]; then
  case $1 in 
    *.pdf)  zathura $1 & disown;;
    *.mp3) mpv $1 & disown;;
    *.mp4) mpv $1 & disown;;
    *.png) sxiv $1 & disown;;
    *.jpg) sxiv $1 & disown;;
    *.jpeg) sxiv $1 & disown;;
    *.webp) sxiv $1 & disown;;
    *) echo "'$1' cannot be openned";;
  esac
else
  echo "'$1' is not valid file"
fi
}

function run {
 if ! pgrep $1 ;
  then
    $@& disown
  fi
}
#remove
alias rmgitcache="rm -r ~/.cache/git"


# USELESS ALIASES
alias fetch='neofetch'
export PATH="$PATH:/opt/mssql-tools18/bin"
export PATH="$PATH:/opt/mssql-tools/bin"

__gh_debug()
{
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_gh()
{
    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16

    local lastParam lastChar flagPrefix requestComp out directive comp lastComp noSpace
    local -a completions

    __gh_debug "\n========= starting completion logic =========="
    __gh_debug "CURRENT: ${CURRENT}, words[*]: ${words[*]}"

    # The user could have moved the cursor backwards on the command-line.
    # We need to trigger completion from the $CURRENT location, so we need
    # to truncate the command-line ($words) up to the $CURRENT location.
    # (We cannot use $CURSOR as its value does not work when a command is an alias.)
    words=("${=words[1,CURRENT]}")
    __gh_debug "Truncated words[*]: ${words[*]},"

    lastParam=${words[-1]}
    lastChar=${lastParam[-1]}
    __gh_debug "lastParam: ${lastParam}, lastChar: ${lastChar}"

    # For zsh, when completing a flag with an = (e.g., gh -n=<TAB>)
    # completions must be prefixed with the flag
    setopt local_options BASH_REMATCH
    if [[ "${lastParam}" =~ '-.*=' ]]; then
        # We are dealing with a flag with an =
        flagPrefix="-P ${BASH_REMATCH}"
    fi

    # Prepare the command to obtain completions
    requestComp="${words[1]} __complete ${words[2,-1]}"
    if [ "${lastChar}" = "" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go completion code.
        __gh_debug "Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __gh_debug "About to call: eval ${requestComp}"

    # Use eval to handle any environment variables and such
    out=$(eval ${requestComp} 2>/dev/null)
    __gh_debug "completion output: ${out}"

    # Extract the directive integer following a : from the last line
    local lastLine
    while IFS='\n' read -r line; do
        lastLine=${line}
    done < <(printf "%s\n" "${out[@]}")
    __gh_debug "last line: ${lastLine}"

    if [ "${lastLine[1]}" = : ]; then
        directive=${lastLine[2,-1]}
        # Remove the directive including the : and the newline
        local suffix
        (( suffix=${#lastLine}+2))
        out=${out[1,-$suffix]}
    else
        # There is no directive specified.  Leave $out as is.
        __gh_debug "No directive found.  Setting do default"
        directive=0
    fi

    __gh_debug "directive: ${directive}"
    __gh_debug "completions: ${out}"
    __gh_debug "flagPrefix: ${flagPrefix}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __gh_debug "Completion received error. Ignoring completions."
        return
    fi

    local activeHelpMarker="_activeHelp_ "
    local endIndex=${#activeHelpMarker}
    local startIndex=$((${#activeHelpMarker}+1))
    local hasActiveHelp=0
    while IFS='\n' read -r comp; do
        # Check if this is an activeHelp statement (i.e., prefixed with $activeHelpMarker)
        if [ "${comp[1,$endIndex]}" = "$activeHelpMarker" ];then
            __gh_debug "ActiveHelp found: $comp"
            comp="${comp[$startIndex,-1]}"
            if [ -n "$comp" ]; then
                compadd -x "${comp}"
                __gh_debug "ActiveHelp will need delimiter"
                hasActiveHelp=1
            fi

            continue
        fi

        if [ -n "$comp" ]; then
            # If requested, completions are returned with a description.
            # The description is preceded by a TAB character.
            # For zsh's _describe, we need to use a : instead of a TAB.
            # We first need to escape any : as part of the completion itself.
            comp=${comp//:/\\:}

            local tab="$(printf '\t')"
            comp=${comp//$tab/:}

            __gh_debug "Adding completion: ${comp}"
            completions+=${comp}
            lastComp=$comp
        fi
    done < <(printf "%s\n" "${out[@]}")

    # Add a delimiter after the activeHelp statements, but only if:
    # - there are completions following the activeHelp statements, or
    # - file completion will be performed (so there will be choices after the activeHelp)
    if [ $hasActiveHelp -eq 1 ]; then
        if [ ${#completions} -ne 0 ] || [ $((directive & shellCompDirectiveNoFileComp)) -eq 0 ]; then
            __gh_debug "Adding activeHelp delimiter"
            compadd -x "--"
            hasActiveHelp=0
        fi
    fi

    if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
        __gh_debug "Activating nospace."
        noSpace="-S ''"
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local filteringCmd
        filteringCmd='_files'
        for filter in ${completions[@]}; do
            if [ ${filter[1]} != '*' ]; then
                # zsh requires a glob pattern to do file filtering
                filter="\*.$filter"
            fi
            filteringCmd+=" -g $filter"
        done
        filteringCmd+=" ${flagPrefix}"

        __gh_debug "File filtering command: $filteringCmd"
        _arguments '*:filename:'"$filteringCmd"
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        subdir="${completions[1]}"
        if [ -n "$subdir" ]; then
            __gh_debug "Listing directories in $subdir"
            pushd "${subdir}" >/dev/null 2>&1
        else
            __gh_debug "Listing directories in ."
        fi

        local result
        _arguments '*:dirname:_files -/'" ${flagPrefix}"
        result=$?
        if [ -n "$subdir" ]; then
            popd >/dev/null 2>&1
        fi
        return $result
    else
        __gh_debug "Calling _describe"
        if eval _describe "completions" completions $flagPrefix $noSpace; then
            __gh_debug "_describe found some completions"

            # Return the success of having called _describe
            return 0
        else
            __gh_debug "_describe did not find completions."
            __gh_debug "Checking if we should do file completion."
            if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
                __gh_debug "deactivating file completion"

                # We must return an error code here to let zsh know that there were no
                # completions found by _describe; this is what will trigger other
                # matching algorithms to attempt to find completions.
                # For example zsh can match letters in the middle of words.
                return 1
            else
                # Perform file completion
                __gh_debug "Activating file completion"

                # We must return the result of this command, so it must be the
                # last command, or else we must store its result to return it.
                _arguments '*:filename:_files'" ${flagPrefix}"
            fi
        fi
    fi
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_gh" ]; then
    _gh
fi
export RUST_BACKTRACE=1

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
