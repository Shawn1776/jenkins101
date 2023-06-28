
0) chceck tokens and git access first!!! 
```
```
1) 
```
git clone url
```
2) create dependency softlinks
```
ln -s /source-file-directory/ . 
```
```
3) build
```
make opt
```

4) for a Pull Request  (git fetch-> update locally)
```
git status
git fetch  # git fetch changes from remotes
git pull   # fetch changes and then merges changes to your local branches... 
git checkout <existing_branch>
git checkout -b <new-branch-name>
git banch      # check which branch you are working
git log -p 2 # -p or --patch, 2 limit to 2 items
git remote -v  # show which remote branch you can push to ...
git push origin <brach-name>     # can be what you created before in line 18

# check remote branch and pull from remote branch
git branch -r # -r is short for remote

```
5) check git origin 
```
git remote -v
```
6) after you get your code review make change on your code, test

7) check your git status
```
git status -uno
git status 
git log
```
8) add and commit
```
git commit -am "New Message"
```
9) push to github again: push branch_name to remote origin brach(unsually main branch)
```
git push origin <branch_name>
```
13) wait for new comments or your PR (Push Review) be approved...





1) a git project using submodules:
```
git submodule update --init --recursive
```
an example of a project that uses submodules:

Suppose you're working on a web application that uses several external libraries, such as a JavaScript framework and a CSS styling library. You don't want to include these libraries in your project's main repository, as they're maintained separately and updated frequently.

To manage these external libraries, you can use Git submodules. You create a separate Git repository for each library and add them as submodules to your main project repository. This way, you can include the necessary code from each library in your application, while still maintaining a separation between your codebase and the external libraries.

Whenever you want to update one of the libraries, you simply navigate to the submodule directory and update it from its own repository. Then, you commit the changes to the submodule and push them to its remote repository. Finally, you update the submodule in your main project repository by running the "git submodule update" command, which will pull in the latest changes from the submodule's repository.

By using submodules, you can keep your project organized and up-to-date, while also making it easy to manage external dependencies.

"git submodule update --init --recursive" is used to initialize and update submodules in a Git repository.

Here's what each flag means:

"update": Update the submodules to the latest version.
"init": Initialize submodules in the repository.
"recursive": Initialize and update all submodules recursively.
When you run this command, Git will look for any submodules in the repository and initialize them if they haven't already been initialized. It will also update the submodules to the latest version and pull any changes made to them from their respective repositories.

This command is useful when you're working on a project that uses submodules, as it ensures that all submodules are up-to-date and included in your local copy of the repository.

# show the git diff 
at the directory, where the .git file is loacated... 
1) use tig
```bash
./opt/xsite/cte/tools/git/next/bin/tig
```
```bash
tig 
-> enter 
```
2) use git log
```
tig/<git diff>/<git log>/<git show>  origin/<branch-name>            # in that branch
                                     Head^..origin/<branch-name>     # in-between Head and origin/<branch-name>
```
3) compare for one file
```
git diff master~20:<your-file> <your-file>   # e.g. <your-file>=path/file.c
```

4) git check code change via hash tag

In Git, you can check a code change using a "commit hash", not a hash tag. Here's how you can do it:

Open a terminal or command prompt.
Navigate to the directory of the Git repository where the code change you want to check is located.
Use the following command to view the details of a specific commit:

```php
git show <commit_hash>
```

To see which files are changed in a specific commit using a commit tag, you can use the following command:

```bash
git show --name-only <commit_tag>
```

The git show command will display information about the commit, including the author, date, commit message, and the actual code changes made in that commit.

Yes, you can use tig to see the Git differences. tig is a text-mode interface for Git that provides a visual representation of the commit history and allows you to navigate and view changes.

To use tig to see the Git differences, follow these steps:

Open a terminal or command prompt.
Navigate to the directory of the Git repository where you want to view the differences.
Enter the following command to launch tig:

```bash
tig
```

This will open the tig interface, showing the commit history and the current branch you're on.

Use the arrow keys or j and k keys to navigate through the commits and select the commit you want to inspect.

Press Enter to view the details of the selected commit. This will show the commit message, author, and a list of changed files.

To view the differences for a specific file, select the file and press Enter. This will show a visual representation of the changes made to the file, including added, modified, and deleted lines.

Use the arrow keys to navigate through the changes within the file.

By using tig, you can explore the commit history, view the details of each commit, and examine the differences introduced in the code changes.

### how to push a local non main branch to the master branch in the remote?

```bash
$ git push <remote> <local branch name> : <remote branch to push into>
```
so that for our current working github repo example:

```bash
$ git push origin speed_up_feature_branch : master 
```
we might need to do a rebase first:
```bash
git fetch; git pull --rebase
```
ALTERNATIVELY
simply switch to the `master` branch, `git fetch; git pull` and use `emacs ediff` to merge in the changes you would like to commit

note: the <remote> is the name of the remote url, can be check by `git remote -v`, default value is `origin`


