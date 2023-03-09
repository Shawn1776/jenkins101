#!/bin/sh
export prog1=${BASH_SOURCE[0]}
echo $prog1

export prog=${BASH_SOURCE[0]##*/}
echo $prog

# this is build_dir/scripts/sandbox-run-unit-tests.sh

# realpath is equalvelent with readlink -e

# realpath can also track back to a soft link as: 
#ln -s "I am cold" slfile 
#readlink slfile
#I am cold
#### which realpath can not do

export build_dir=$(realpath ${BASH_SOURCE[0]%/*}/../)
echo "[${prog}]: build_dir=${build_dir}"
export app_name=ccc


# ${BASH_SOURCE[0]} is an array variable in Bash 
# that contains the source filename of the currently
# executing Bash script. The [0] index is used to 
# get the first element of the array, which is the filename 
# of the current script.

# The ##*/ syntax is a string manipulation operator in Bash that removes the longest match of */ (i.e., any characters followed by a forward slash) from the beginning of the string. This effectively strips any leading directory path from the filename, leaving just the base name.
# echo $prog
# echo ${BASH_SOURCE[0]}

# set some environment variables
: ${app_name:=ccc} ${version:=1.1}
: ${build_dir:="/build/${app_name}/${version}"} ${dev_dir:="/dev/${app_name}/${version}"} ${prod_dir:="/prod/${app_name}/${version}"}
: ${test_dir:=$build_dir}
export app_name version build_dir dev_dir prod_dir test_dir

# This is a series of Bash shell commands that set some environment variables. Here's a breakdown of the commands:

# : ${app_name:=ccc} ${version:=1.1}:

# This sets the value of the app_name variable to ccc if it is not already set or is empty.
# It also sets the value of the version variable to 1.1 if it is not already set or is empty.
# The leading : is a no-op command that does nothing, but it is used here to suppress any error messages that may result from these assignments.
# : ${build_dir:="/build/${app_name}/${version}"} ${dev_dir:="/dev/${app_name}/${version}"} ${prod_dir:="/prod/${app_name}/${version}"}:

# This sets the values of the build_dir, dev_dir, and prod_dir variables to default values if they are not already set or are empty.
# The default values are formed by concatenating the /build, /dev, and /prod directory paths with the values of app_name and version variables, which were set or defaulted in the previous command.
# The leading : is again used as a no-op to suppress any error messages.
# : ${test_dir:=$build_dir}:

# This sets the value of the test_dir variable to the value of build_dir if it is not already set or is empty.
# The leading : is again used as a no-op to suppress any error messages.
# export app_name version build_dir dev_dir prod_dir test_dir:

# This exports the values of the app_name, version, build_dir, dev_dir, prod_dir, and test_dir variables to the environment so that they can be used by other processes or scripts.
# This makes these variables global, so any child processes or scripts started from this shell will inherit these values.

# In the context of shell scripting, the colon : is a built-in shell command that is used as a placeholder or no-op. It does not do anything, but it can be used to provide a syntax that the shell expects.

# In the command : ${app_name:=ccc}, the colon is used to provide a placeholder for a command. It is followed by an expression that sets a default value for the app_name variable using the Bash parameter expansion syntax ${var:=default}. This syntax sets the value of app_name to default if it is not already set or is empty.

# So, the overall effect of this command is to set the app_name variable to the default value of ccc if it is not already set or is empty. The colon : is used as a no-op here, just to satisfy the syntax of a valid shell command.

# The := is a parameter expansion operator in Bash shell scripting that assigns a default value to a variable if it is either unset or null.

# In the context of the command : ${app_name:=ccc}, the parameter expansion is used to set the value of the app_name variable to the string ccc if it has not been previously set or is empty.

# Here's how the parameter expansion works:

# ${app_name:=ccc} expands to the value of the app_name variable if it is already set and non-empty.
# If app_name is not set or is empty, then it gets assigned the default value of ccc.
# The := operator in the parameter expansion performs the assignment of the default value to the variable if it is not set or is empty.
# So, the overall effect of this parameter expansion is to set the value of app_name to ccc if it is not already set or is empty.

# Parameter expansion is a feature of Bash shell scripting that allows you to manipulate and transform the value of shell variables. Here are three examples of parameter expansion in Bash:

# ${variable:-default} - This expands to the value of the variable if it is set and not empty, and to the default value if the variable is unset or empty.
# For example, consider the following command:
echo ${FOO:-bar}
# export ${FOO}
echo ${FOO:-baz}
echo ${FOO:+baz}

echo ${FOO:=bar}
echo ${FOO:=baz}
echo ${FOO:+baz}
# ${variable%pattern} - This removes the shortest suffix that matches the specified pattern from the value of variable.
filename="file.txt.gz"
echo ${filename%.gz}
# ${variable#pattern} - This removes the shortest prefix that matches the specified pattern from the value of variable.
path="/home/user/data/file.txt"
echo ${path#/home/user}
# These are just a few examples of the many parameter expansion techniques that can be used in Bash scripting.
# || means "or"
# [[ ]], Bash keyword conditional expression, "-d" check if the directory exists, return 0 for existing; if not, returns a 0
#  
# >&2 : sends an error message to the standard error (stderr) output stream 

[[ -d ${test_dir} ]] || {
    # The square brackets [] are used to enclose ${prog} in order to make the output easier to read and parse.
  >&2 echo "[${prog}]: ERROR: test_dir ${test_dir} not found!"
  exit 1
} 
# In Bash scripting, the exit 1 command terminates the script immediately with a non-zero exit status code, indicating that the script encountered an error or failure. When the Bash interpreter encounters an exit command, it terminates the currently executing script and returns the specified status code to the shell environment.

: ${ATK_ROOT:=/Users/shawn/git-sandbox/learn_tools/jenkins101/$version}
echo $ATK_ROOT

: ${TEST_PLINUX_DEBUG_SCRIPTS:="$script/test_!(m_strap_amd).tcl"}
# This code snippet appears to be setting the default value for an environment variable called TEST_PLINUX_DEBUG_SCRIPTS.

# The syntax used is called parameter expansion, specifically the ${parameter:=word} form. Here's what it does:

# ${TEST_PLINUX_DEBUG_SCRIPTS} expands the variable named TEST_PLINUX_DEBUG_SCRIPTS.
# := is a special operator that tests whether the variable is set and not null. If the variable is not set or is null, it sets it to the value of word (in this case, $script/test_!(m_strap_amd).tcl).
# $script/test_!(m_strap_amd).tcl is a path to a file or script that is being specified as the default value for the TEST_PLINUX_DEBUG_SCRIPTS variable.
# The !(m_strap_amd) in the path appears to be a shell globbing pattern that excludes files or scripts containing the string m_strap_amd. This means that the default value for TEST_PLINUX_DEBUG_SCRIPTS will be set to any file or script that matches the pattern test_*.tcl, except for those containing m_strap_amd in their names.

# It's worth noting that this code is using the : operator instead of the more common = operator to assign a default value. The : operator will only set the variable to the default value if it is unset or null, whereas the = operator will overwrite the value of the variable even if it is already set.
