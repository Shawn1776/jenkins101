# jenkins101

Dedug: ERROR: Couldn't find any revision to build

Avoid second fetch
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse origin/master^{commit} # timeout=10
ERROR: Couldn't find any revision to build. Verify the repository and branch configuration for this job.
Finished: FAILURE

This is simply because github change the default branch name from "master" to "main"
In your project -> Configure:
change master to main or blank 
![Screen Shot 2023-03-01 at 10 17 17 AM](https://user-images.githubusercontent.com/12838605/222182124-87d7742d-1198-40c7-909d-b9cc3bb6a1b5.png)
