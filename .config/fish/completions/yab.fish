# fish shell completion for yab

# special completion
complete -c yab -s y -l version -o version -d 'Prints the version of the program.' --no-files
complete -c yab -s h -l help -o help -d 'Prints the help message.' --no-files
complete -c yab -l def -o def -d 'Creates definitions file in global config.' --no-files

function __get_yab_dir
    # is there a .yab directory in the current directory?
    if test -d .yab
        echo .yab
        return
    end

    # is there a $XDG_CONFIG_HOME/yab directory?
    if test -d $XDG_CONFIG_HOME/yab
        echo $XDG_CONFIG_HOME/yab
        return
    end

    # is there a $APPDATA/yab directory?
    if test -d $APPDATA/yab
        echo $APPDATA/yab
        return
    end

    # is there a $HOME/.config/yab directory?
    if test -d $HOME/.config/yab
        echo $HOME/.config/yab
        return
    end
end

function __get_configs
    for arg in $argv
        # If the argument is "--", break to handle the arguments after the double dash
        if test "$arg" = "--"
            return
        end
    end

    # get the directory where the configs are stored
    set yab_dir (__get_yab_dir)

    # get the configs
    set configs (ls $yab_dir/*.lua)

    # remove the directory and file extension from the configs
    for config in $configs
        echo $config | sed -e "s|$yab_dir/||" -e 's|\.lua$||'
    end
end

complete -c yab -a '(__get_configs)' --no-files
