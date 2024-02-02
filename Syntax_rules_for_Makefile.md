

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

3. **Automatic Variables:**
   - **$@:** Represents the target.
   - **$<:** Represents the first dependency.
   - **$^:** Represents all dependencies.

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
   ```makefile
   %.o: %.c
       commands
   ```

   - Defines a rule that can be applied to a set of files.
   - For example, this rule says how to build a `.o` file from a corresponding `.c` file.

6. **Wildcard Characters:**
   - `*` represents any string of characters.
   - `?` represents any single character.

7. **Phony Targets:**
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

Remember that indentation in Makefiles is crucial, and it's typically done using tabs, not spaces. Mixing tabs and spaces can lead to errors. Also, make sure that the lines within a rule are indented with tabs.