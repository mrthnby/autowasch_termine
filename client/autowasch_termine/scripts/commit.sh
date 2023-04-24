MESSAGE=$*

git add .
git commit -m "$MESSAGE"
git push origin client
