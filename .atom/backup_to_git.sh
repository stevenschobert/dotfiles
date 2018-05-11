git add --force .
cat .gitignore | xargs -I "@" git reset -- "@"
