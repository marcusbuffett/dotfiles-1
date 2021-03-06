echo ".zshrc: configuring aliases, setting defaults, performing minor ritual..."
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/garrettmaring/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Global configs
export EDITOR=vim
ZSH_THEME=pygmalion
. ~/powerline/powerline/bindings/zsh/powerline.zsh

# Antigen
source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle colorize
antigen bundle jira
antigen bundle vagrant
antigen bundle brew

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme agnoster

# Tell antigen that you're done.
antigen apply

# Things for the shell
alias aali="vim ~/.zshrc"
alias reload="source ~/.zshrc"
alias la="ls -la"

# Things for the web
findPort() {
  lsof -wni tcp:$1
}
alias whereserver=findPort

# Things for Vim
alias v="vim"
alias vvim="vim ~/.vimrc"
alias vplugi="vim +PluginInstall +qall"

findAlias() {
  alias | grep $1
}
alias findali=findAlias

# Things for git
alias gl="git log --graph --decorate --pretty=oneline"

# Things for NPM/Node
alias nis="npm install --save"
alias nid="npm install --save-dev"
alias nig="npm install --global"
alias nt="npm test"
alias nit="npm install && npm test"
alias nk="npm link"
alias nr="npm run"
alias nf="npm cache clean && rm -rf node_modules && npm install"

#Thing for tmux
alias ttmux="vim ~/.tmux.conf"

# Things for Cassandra
alias startcas="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.cassandra21.plist"
alias stopcas="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.cassandra21.plist"

# Things for Apple
alias cqlitms8="/usr/local/Cellar/cassandra20/2.0.11/bin/cqlsh -k mozart_itms8 vp21q01if-ztdi23021301.vp.if1.apple.com"
alias cqldev2="/usr/local/Cellar/cassandra20/2.0.11/bin/cqlsh -k mozart_dev2 vp21q01if-ztdi23021301.vp.if1.apple.com"
alias moz="cd ~/Projects/mozartui && vim server.js"

healthcheck() {
  curl "https://silverbullet-admin-itms$1.itunes.apple.com/healthcheck"
}
alias silverhealth=healthcheck
