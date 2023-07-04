#!/bin/bash

read -p "Enter filename to add ('.' = all): " ADD

git add $ADD

read -p "Enter message for commit: " message

echo "current branch = $(git branch --show-current)"


url=$1
git commit -m $message

if [ $# != 0 ]; then
  git remote add moranbachner $url
  git push origin $(git branch --show-current)
fi

#/gitpush.sh https://github.com/moranbachner/examrepogad.git להוסיף קישור לפי מי שהוא נתן 
# מעלה לי את מה שרציתי 
#history > history.txt  בפעם הראשונה
#history >> history.txt  בפעם השנייה 
#history -c מנקה את ההיסטוריה
#history -w  זה עושה כמו החץ זה מייצר קובץ בשם היסטוריה.
# כל פקודה שלא יודעת --help 