GITHUB_USERNAME=jonbinney

alias gs="git status"
alias gc="git checkout"
alias gd="git diff"
alias gp="git push"
alias gr="git remote"

# Add a git fork (that already exists) as a remote in the
# current repo.
function gaf {
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

