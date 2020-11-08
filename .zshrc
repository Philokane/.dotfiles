export ZSH="/Users/phil/.oh-my-zsh"
export PATH="${HOME}/.pyenv/bin:${PATH}"
eval "$(pyenv init -)"

ZSH_THEME="robbyrussell"

plugins=(
  git
  bundler
  dotenv
  osx
  rake
  zsh-autosuggestions
  last-working-dir
  web-search
  cloudfoundry
)

# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source $ZSH/oh-my-zsh.sh
source /Users/phil/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# z extension for browsing
. ~/z.sh

# user configuration
# custom aliases
alias c="code .";
alias ll="ls -la";
alias ..="cd ../";
alias ..l="cd ../ && ll";
alias pg="echo 'Pinging Google' && ping www.google.com";
alias de="cd ~/Desktop";
alias dd="cd ~/code";
alias d="cd ~/code && cd "
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias deleteDSFiles="find . -name '.DS_Store' -type f -delete"
alias npm-update="npx npm-check -u";
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

## git aliases
function gc { git commit -m "$@"; }
alias gcm="git checkout master";
alias gs="git status";
alias gpull="git pull";
alias gf="git fetch";
alias gfa="git fetch --all";
alias gf="git fetch origin";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";
alias gb="git branch";
alias gbr="git branch remote"
alias gfr="git remote update"
alias gbn="git checkout -B "
alias grf="git reflog";
alias grh="git reset HEAD~" # last commit
alias gac="git add . && git commit -a -m "
alias gsu="git gpush --set-upstream origin "
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"

## checkout a new remote branch (exists remote, not locally)
## git checkout -b LocalName origin/remotebranchname (checkout a remote branch)

## npm aliases
alias ni="npm install";
alias nrs="npm run start -s --";
alias nrb="npm run build -s --";
alias nrd="npm run dev -s --";
alias nrt="npm run test -s --";
alias nrtw="npm run test:watch -s --";
alias nrv="npm run validate -s --";
alias rmn="rm -rf node_modules";
alias flush-npm="rm -rf node_modules && npm i && echo NPM is done";

## yarn aliases
alias yar="yarn run"; # lists all the scripts we have available
alias yab="yarn build"; # build dist directory for each package
alias yal="yarn lint:fix"; # format source and auto-fix eslint issues
alias yac="yarn commit"; # open a Q&A prompt to help construct valid commit messages
alias yas="yarn start";
alias yasb="yarn storybook:start"; # start storybook
alias yat="yarn test"; # run the unit tests*
alias yatw="yarn test:watch"; #run the unit tests for files changed on save

## docker
alias dockerstop='docker-compose stop'
alias dockerrestart='docker-compose restart'
alias dockerup='docker-compose up -d'
alias dockerrm='docker-compose rm --all'

## other aliases
alias zshrc='code ~/.zshrc'
alias topten="history | commands | sort -rn | head"
alias myip="curl http://ipecho.net/plain; echo"
alias dirs='dirs -v | head -10'
alias usage='du -h -d1'
alias update="source ~/.zshrc"
alias sshdir="cd ~/.ssh"
alias runp="lsof -i "
alias md="mkdir "
alias ..='cd ..'
alias ...='cd ../..'

## this loads NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

## custom functions
gpr() {
  if [ $? -eq 0 ]; then
    github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#http://#' -e 's@com:@com/@' -e 's%\.git$%%'`;
    branch_name=`git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`;
    pr_url=$github_url"/compare/master..."$branch_name
    open $pr_url;
  else
    echo 'failed to open a pull request.';
  fi
}

commands() {
  awk '{a[$2]++}END{for(i in a){print a[i] " " i}}'
}
source /Users/phil/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Custom Aliases 
alias reload='source .zshrc'

# Edit web dev
alias edithosts='sudo vim /etc/hosts'
alias edithttpd='edit /etc/apache2/httpd.conf'
alias editphp='edit /etc/php.ini'
alias editvhosts='edit /etc/apache2/extra/httpd-vhosts.conf'
alias media="ssh -t icedcoffee@media.icedcoffee.ie 'cd ~/torrents/data; bash'"
alias memcpu='ps -amcwwwxo "command %mem %cpu" | head -20'
alias showhidden='defaults write com.apple.finder AppleShowAllFiles -bool TRUE | killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles -bool FALSE | killall Finder'
alias ydl='youtube-dl --extract-audio --audio-format wav'
alias rsync='rsync -R --append --partial --ignore-existing --size-only -Pavz'
alias web='ssh phil@icedcoffee.ie'
alias fail2banchek='sudo iptables -L | grep'
alias fail2banremove='sudo fail2ban-client set sshd unbanip'
alias speedtest='speedtest-cli'
alias ssh-aws='ssh -i ~/Dropbox/AWS\ Key/2019_0902.pem ec2-user@3.10.111.135'
alias config='/usr/bin/git --git-dir=/Users/icedcoffee/.cfg/ --work-tree=/Users/icedcoffee'


# AWS commands
alias awslogin='ssh -i ~/Dropbox/AWS\ Key/2019_0902.pem ec2-user@ec2-3-8-156-26.eu-west-2.compute.amazonaws.com'

#Fastly commands
alias curlo='curl -w "\nLookup time:\t%{time_namelookup}\nConnect time:\t%{time_connect}\nPreXfer time:\t%{time_pretransfer}\nStartXfer time:\t%{time_starttransfer}\n\nTotal time:\t%{time_total}\n" -svo /dev/null'
alias fc='fastlycli'
alias ssheav='ssh heavenly-slwdc9047'
alias ssheav4='ssh heavenly-slwdc9044'
alias fctl='fastlyctl'


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
alias sp='spotify'
alias spp='spotify play'
alias sps='spotify stop'
alias config='/usr/bin/git --git-dir=/Users/phil/.dotfiles/ --work-tree=/Users/phil'
