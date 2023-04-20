import os
import sys

def replace_directory_in_file(filename, old_directory, new_directory):
    print("Working on:", filename)
    with open(filename, 'r') as f:
        text = f.read()

    if old_directory in text:
        text = text.replace(old_directory, new_directory)

    with open(filename, 'w') as f:
        f.write(text)

def main():
    # Get the old and new directories from the command line arguments
    if len(sys.argv) > 1:
        old_directory = sys.argv[1]
    else:
        old_directory = "rts"
    
    if len(sys.argv) > 2:
        new_directory = sys.argv[2]
    else:
        new_directory = os.getcwd()

    # Get a list of all JSON files in the current directory
    files = [f for f in os.listdir() if f.endswith('.json')]

    # Iterate over each file and replace the directory
    for filename in files:
        replace_directory_in_file(filename, old_directory, new_directory)

if __name__ == "__main__":
    main()

'''
In this modified code, we use sys.argv to get the command-line arguments passed to the script. 
If the length of sys.argv is greater than 1, we use sys.argv[1] as the value for old_directory. 
If the length of sys.argv is greater than 2, we use sys.argv[2] as the value for new_directory. 
Otherwise, we set old_directory to "rts" and new_directory to the current working directory.
'''