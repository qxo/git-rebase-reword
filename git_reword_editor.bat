rem git config --global alias.reword "!f() { echo $1;  if [ -z \"$1\" ] ; then echo 'need arg1 !' ;exit 1 ;fi ; export REWORD_COMMIT=$(git rev-parse  --short \"$1\");echo REWORD_COMMIT=$REWORD_COMMIT;export REBASE_COMMIT=$(git rev-parse  --short \"$REWORD_COMMIT~1\"); echo REBASE_COMMIT=$REBASE_COMMIT;export GIT_SEQUENCE_EDITOR='git_reword_editor.bat';git rebase -i $REBASE_COMMIT; }; f"
rem after add alias,then git reword HEAD~3
echo %1
echo "REWORD_COMMIT=%REWORD_COMMIT%"
sed -i "s#^pick %REWORD_COMMIT%#reword %REWORD_COMMIT%#g" %1
cat %1
rem exit 1