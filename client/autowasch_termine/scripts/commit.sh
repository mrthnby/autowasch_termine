MESSAGE=$*

git add .
git commit -m "$MESSAGE"
git push --set-upstream origin client