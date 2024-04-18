# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x readlink ]]; then
  SCRIPT_PATH=$(readlink -n $CURRENT_SCRIPT)
  DOTFILES_DIR="${PWD}/$(dirname $(dirname $SCRIPT_PATH))"
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/system/.{function,function_*,n,path,env,exports,alias,grep,prompt,completion,fix,zoxide}; do
  . "$DOTFILE"
done

if is-macos; then
  for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.macos; do
    . "$DOTFILE"
  done
fi

# Set LSCOLORS

eval "$(dircolors -b "$DOTFILES_DIR"/system/.dir_colors)"

# Wrap up

unset CURRENT_SCRIPT SCRIPT_PATH DOTFILE
export DOTFILES_DIR

OSH_THEME="axin"

eval "$(zoxide init bash)"


# Aliases
alias work="cd /Users/kundb/projects/app-lifecycle-devtools-service"
alias k="kubectl"

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Git
# You must install Git first
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'
alias grm='git rm $(git ls-files --deleted)'

alias mongoup="brew services start mongodb-community@4.4"
alias mongodown="brew services stop mongodb-community@4.4"
alias pegarun="pega && ./run-packed-web --launch-type=cargo -Pprconfig=/Users/kundb/src/master/prconfig.xml"
alias pegarunl="./run-packed-web --launch-type=cargo -Pprconfig=/Users/kundb/src/master/prconfig.xml"
alias pega84runl="./run-packed-web -Pprconfig=/Users/kundb/src/release_8.4/prconfig.xml"
alias pega85runl="./run-packed-web -Pprconfig=/Users/kundb/src/release_8.5/prconfig.xml"
alias pegarund="./sync-db && ./run-packed-web --launch-type=cargo -Pprconfig=/Users/kundb/src/master/prconfig.xml"
alias killjava="kill $(ps aux | grep "java" | grep -v 'grep' | awk '{print $2}')"
alias netup="ping 10.224.200.1"
alias pegatracer="java -Xms512M -Xmx1G -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -jar /Users/kundb/Downloads/pega-tracerviewer-3.1-bin/pega-tracerviewer-3.1/pega-tracerviewer-3.1.jar"
alias auth="okta-awscli --okta-profile dev --profile dev --force"
alias raikiri="aws eks update-kubeconfig --name raikiri --role-arn arn:aws:iam::857793928850:role/end-to-end-kubectl-access-role --region us-east-2 --profile dev"
alias cluster="kubectx"
alias ns="kubens"
alias g="./gradlew"
alias cuttyhunk="/Users/kundb/projects/cuttyhunk-cli/client/cuttyhunk-cli/build/distributions/cuttyhunk-cli-2.25-SNAPSHOT/bin/cuttyhunk"
alias remote="ssh pegauser@veishydcnt05309"
alias dockerPega="docker login platformservices-docker-dev-local.bin.pega.io"
alias node18="/Users/kundb/.config/nvm/versions/node/v18.13.0/bin/node"
export ANDROID_HOME="/Users/kundb/Library/Android/sdk"

export DOCKER_HOST=unix://${HOME}/.colima/docker.sock

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export FLYCTL_INSTALL="/Users/kundb/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/kundb/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
. "$HOME/.cargo/env"
