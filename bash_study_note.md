1) set terminal tab title


$ PROMPT_COMMAND='echo -ne "\033]0;YOUR TITLE GOES HERE\007"'
$ PROMPT_COMMAND='echo -ne "\033]0;jupyter notebook \007"'

https://unix.stackexchange.com/questions/177572/how-to-rename-terminal-tab-title-in-gnome-terminal#:~:text=The%20Bash%20escape%20sequence%20to,%5B%5Ce%5D2%3Bnew