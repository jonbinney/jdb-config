GITHUB_USERNAME=jonbinney

alias gs="git status"
alias gc="git checkout"
alias gd="git diff"
alias gp="git push"
alias gr="git remote"

# Add a github fork (that already exists) as a remote in the
# current repo.
function ghaf {
  if [ -n "$1" ]
  then
    FORK_ORG=$1
  else
    FORK_ORG=${GITHUB_USERNAME}
  fi
  ORIGIN_URL=`git remote get-url origin`
  REPO_NAME=`basename ${ORIGIN_URL}`
  FORK_URL=git@github.com:${FORK_ORG}/${REPO_NAME}
  echo Creating fork ${FORK_URL}
  git remote add -f ${FORK_ORG} ${FORK_URL}
}

# Clone a repo from github.
function ghc {
  if [ -n "$2" ]
  then
    REPO_ORG=$1
    REPO_NAME=$2
  elif [ -n "$1" ]
  then
    REPO_ORG=${GITHUB_USERNAME}
    REPO_NAME=$1
  else
    echo "Syntax: $0 <repo_org> <repo_name>"
    return
  fi
  REPO_URL=git@github.com:${REPO_ORG}/${REPO_NAME}
  echo Cloning ${REPO_URL}
  git clone ${REPO_URL}
}

