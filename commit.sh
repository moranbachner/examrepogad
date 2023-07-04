#!/bin/bash
#git add . 
# כדיי להריץ עושים ./commit.sh אחריי הקומיט את ID,message
read -p "Enter the CSV filename: " moran.csv

if [ ! -e $filename ]; then
  echo "File $filename does not exists."
  exit 1
fi

if [  $# -ne 2 ]; then
  echo "Two arguments are required."
  exit 2  
fi

TaskID=$1
messege=$2
current_branch=$(git branch --show-current)
read -p "Do you want to push the changes into git hub? Y/n " Bool_Push

TaskID_file=$(grep $TaskID $filename| cut -d',' -f1) 
task_branch=$(grep $TaskID $filename| cut -d',' -f3) 
name=$(grep $TaskID $filename| cut -d',' -f4)
url=$(grep $TaskID $filename| cut -d',' -f5)  
if [ $TaskID == $TaskID_file ]; then
  if [ $current_branch != $task_branch ]; then
      echo "Your not in your branch"
      exit 3
  fi

  git commit -m $messege
    
  if [ $Bool_Push == 'Y' ]; then
      git remote add moranbachner $url
      git push origin $current_branch
  fi
fi

#git checkout [branch_name] ככה מחליפים ענף בגיט