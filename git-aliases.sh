alias fixup="git commit -a --fixup HEAD"
alias squash="git rebase -i --autosquash origin/master"
alias rebase="git fetch && git rebase -i origin/master"
function branch() {
    git checkout -b "dmcc/$1"
    git commit --allow-empty -m "$1 - "
    git push -u origin "dmcc/$1"
}
function branchm() {
    git checkout master
    git fetch
    prune
    git reset --hard origin/master
    branch "$1"
}
alias pub="git push -f"
function prune() {
   git remote prune origin
   git branch --merged | grep dmcc/ | xargs git branch -d
}
