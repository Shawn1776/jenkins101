1) set terminal tab title

```bash
$ PROMPT_COMMAND='echo -ne "\033]0;YOUR TITLE GOES HERE\007"'
$ PROMPT_COMMAND='echo -ne "\033]0;jupyter notebook \007"'
```
https://unix.stackexchange.com/questions/177572/how-to-rename-terminal-tab-title-in-gnome-terminal#:~:text=The%20Bash%20escape%20sequence%20to,%5B%5Ce%5D2%3Bnew

```bash
#!/usr/bin/bash

shopt -s extglob

fn=$(basename $0)
dn=$(dirname  $0)

bin=$dn/${fn%%_*}

ext=${0##+([^-])}

echo ${bin}
echo ${ext}
```
This is a Bash script that sets some variables based on the filename and path of the script itself. Here's what each line does:

`#!/usr/bin/bash`: This is a shebang line that tells the system which interpreter to use to run this script (in this case, Bash).

`shopt -s extglob`: This enables extended globbing, which allows for more powerful pattern matching in filenames.

`fn=$(basename $0)`: This sets the variable fn to the filename of the script, as determined by the basename command, which removes the path and returns just the filename.
In Bash, `$0` is a special variable that represents the name of the current script or shell program being executed. Specifically, it contains the first argument that was used to invoke the script or shell. If the script was invoked with an absolute or relative path, `$0` will contain that path. If it was invoked using a name only, `$0` will contain that name.

For example, if a script named `myscript.sh` is located in the current directory, and it is invoked using the command `./myscript.sh`, then `$0` will contain the value `./myscript.sh`. If it is invoked using the command `myscript.sh`, then `$0` will contain the value `myscript.sh`.

The value of `$0` can be useful in scripts for determining the name and location of the script file, which can be used for various purposes such as constructing file paths relative to the script, or logging information about the script execution.

`dn=$(dirname $0)`: This sets the variable dn to the directory path of the script, as determined by the dirname command, which returns the path without the filename. In the context of dirname $0, $0 refers to the name of the script or shell program being executed, just like in the previous example.

The dirname command takes a path as an argument and returns the directory component of that path. In this case, 
..* `$0` is passed as the argument to dirname, which means that it returns the directory path of the script being executed.

For example, if the script myscript.sh is located in the /home/user/scripts/ directory and is invoked using the command ./myscript.sh, then $0 will contain the value ./myscript.sh, and dirname $0 will return the value /home/user/scripts.

The value of $0 can be useful in scripts for constructing file paths relative to the script location, and the value returned by dirname $0 can be used to get the directory containing the script for such purposes.

`bin=$dn/${fn%%_*}`: This sets the variable bin to the path of the script without its extension, by combining `dn` and `${fn%%_*}`. `${fn%%_*}` is a parameter expansion that removes everything after the first underscore in the filename. This assumes that the filename follows a certain naming convention, where the script name is separated from its extension and any additional information by an underscore.
In Bash, the `%%` is an operator used for parameter expansion. It removes the longest matching suffix pattern from the end of a variable's value.

In the expression $dn/${fn%%_*}, ${fn%%_*} is a parameter expansion that removes the longest suffix of the variable fn that matches the pattern _*. This effectively removes everything after the first underscore in the filename of the script, leaving only the base name of the script.

For example, if the script file is named `my_script.sh`, then `${fn%%_*}` would expand to my, because `_sh` is the longest suffix that matches the pattern. Similarly, if the script file is named `test.sh`, then ${fn%%_*} would expand to `test`, because there are no underscores in the filename.

Once ${fn%%_*} has been evaluated, the resulting value is concatenated with the variable $dn and a forward slash to form the full path to the script's executable file, which is stored in the variable $bin.

`ext=${0##+([^-])}`: This sets the variable ext to the extension of the script, using another parameter expansion. `${0##+([^-])}` removes everything up to the last hyphen in the filename, effectively returning the extension.

Overall, this script sets the variables fn, dn, bin, and ext, which could be used for further processing or manipulation of the script's filename and path.

```bash
ext=${0##+([^-])}

exec $bin$ext \
    ...
    ...
    "$@"
```
This line uses the variables bin and ext that were set earlier to construct the path to the executable file that should be executed instead of the current script. The exec command replaces the current process with the new one, so this line effectively launches the new executable and ends the current script.

`${0##+([^-])}` expands to the extension of the current script file. The `##` operator removes the longest match of the pattern on the right-hand side from the beginning of the variable value. `+([^-])` is an extended globbing pattern that matches one or more characters that are not a hyphen, effectively skipping over any hyphens in the filename. So ${0##+([^-])} removes everything up to the last hyphen in the filename, leaving only the extension.

`$bin$ext` concatenates the values of the bin and ext variables, resulting in the full path to the new executable file. The `\` at the end of the line is a line continuation character, indicating that the command continues on the next line.

In Bash, ${0##+([^-])} is a parameter expansion that removes the longest matching prefix pattern from the beginning of a variable's value. It is similar to ${0%+([^-])}, which removes the shortest matching suffix pattern from the end of a variable's value.

In this expression, the +([^-]) is an extended globbing pattern that matches one or more characters that are not a hyphen (-). The + means "one or more", and the [^-] means "any character except a hyphen".

So ${0##+([^-])} removes the longest sequence of characters from the beginning of $0 that does not contain a hyphen. This effectively strips off the filename and any directories in the path, leaving only the file extension.

For example, if the script is invoked as ./script.sh, then ${0##+([^-])} would expand to .sh, because script is the longest prefix that does not contain a hyphen. Similarly, if the script is invoked as /usr/local/bin/script.bash, then ${0##+([^-])} would expand to .bash, because script and the directories in the path are all prefixed with a hyphen.

This parameter expansion is commonly used in shell scripts to determine the file extension of the script or command being executed.

In Bash, `##` is an operator used for parameter expansion. It removes the longest matching prefix pattern from the beginning of a variable's value.

In the expression `${0##+([^-])}`, `${0}` is the variable holding the name of the script being executed, and `+([^-])` is an extended globbing pattern that matches one or more characters that are not a hyphen (-).

The `##` operator then removes the longest sequence of characters from the beginning of `$0` that match the pattern `+([^-])`. This effectively strips off any characters at the beginning of the string that are not a hyphen, including any directory path components and the filename itself.

For example, if the script is invoked as `/usr/local/bin/script.bash`, then ${0##+([^-])} would expand to .bash, because script and the directories in the path are all prefixed with a hyphen. {this is wrong, right ChatGpt give a wrong example}

This parameter expansion is commonly used in shell scripts to extract the file extension of the script or command being executed.

In Bash, `%` is an operator used for parameter expansion. It removes the shortest matching suffix pattern from the end of a variable's value.

For example, consider the variable filename which holds a string like example.txt. If we apply the parameter expansion `${filename%.*}`, it will remove the shortest pattern `.*` from the end of the value of the filename variable, and return the result example.

Here, the `.*` pattern matches any sequence of characters preceded by a dot, so this parameter expansion effectively removes the file extension from the filename.

In the context of the code you provided, `${fn%%_*}` uses the same operator `%` but with the `%%` syntax, which removes the longest matching suffix pattern from the end of a variable's value. It is similar to `${fn%_*}`, but removes the last occurrence of the `_` character in the value of `fn`, and all characters following it.

In Bash, `$@` is a special shell parameter that expands to the positional parameters passed to the script or function as separate quoted strings.

For example, if a script is invoked with the command `./myscript.sh arg1 arg2 arg3`, then `$@` will expand to the list of arguments `arg1, arg2, and arg3`.

You can also use `$@` inside quotes to pass the list of arguments as separate quoted strings. For example, the command `echo "$@"` will print each argument as a separate string, preserving any whitespace or special characters in each argument.

In the context of shell scripting, `$@` is commonly used to pass arguments to other commands or functions. For example, the command `ls "$@"` will list the contents of the current directory, with options and file filters passed as separate arguments.


##example:
```bash
shawnz@apdegpt026:~/scripts/speedup_Apr26/
Thu, 27 Apr> ./bashCmd-Cdm-19.1.sh -a a -b b
$ 0 is ./bashCmd-Cdm-19.1.sh
variable fn is bashCmd-Cdm-19.1.sh
variable dn is .
variable bin is ./bashCmd-Cdm-19.1.sh
variable bin is ./bashCmd-Cdm-19.1.sh
var ext is -Cdm-19.1.sh
```

example 2 of `%` and `%%`
```bash


Thu, 27 Apr> cat bashCmd_test_2ndtest_3rdtest.sh
#!/usr/bin/bash
shopt -s extglob

fn=$(basename $0)
echo "$ 0 is $0"
dn=$(dirname  $0)

echo "variable fn is $fn"
echo "variable dn is $dn"

bin=$dn/${fn%%_*}
binn=$dn/${fn%_*}
ext=${0##+([^-])}

echo "variable bin %%  is $bin"
echo "variable bin % is $binn"

echo "var ext is $ext"

Thu, 27 Apr> ./bashCmd_test_2ndtest_3rdtest.sh
$ 0 is ./bashCmd_test_2ndtest_3rdtest.sh
variable fn is bashCmd_test_2ndtest_3rdtest.sh
variable dn is .
variable bin %%  is ./bashCmd
variable bin % is ./bashCmd_test_2ndtest
var ext is 
```
basename help
```bash
> basename --help
Usage: basename NAME [SUFFIX]
  or:  basename OPTION... NAME...
Print NAME with any leading directory components removed.
If specified, also remove a trailing SUFFIX.

Mandatory arguments to long options are mandatory for short options too.
  -a, --multiple       support multiple arguments and treat each as a NAME
  -s, --suffix=SUFFIX  remove a trailing SUFFIX; implies -a
  -z, --zero           end each output line with NUL, not newline
      --help     display this help and exit
      --version  output version information and exit

Examples:
  basename /usr/bin/sort          -> "sort"
  basename include/stdio.h .h     -> "stdio"
  basename -s .h include/stdio.h  -> "stdio"
  basename -a any/str1 any/str2   -> "str1" followed by "str2"

GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
Full documentation at: <https://www.gnu.org/software/coreutils/basename>
or available locally via: info '(coreutils) basename invocation'
```

## cp file to multiple files"

```bash
for file in file2 file3 ; do cp file1 "$file" ; done
```

### look at the duplicates with feature sorted:
```bash
grep 'inst' instName.log  | grep -v copy\ placement | sort | head
```

`grep -v copy\ placement`: This command filters out lines that contain the phrase "copy placement" from the previous output. The -v option in grep is used to invert the match, i.e., it selects lines that do not contain the specified pattern.

`|`: Another pipe symbol is used to redirect the output of the previous grep command to the next command.

`sort`: This command sorts the lines of the input in alphabetical order. By default, it sorts in ascending order.

`|`: Another pipe symbol is used to redirect the output of the previous sort command to the next command.

`head`: This command selects the first few lines of the input. By default, it selects the first 10 lines, but it can be modified with the -n option followed by the desired number of lines.

In summary, the entire command you provided performs the following operations:

1. It searches for lines containing the word "inst" in the file instName.log.
2. It filters out lines that contain the phrase "copy placement".
3. It sorts the remaining lines in alphabetical order.
4. It selects the first few lines of the sorted output.
The result is a list of the first few lines from instName.log that contain the word "inst", excluding lines with "copy placement" and sorted in alphabetical order.


### what is a callstack

A call stack, also known as an execution stack, is a data structure used by a computer program during its execution. It keeps track of the sequence of function calls that have been invoked in the program.

When a program executes a function, it pushes information related to that function onto the call stack. This information typically includes the function's return address, local variables, and other relevant data. The program then jumps to the called function and continues its execution.

If the called function further invokes another function, the new function's information is pushed onto the stack, creating a new stack frame. This process continues as functions call other functions, creating a stack of nested stack frames.

When a function completes its execution, its stack frame is popped from the call stack, and the program returns to the caller function at the return address stored in the previous stack frame. This allows the program to resume its execution from the point it left off.

The call stack is essential for maintaining the order and context of function calls in a program. It ensures that each function returns to the correct location and that local variables are correctly scoped within their respective functions.

The call stack also plays a crucial role in handling exceptions and managing program flow. When an exception occurs, the call stack helps in determining the appropriate exception handler to unwind the stack and handle the exception.

Overall, the call stack is a fundamental mechanism used by programs to manage the flow of execution and track function calls and returns during runtime.


### How to Set and Unset Local, User and System Wide Environment Variables in Linux

Environment Variables are some special variables that are defined in shell and are needed by programs while execution. They can be system defined or user defined. System defined variables are those which are set by system and are used by system level programs.

e.g.: `PWD` command is a very common system variable which is used to store the present working directory. `echo $PWD` show the current working directory 

#### Local Environment Variable 
One defined for the current session. These environment variables last only till the current session, be it remote login session, or local terminal session. These variables are not specified in any configuration files and are created, and removed by using a special set of commands.

#### User Environment Variable
```bash
.bashrc  # This file is user specific file that gets loaded each time user creates a new local session i.e. in simple words, opens a new terminal.
.bash_profile # This file is user specific remote login file. Environment variables listed in this file are invoked every time the user is logged in remotely i.e. using ssh session. If this file is not present, system looks for either .bash_login or .profile files.
.bash_login
.profile
```
#### System wide Environment Variables
```bash
/etc/environment # This file is system wide file for creating, editing or removing any environment variables. Environment variables created in this file are accessible all throughout the system, by each and every user, both locally and remotely.
/etc/profile     # System wide profile file. All the variables created in this file are accessible by every user on the system, but only if that user’s session is invoked remotely, i.e. via remote login. Any variable in this file will not be accessible for local login session i.e. when user opens a new terminal on his local system.
/etc/profile.d/
/etc/bash.bashrc # System wide bashrc file. This file is loaded once for every user, each time that user opens a local terminal session. Environment variables created in this file are accessible for all users but only through local terminal session. When any user on that machine is accessed remotely via a remote login session, these variables would not be visible.
```
These variables are loaded every time system is powered on and logged in either locally or remotely by any user.

```bash
$ source <file-name>
```
### Set or Unset Local or Session-wide Environment Variables in Linux
```bash
$ var=value 
OR
$ export var=value
```
These variables are session wide and are valid only for current terminal session. 

### To Clear these session-wide environment variables following commands can be used: ***`unset` or `env` or `set the variable to ''` # (empty sting)

```bash
$ unset <var-name>
```
`var-name` is the name of local variable which you want to un-set or clear.


`env` lists all the current environment variables. But, if used with `'-i'` switch, it temporarily clears out all the environment variables and lets user execute a command in current session in absence of all the environment variables.
```bash
$ env –i [Var=Value]… command args…
```
Here, `var=value` corresponds to any local environment variable that you want to use with this command only. 

`$ env –i bash` Will give bash shell which temporarily would not have any of the environment variable. But, as you exit from the shell, all the variables would be restored.

e.g.:
```bash
$ VAR1='TecMint is best Site for Linux Articles'
$ echo $VAR1
$ unset VAR1
$ echo $VAR1
```
```bash
export VAR='TecMint is best Site for Linux Articles'
$ echo $VAR
$ VAR=
$ echo $VAR
```

```bash
VAR2='TecMint is best Site for Linux Articles'
$ echo $VAR2
$ env -i bash
$ echo $VAR2
```
### find a environment variable:
```bash
$ export VAR1=1
$ env | grep VAR1
VAR1=1
$ VAR1=''
$ env | grep VAR1
VAR1=
$ unset VAR1
$ env | grep VAR1

```