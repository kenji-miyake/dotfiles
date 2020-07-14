#!/usr/bin/env fish

set -l script_dir (realpath (dirname (status --current-filename)))

set -q XDG_CONFIG_HOME || set -l XDG_CONFIG_HOME $HOME/.config

for dir_name in "HOME" "XDG_CONFIG_HOME"
    set -l dotfiles (builtin cd $dir_name && fd -H -t f . && builtin cd $script_dir)
    for f in $dotfiles
        mkdir -pv (dirname $f)
        ln -snfv $script_dir/$dir_name/$f $$dir_name/$f
    end
end
