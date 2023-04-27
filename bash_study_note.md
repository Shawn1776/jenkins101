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