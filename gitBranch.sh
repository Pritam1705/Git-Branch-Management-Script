#!/bin/bash
ListBranch(){
        git branch
}
createBranch(){

        git branch $1
}
deleteBranch(){
        branchname=$1
        git branch -D $branchname
}
mergeBranch(){
        branch1=$1
        branch2=$2
        git merge $branch1 $branch2
}
rebaseBranch(){
	 branch1=$1
        branch2=$2
        git rebase $branch1 $branch2
}

while getopts ":lb:d:m1:2:r1:2:" opt; do
  case ${opt} in
    l)
      ListBranch
      ;;
    b)
      createBranch $OPTARG

      ;;
    d)
          deleteBranch $OPTARG
      ;;


m) 
	mergeBranch $branch1 $branch2
	;;
     
   1)
         branch1=$OPTARG
         ;;
   2)    branch2=$OPTARG
	   
       
	   mergeBranch $branch1 $branch2

      ;;


      r)
        rebaseBranch $branch1 $branch2
        ;;

   1)
         branch1=$OPTARG
         ;;
   2)    branch2=$OPTARG


           rebaseBranch $branch1 $branch2

      ;;

    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done
