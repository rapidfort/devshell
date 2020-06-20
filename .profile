alias ls='ls --color'
alias myip='curl ipinfo.io/ip'
alias grep='grep -i'
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\[\033[01;32m\]\h \w\[\033[34m\]\$(parse_git_branch)\[\033[00m\] $ "


