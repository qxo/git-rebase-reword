# git-rebase-reword

git-rebase-reword is a simple git command to change one commit (last or older) the same way as you ammend

## Documentation

It is named after the action on rebase interactive to ammend a commit "reword". See [this post](https://robots.thoughtbot.com/git-interactive-rebase-squash-amend-rewriting-history) and [git rebase man](http://git-scm.com/docs/git-rebase) -section interactive mode-
##Install

Download and symlink to your path

```bash
$ git clone https://github.com/albfan/git-rebase-reword.git
$ cd git-rebase-reword
```
#### for windows: 
* copy `git_reword_editor.bat` to  your %PATH%
* make git reword alias : 

```bash
  git config --global alias.reword "!f() { echo $1;  if [ -z \"$1\" ] ; then echo 'need arg1 !' ;exit 1 ;fi ; export REWORD_COMMIT=$(git rev-parse  --short \"$1\");echo REWORD_COMMIT=$REWORD_COMMIT;export REBASE_COMMIT=$(git rev-parse  --short \"$REWORD_COMMIT~1\"); echo REBASE_COMMIT=$REBASE_COMMIT;export GIT_SEQUENCE_EDITOR='git_reword_editor.bat';git rebase -i $REBASE_COMMIT; }; f"
```

#### for linux  
* copy or link `git_reword_editor.sh`  to your $PATH
* make git reword alias : 
```bash
  git config --global alias.reword '!f() { echo input=$1; if [ -z "$1" ] ; then echo "need arg1 !" ;exit 1 ;fi ; export REWORD_COMMIT=$(git rev-parse  --short $1 );echo REWORD_COMMIT=$REWORD_COMMIT;export REBASE_COMMIT=$(git rev-parse  --short ${REWORD_COMMIT}~1); echo REBASE_COMMIT=$REBASE_COMMIT;export GIT_SEQUENCE_EDITOR=git_reword_editor.sh;git rebase -i $REBASE_COMMIT; }; f'
```

##Usage

```bash
$ cd <repo>
$ git reword <commit|symbolic-ref>
```

## Examples

```bash
# reword a commit
$ git reword b68f560
# reword a reference
$ git reword HEAD^
# reword last commit
$ git reword
```