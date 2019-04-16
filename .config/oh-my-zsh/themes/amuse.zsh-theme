# vim:ft=zsh ts=2 sw=2 sts=2

rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}

PROMPT='
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} • %{$fg_bold[red]%}%*%{$reset_color%}
$ '

if [ -e ~/.rvm/bin/rvm-prompt ]; then
  RPROMPT='%{$fg_bold[red]%}‹$(rvm_current)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
  fi
fi

