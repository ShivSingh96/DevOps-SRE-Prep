### Shell Scripting - Self Assessment

**What does this line in shell scripts mean?: `#!/bin/bash`**
- **Shebang Line**: `#!/bin/bash`
  - **Purpose**: The shebang (`#!`) line at the beginning of a shell script specifies the interpreter that should be used to execute the script. In this case, it tells the system to use the Bash shell (`/bin/bash`) to run the script.

**True or False? When a certain command/line fails in a shell script, the shell script, by default, will exit and stop running**
- **False**: By default, when a command in a shell script fails, the script does not exit and stop running. It continues to execute the next commands. To make the script exit on failure, you can use `set -e` at the beginning of the script.

**What do you tend to include in every script you write?**
1. **Shebang Line**:
   - Specifies the interpreter to use.
   - Example: `#!/bin/bash`
2. **Comments**:
   - Descriptions and explanations of the script's purpose and individual sections.
   - Example: `# This script backs up the home directory`
3. **Error Handling**:
   - Ensures the script exits on errors and provides meaningful messages.
   - Example: `set -e` to exit on errors, and `trap` to handle cleanup.
4. **Usage Instructions**:
   - Provides information on how to use the script.
   - Example: `echo "Usage: $0 [options]"`
5. **Variables**:
   - Clearly defined and documented variables.
   - Example: `BACKUP_DIR="/backup"`
6. **Logging**:
   - Logs important steps and outputs to a file or standard output.
   - Example: `echo "Backup started at $(date)" >> /var/log/backup.log`

**Today we have tools and technologies like Ansible, Puppet, Chef... Why would someone still use shell scripting?**
- **Flexibility**:
  - Shell scripts can be used for a wide range of tasks, from simple automation to complex workflows.
- **Simplicity**:
  - For small tasks or specific automation, shell scripts can be more straightforward and quicker to write than using more complex tools.
- **Portability**:
  - Shell scripts can run on any Unix-like system without requiring additional software.
- **Integration**:
  - Shell scripts can easily integrate and invoke other command-line tools and utilities.
- **Immediate Availability**:
  - Shell scripts don't require installing additional frameworks or learning new languages for simple tasks.
- **Customization**:
  - They provide a high level of control and customization for system-specific or one-off tasks.
- **Learning Curve**:
  - While configuration management tools are powerful, they often have a steeper learning curve compared to writing basic shell scripts.

In summary, shell scripting remains valuable for tasks that benefit from its simplicity, flexibility, and immediate execution, despite the availability of more advanced configuration management and automation tools.

### Shell Scripting - Variables

**How to define a variable with the value "Hello World"?**

```bash
greeting="Hello World"
```

**How to define a variable with the value of the current date?**

```bash
current_date=$(date)
```

**How to print the first argument passed to a script?**

```bash
echo $1
```

**Write a script to print "yay" unless an argument was passed and then print that argument**

```bash
#!/bin/bash

if [ -z "$1" ]; then
    echo "yay"
else
    echo "$1"
fi
```

**What would be the output of the following script?**

```bash
#!/usr/bin/env bash
NINJA_TURTLE=Donatello

function the_best_ninja_turtle {
    local NINJA_TURTLE=Michelangelo
    echo $NINJA_TURTLE
}

NINJA_TURTLE=Raphael
the_best_ninja_turtle
```

- **Explanation**:
  - The script first sets `NINJA_TURTLE` to "Donatello".
  - Then, it defines a function `the_best_ninja_turtle` where a local `NINJA_TURTLE` is set to "Michelangelo".
  - Outside the function, `NINJA_TURTLE` is set to "Raphael".
  - When `the_best_ninja_turtle` is called, it echoes the local `NINJA_TURTLE` which is "Michelangelo".

- **Output**:
  ```
  Michelangelo
  ```

**Explain what would be the result of each command:**

- **`echo $0`**
  - **Explanation**: Prints the name of the shell or the shell script being executed.
  - **Example Output**: If the script is called `myscript.sh`, it will print `./myscript.sh`.

- **`echo $?`**
  - **Explanation**: Prints the exit status of the last executed command. `0` means success, any other value indicates an error.
  - **Example Output**: `0` if the last command was successful.

- **`echo $$`**
  - **Explanation**: Prints the process ID (PID) of the current shell.
  - **Example Output**: A number representing the PID, like `12345`.

- **`echo $#`**
  - **Explanation**: Prints the number of arguments passed to the script.
  - **Example Output**: If 3 arguments were passed, it will print `3`.

### Additional Notes

- **Local Variables**: The use of `local` inside the function ensures that `NINJA_TURTLE` within `the_best_ninja_turtle` does not affect the `NINJA_TURTLE` variable outside the function scope.
- **Positional Parameters**: `$0`, `$1`, `$2`, etc., refer to the script name and arguments passed to the script. `$#` gives the count of arguments.
- **Special Parameters**:
  - `$?` provides the exit status of the last command.
  - `$$` gives the process ID of the current script or shell.
  - `"$@"` and `"$*"` can be used to refer to all arguments.

### Shell Scripting - Advanced Variables and Input

**What is `$@`?**

- **Explanation**: `$@` refers to all the arguments passed to the script or a function, treated as individual quoted strings.

**What is the difference between `$@` and `$*`?**

- **Explanation**:
  - `$@` treats each quoted argument separately.
  - `$*` treats all arguments as a single string.
  - **Example**:
    ```bash
    #!/bin/bash
    for arg in "$@"; do
        echo "$arg"
    done
    ```
    This will treat each argument separately.
    ```bash
    #!/bin/bash
    for arg in "$*"; do
        echo "$arg"
    done
    ```
    This will treat all arguments as a single string.

**How do you get input from the user in shell scripts?**

- **Explanation**: Use the `read` command.
- **Example**:
  ```bash
  echo "Enter your name:"
  read name
  echo "Hello, $name!"
  ```

**How to compare variables length?**

- **Explanation**: Use `${#var}` to get the length of a variable.
- **Example**:
  ```bash
  var="Hello"
  if [ ${#var} -gt 3 ]; then
      echo "The variable length is greater than 3"
  fi
  ```

### Shell Scripting - Conditionals

**Explain conditionals and demonstrate how to use them**

- **Explanation**: Conditionals allow you to execute code based on whether a condition is true or false.
- **Syntax**:
  ```bash
  if [ condition ]; then
      # code if condition is true
  elif [ another_condition ]; then
      # code if another_condition is true
  else
      # code if no conditions are true
  fi
  ```

- **Example**:
  ```bash
  if [ -f "/path/to/file" ]; then
      echo "File exists"
  else
      echo "File does not exist"
  fi
  ```

**In shell scripting, how to negate a conditional?**

- **Explanation**: Use `!` to negate a condition.
- **Example**:
  ```bash
  if [ ! -f "/path/to/file" ]; then
      echo "File does not exist"
  fi
  ```

**In shell scripting, how to check if a given argument is a number?**

- **Explanation**: Use a regex match or a conditional test.
- **Example**:
  ```bash
  if [[ $1 =~ ^[0-9]+$ ]]; then
      echo "The argument is a number"
  else
      echo "The argument is not a number"
  fi
  ```

### Summary

- **`$@` vs `$*`**: `$@` treats each argument as a separate quoted string, `$*` treats all arguments as a single string.
- **User Input**: Use `read` to get input from the user.
- **Variable Length**: Use `${#var}` to get the length of a variable.
- **Conditionals**: Use `if`, `elif`, and `else` to create conditionals.
- **Negate Conditionals**: Use `!` to negate a condition.
- **Check if Argument is a Number**: Use regex or conditional tests to check if an argument is a number.

### Shell Scripting - Arithmetic Operations

**How to perform arithmetic operations on numbers?**

- **Explanation**: Use `(( ... ))`, `$(( ... ))`, or `let` for arithmetic operations in shell scripts.
- **Examples**:

  Using `(( ... ))`:
  ```bash
  a=5
  b=3
  (( sum = a + b ))
  echo "Sum: $sum"
  ```

  Using `$(( ... ))`:
  ```bash
  a=5
  b=3
  sum=$(( a + b ))
  echo "Sum: $sum"
  ```

  Using `let`:
  ```bash
  a=5
  b=3
  let sum=a+b
  echo "Sum: $sum"
  ```

**How to check if a given number has 4 as a factor?**

- **Explanation**: Use the modulus operator `%` to check if the remainder is zero when divided by 4.
- **Example**:
  ```bash
  num=16
  if (( num % 4 == 0 )); then
      echo "$num is divisible by 4"
  else
      echo "$num is not divisible by 4"
  fi
  ```

### Shell Scripting - Loops

**What is a loop? What types of loops are you familiar with?**

- **Explanation**: A loop allows you to repeat a block of code multiple times.
- **Types of Loops**:
  - `for` loop
  - `while` loop
  - `until` loop

**Demonstrate how to use loops**

- **`for` Loop**:
  - **Example**: Loop through a range of numbers.
    ```bash
    for i in {1..5}; do
        echo "Number: $i"
    done
    ```

  - **Example**: Loop through a list of items.
    ```bash
    for item in apple banana cherry; do
        echo "Fruit: $item"
    done
    ```

- **`while` Loop**:
  - **Example**: Loop while a condition is true.
    ```bash
    counter=1
    while [ $counter -le 5 ]; do
        echo "Counter: $counter"
        ((counter++))
    done
    ```

- **`until` Loop**:
  - **Example**: Loop until a condition is true.
    ```bash
    counter=1
    until [ $counter -gt 5 ]; do
        echo "Counter: $counter"
        ((counter++))
    done
    ```

**Summary**:

- **Arithmetic Operations**: Use `(( ... ))`, `$(( ... ))`, or `let`.
- **Check for Factor**: Use modulus operator `%`.
- **Loops**: Use `for`, `while`, and `until` loops for repeating code.

### Shell Scripting - Troubleshooting

**How do you debug shell scripts?**

- **Enable Debugging Modes**:
  - `set -x`: Enable debug mode to print each command and its arguments as they are executed.
  - `set -v`: Print shell input lines as they are read.
  - `set -e`: Exit immediately if a command exits with a non-zero status.
  - `set -u`: Treat unset variables as an error and exit immediately.

- **Example**:
  ```bash
  #!/bin/bash
  set -x  # Enable debug mode

  x=5
  y=10
  sum=$(( x + y ))
  echo "Sum: $sum"

  set +x  # Disable debug mode
  ```

- **Using `echo` Statements**: Insert `echo` statements to print variable values and checkpoints in the script.
- **Using `trap` Command**: Use `trap` to catch errors and debug information.
  ```bash
  trap 'echo "Error at line $LINENO"' ERR
  ```

**Running the following bash script, we don't get 2 as a result, why?**

- **Script**:
  ```bash
  x = 2
  echo $x
  ```

- **Explanation**: The script doesn't give the expected result because there should be no spaces around the `=` sign in variable assignment.
  - **Corrected Script**:
    ```bash
    x=2
    echo $x
    ```

### Shell Scripting - Substring

**How to extract everything after the last dot in a string?**

- **Example**:
  ```bash
  filename="my.document.file.txt"
  extension="${filename##*.}"
  echo $extension  # Output: txt
  ```

**How to extract everything before the last dot in a string?**

- **Example**:
  ```bash
  filename="my.document.file.txt"
  basename="${filename%.*}"
  echo $basename  # Output: my.document.file
  ```

**Summary**:

- **Debugging Shell Scripts**: Use `set -x`, `set -v`, `set -e`, `set -u`, `echo` statements, and `trap` for debugging.
- **Correcting Variable Assignment**: Remove spaces around `=` in `x = 2` to `x=2`.
- **Substring Extraction**:
  - Extract after the last dot: `extension="${filename##*.}"`
  - Extract before the last dot: `basename="${filename%.*}"`

### Shell Scripting - Misc

**Generate 8 digit random number**

To generate an 8-digit random number in Bash, you can use the `shuf` command to shuffle a range of numbers:

```bash
random_number=$(shuf -i 10000000-99999999 -n 1)
echo "Random number: $random_number"
```

**Bash Best Practices Example**

Here are some Bash best practices demonstrated in a script:

```bash
#!/bin/bash
set -euo pipefail

# Use meaningful variable names and constants
readonly MAX_ATTEMPTS=3

# Functions should have clear names and use local variables
function generate_random_number() {
    local random_number=$(shuf -i 10000000-99999999 -n 1)
    echo "Random number: $random_number"
}

# Always use quotes around variables to avoid word splitting and pathname expansion
file_name="example.txt"
echo "File name: $file_name"

# Use indentation for readability
if [[ -f $file_name ]]; then
    echo "File exists."
else
    echo "File does not exist."
fi

# Use comments to explain complex logic or intent
# Check if the script is executed as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" >&2
    exit 1
fi

# Clean up temporary files and resources at the end of the script
trap 'rm -f /tmp/temp_file' EXIT

# Prefer using $(...) for command substitution over backticks
current_date=$(date +%Y-%m-%d)
echo "Current date: $current_date"

# Use functions for code reuse and modularity
function cleanup() {
    echo "Performing cleanup..."
    # Clean up logic here
}

# Always handle errors and edge cases gracefully
# Example: check if a directory exists before creating it
directory="/tmp/example"
if [[ ! -d $directory ]]; then
    mkdir -p "$directory"
    echo "Created directory: $directory"
fi
```

**Ternary Operator in Bash**

Bash doesn't have a ternary operator in the traditional sense. Instead, you can use an `if-else` statement or short-circuit evaluation with `&&` and `||`:

Example using `if-else`:

```bash
# Ternary equivalent: condition ? value_if_true : value_if_false
condition=true

if $condition; then
    result="value_if_true"
else
    result="value_if_false"
fi

echo $result
```

Example using short-circuit evaluation:

```bash
# Ternary equivalent: condition && value_if_true || value_if_false
condition=true
result=$($condition && echo "value_if_true" || echo "value_if_false")

echo $result
```

**Explanation of `diff <(ls /tmp) <(ls /var/tmp)**

The `diff <(ls /tmp) <(ls /var/tmp)` command compares the output of `ls /tmp` (list files in `/tmp` directory) with the output of `ls /var/tmp` (list files in `/var/tmp` directory). It shows the differences between these two directory listings, highlighting files that exist in one directory but not in the other.

**Testing Shell Scripts**

For testing shell scripts, you can use various tools and techniques:

1. **ShellCheck**: A static analysis tool for shell scripts to catch common issues and pitfalls.
2. **Bats (Bash Automated Testing System)**: A testing framework for Bash scripts.
3. **Manual Testing**: Execute the script with different inputs and scenarios to verify behavior.
4. **Unit Testing**: Write smaller scripts or functions that test specific parts of your script.
5. **Integration Testing**: Test your script in a controlled environment to ensure it works with other components.

These tools help ensure your scripts are robust, error-free, and behave as expected across different scenarios and environments.

