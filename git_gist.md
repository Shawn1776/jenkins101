##### v2 Jun28 2023

0) chceck tokens and git access first!!! 
```bash
tokens
which git
git --version
git --help
```
concept: 
git HEAD   : "HEAD" is a special reference in Git that points to the latest commit of the currently checked out branch. It represents the tip of the branch.
git origin : "origin" is the default name for the remote repository where you cloned your local repository from. It is commonly used as a reference to the remote repository's URL.
local      : your local GIT directory, ( note it may not be your local working/developing directory )
remote     : Github (other people's work)

1) I recommand you create a github repo (repository) remotely first, then git clone to your local directory. in that way, the origin, and HEAD is set for you in your local repo
```bash
mkdir -p ~/sandbox/git/PROJECT-NAME
cd ~/sandbox/git/PROJECT-NAME
git clone <url-of-repo>
```
2) do you work...
```bash
editting code
make/build
unit-tests
performance-tests
```
3) check out others' updates before you `git push` your work  (before you push your code to remote repo, you want to check on changes made by your team, so that you want to update your local code first)
```bash
git status                           # check your git branch and un tracked files
git status -uno                      # only show files are tracked, make your status info cleaner
git log                              # show all commits
git log -p 2                         # -p or --patch, 2 limit to 2 commits
git fetch                            # git fetch changes from remotes
git pull                             # fetch changes and then merges changes to your local branches... 
git fetch ; git pull                 
```
4) work on the work and the merging to git direcotry and then commit
```bash
diff -wr <you-sandbox-develop-directory> <you-git-project-repo-direcotry> | grep ^diff        # -wr, is flag for ignoring whitespace in files

git status                                  # check modified/add/untracked files
git add <files> <directory/>                # add file and/or directory/ to track
git rm --cached <file1>                     # rm file or direcotry to track, but not remove file locally, NOTE will remove file in other developer machine when they do a `git pull`
git reset <file>                            # simply untrack (but not remove?)

# do the editting for merging
git commit -am "msg1 | msg2 | msg3 | msg4"
# for mutliple changes 
git commit -am "
>1. change1                                    
>2. change2
>3. change3
>..." 

git commit -aF <log.txt>                                                         # edit the commit msg before commit...                       
```

5) push your code to github 
```bash
git diff --stat --cached origin/master        # check changed made before push
git push                                                                         # if orign and branch set before 
git push origin HEAD                                                             # push the latest local commit to the default remote branch, 
                                                                                 # "HEAD" is a reference to the latest commit of the currently checked out branch.
git push <remote> <local branch name> : <remote branch to push into>             # full git push: e.g.: `git push origin main : main` or 
```

6) other helpful commands
```bash
git --help
git remote -v                         # check your origin setting
etc                                   # there are also concepts of branch, commit, and commit-hash-tag, which we can talk about in future
```

#### no need for now, in future

0)  branch: (sometimes you want to work at a different branch, e.g.: a feature branch to test out some features)
```bash
git checkout <existing-branch-name>    # swith to a different branch, use git switch (after git version 2.23), git checkout is dangerous to use, 
                                       # since `git checkout` had other functionalities like checking out specific files or commits.   
git checkout -b <new-branch-name>
git switch <branch-name>
git banch                              # check which branch you are working at 
git remote -v                          # show which remote branch you can push to ... 
git push origin <brach-name>           # can be what you created before
git branch -r                          # check remote branch and pull from remote branch, -r is short for remote 

```

1) show the git diff 
at the directory, where the .git file is loacated... 
1.1) use tig

```bash
tig                                   # in the directory, where you .git are at ...  
-> Enter 
```
1.2) use git log
```bash
tig/<git diff>/<git log>/<git show>  origin/<branch-name>            # in that branch
                                     Head^..origin/<branch-name>     # in-between Head and origin/<branch-name>
```
1.3) compare for one file
```bash
git diff master~20:<your-file> <your-file>   # e.g. <your-file>=path/file.c
```

1.4) git show code change via hash tag

In Git, you can check a code change using a "commit hash", not a hash tag. Here's how you can do it:
```php
git show <commit_hash>
```
To see which files are changed in a specific commit using a commit tag, you can use the following command:
```bash
git show --name-only <commit_tag>
```
1.5) git checkout, ( be very careful when use git checkout...)
```bash
git checkout <brach-name>                  # swith to a different branch, use git switch (after git version 2.23), git checkout is dangerous to use, 
                                           # since `git checkout` had other functionalities like checking out specific files or commits.   
git switch <branch-name>                                        
git checkout <commit-hash>                 # change your git HEAD to previous <commit-hash>
git checkout master                        # re-align your git HEAD to the latest commit 
```
a better way to take a look at a specific revision of a file, you can either just view it using
```bash
git show 123456:/txt/file.txt
```
or temporarily check out only this file with
```bash
git checkout 123456:/txt/file.txt
// use it
git checkout :/txt/file.txt
```
2) Prevent Visual Studio Code from exposing your Full Name on GitHub public repos

use `git config --global` or `git config --local` to set `user.email` and `user.name`

Open a terminal and change the directory of the repository you want to change and type these commands
```bash
git config --local user.name "Any Joe"
git config --local user.email "any.joe@anonymouse.com"

git config --list
git config --list --show-origin

#check
git config --global user.name
git config --global user.email
# for a single repository
git config user.name "Lisa"
git config user.email "lisa@gmail.com"
#check local
git config user.name
git config user.email

```
more:
