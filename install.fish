#!/usr/bin/env fish

set -l script_dir (realpath (dirname (status --current-filename)))

set -q XDG_CONFIG_HOME || set -l XDG_CONFIG_HOME $HOME/.config

for dir_name in "HOME" "XDG_CONFIG_HOME"
    for f in (fd -H -t f --base-directory $dir_name .)
        mkdir -pv $$dir_name/(dirname $f)
        ln -snfv $script_dir/$dir_name/$f $$dir_name/$f
    end
end
