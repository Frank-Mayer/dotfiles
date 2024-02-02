complete -c yab -s v -l version -o version -d 'Prints the version of the program.' --no-files
complete -c yab -s h -l help -o help -d 'Prints the help message.' --no-files
complete -c yab -l def -o def -d 'Creates definitions file in global config.' --no-files
complete -c yab -l debug -o debug -d 'Enables debug mode.' --no-files
complete -c yab -l silent -o silent -d 'Enables silent mode.' --no-files
complete -c yab -l env -o env -d 'Prints the yab environment.' --no-files
complete -c yab -l ls -o ls -d 'Lists all available commands.' --no-files
set -l commands (yab --ls)
complete -c yab -a $commands --no-files

