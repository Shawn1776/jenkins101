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
```
This is a Bash script that sets some variables based on the filename and path of the script itself. Here's what each line does:

`#!/usr/bin/bash`: This is a shebang line that tells the system which interpreter to use to run this script (in this case, Bash).

`shopt -s extglob`: This enables extended globbing, which allows for more powerful pattern matching in filenames.

`fn=$(basename $0)`: This sets the variable fn to the filename of the script, as determined by the basename command, which removes the path and returns just the filename.

`dn=$(dirname $0)`: This sets the variable dn to the directory path of the script, as determined by the dirname command, which returns the path without the filename.

`bin=$dn/${fn%%_*}`: This sets the variable bin to the path of the script without its extension, by combining `dn` and `${fn%%_*}`. `${fn%%_*}` is a parameter expansion that removes everything after the first underscore in the filename. This assumes that the filename follows a certain naming convention, where the script name is separated from its extension and any additional information by an underscore.

`ext=${0##+([^-])}`: This sets the variable ext to the extension of the script, using another parameter expansion. `${0##+([^-])}` removes everything up to the last hyphen in the filename, effectively returning the extension.

Overall, this script sets the variables fn, dn, bin, and ext, which could be used for further processing or manipulation of the script's filename and path.

```bash
ext=${0##+([^-])}

exec $bin$ext \
    ...
    ...
```
This line uses the variables bin and ext that were set earlier to construct the path to the executable file that should be executed instead of the current script. The exec command replaces the current process with the new one, so this line effectively launches the new executable and ends the current script.

`${0##+([^-])}` expands to the extension of the current script file. The `##` operator removes the longest match of the pattern on the right-hand side from the beginning of the variable value. `+([^-])` is an extended globbing pattern that matches one or more characters that are not a hyphen, effectively skipping over any hyphens in the filename. So ${0##+([^-])} removes everything up to the last hyphen in the filename, leaving only the extension.

`$bin$ext` concatenates the values of the bin and ext variables, resulting in the full path to the new executable file. The `\` at the end of the line is a line continuation character, indicating that the command continues on the next line.