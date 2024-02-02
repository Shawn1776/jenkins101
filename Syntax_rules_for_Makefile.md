A Makefile is a script used in software development to automate the build process of a project.
Here's an extended list of Makefile syntax rules with examples:

1. **Comments:**
   ```makefile
   # This is a comment
   ```

   Lines starting with `#` are treated as comments.

2. **Variables:**
   ```makefile
   VARIABLE_NAME = value
   ```
      - Variables are used to store values.
   - Use `$(VARIABLE_NAME)` to reference the value of a variable.
   e.g.:
   ```makefile
   CC = gcc
   CFLAGS = -Wall
   ```
   -`CC` is a variable for the compiler, and `CFLAGS` stores compiler flags.


3. **Automatic Variables:**
   - **`$@`:** Represents the target.
   - **`$<`:** Represents the first dependency.
   - **`$^`:** Represents all dependencies.
e.g.:
```makefile
all: program

program: main.o utils.o
    $(CC) $(CFLAGS) -o $@ $^

main.o: main.c
    $(CC) $(CFLAGS) -c -o $@ $<
```
`$@` : Represents the target (program in this case).
`$<` : Represents the first dependency (`main.c`).
These can be used in the commands section of a rule.

4. **Target and Dependency Rules:**
   ```makefile
   target: dependencies
       commands
   ```

   - **Target:** The file or task to be built.
   - **Dependencies:** Files or tasks that the target depends on.
   - **Commands:** Shell commands to build the target.

5. **Pattern Rules:** 
Defines a rule that can be applied to a set of files.

   ```makefile
   %.o: %.c
       commands
   ```
   - Defines a rule that can be applied to a set of files.
   - For example, this rule says how to build a `.o` file from a corresponding `.c` file.
   e.g.:

   ```makefile
   program: main.o utils.o
    $(CC) $(CFLAGS) -o $@ $^
   ```
   e.g.: 2
   ```makefile
   %.o: %.c
      $(CC) $(CFLAGS) -c -o $@ $<
   ```

6. **Wildcard Characters:**
```makefile
SOURCES = *.c
OBJECTS = $(SOURCES:.c=.o)
```
   - *.c matches all .c files.
   - $(SOURCES:.c=.o) replaces the extension from .c to .o.
   - `*` represents any string of characters.
   - `?` represents any single character.

7. **Phony Targets:**
sepcify a task, rather than the name of a file.

   ```makefile
   .PHONY: clean
   clean:
       rm -f *.o myprogram
   ```

   - Specifies that `clean` is not the name of a file but rather a task.
   - Helpful to prevent conflicts with real files named `clean`.

8. **Conditional Statements:**
   ```makefile
   ifdef MY_VARIABLE
       # Code to execute if MY_VARIABLE is defined
   else
       # Code to execute if MY_VARIABLE is not defined
   endif
   ```
e.g.:
   ```makefile
   ifdef DEBUG
      CFLAGS += -g
   else
      CFLAGS += -O2
   endif
   ```
   - Conditional compilation based on the existence of the DEBUG variable.
   - Used for conditional compilation based on the existence of a variable.

9. **Include Statements:**
   ```makefile
   include myothermakefile.mk
   ```

   - Includes content from another makefile.

10. **Shell Commands:**
    ```makefile
    VARIABLE := $(shell command)
    ```
e.g.:
   ```makefile
   processor := $(shell uname -p)
   ```
    - Allows capturing the output of shell commands into variables.

11. **Silent Rules:**
    ```makefile
    .SILENT:
    ```

    - Suppresses echoing of the commands executed.

12. **Special Built-in Targets:**
    - `.DEFAULT`: Used for defining default rules.
    - `.PRECIOUS`: Specifies files that should not be deleted as intermediate files.
    - `.INTERMEDIATE`: Lists files that are intermediate and can be deleted after use.
    In GNU Make, special built-in targets are used for specific purposes. These targets have predefined behavior and are often used for controlling the make process. Here are some of the special built-in targets:

12.1. **`.SUFFIXES`:**
   - Used to define the suffixes considered for implicit rules.
   - Example:
     ```makefile
     .SUFFIXES: .c .o
     ```

12.2. **`.PHONY`:**
   - Lists phony targets that do not represent actual files.
   - Example:
     ```makefile
     .PHONY: clean all
     ```

12.3. **`.INTERMEDIATE`:**
   - Lists files that are considered intermediate and can be deleted after use.
   - Example:
     ```makefile
     .INTERMEDIATE: temp_file
     ```

12.4. **`.PRECIOUS`:**
   - Specifies files that should not be deleted as intermediate files.
   - Example:
     ```makefile
     .PRECIOUS: important_file
     ```

12.5. **`.DEFAULT`:**
   - Specifies the default goal when no target is specified on the command line.
   - Example:
     ```makefile
     .DEFAULT_GOAL := all
     ```

12.6. **`.SECONDARY`:**
   - Lists files that are secondary and can be deleted if not needed.
   - Example:
     ```makefile
     .SECONDARY: secondary_file
     ```

12.7. **`.DELETE_ON_ERROR`:**
   - If this target is specified, make will delete the target of a rule if the rule fails and the target is updated as a result of that failure.
   - Example:
     ```makefile
     .DELETE_ON_ERROR:
     ```

12.8. **`.IGNORE`:**
   - If this target is specified, make ignores errors in commands for all rules.
   - Example:
     ```makefile
     .IGNORE:
     ```

   These special built-in targets are prefixed with a dot (.) and are often used to customize the behavior of make, especially in complex build systems. Each target serves a specific purpose in controlling aspects of the build process.


Remember that indentation in Makefiles is crucial, and it's typically done using tabs, not spaces. Mixing tabs and spaces can lead to errors. Also, make sure that the lines within a rule are indented with tabs.