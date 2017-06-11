[ -n "$PS1" ] && source ~/.bash_profile;
#. `brew --prefix`/etc/profile.d/z.sh
if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
