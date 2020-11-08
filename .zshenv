[[ -z $TMUX ]] && export PATH="$HOME/.gem/ruby/2.7.0/bin:$HOME/.fnm:$PATH"
export LANG=ja_JP.UTF-8
export ARCHFLAGS="-arch x86_64"
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'
export TERM="xterm-256color"
export EDITOR="nvim"
export SHELL="zsh"
if mount | grep -i 'drvfs' > /dev/null; then
    export PULSE_SERVER=tcp:$(grep nameserver /etc/resolv.conf | awk '{print $2}');
    export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0.0;
    [[ $USERNAME == "potato" ]] \
        && export BROWSER="${USERPROFILE}/scoop/apps/googlechrome-canary/current/chrome.exe" \
        || export BROWSER="/mnt/c/Program Files\ (x86)/Google/Chrome/Application/chrome.exe"
fi
export HISTFILE=$HOME/.zsh-history
export HISTSIZE=100000
export SAVEHIST=1000000
export PERL_CPANM_OPT="--local-lib=~/extlib"
export PERL5LIB="$HOME/extlib/lib/perl5:$HOME/extlib/lib/perl5/i386-freebsd-64int:$PERL5LIB"

