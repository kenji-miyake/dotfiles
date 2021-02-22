#!/usr/bin/env fish

set -l script_dir (realpath (dirname (status --current-filename)))

cd $script_dir

for plugin in (cat vim_plugins)
    set repo_name (string replace -a -r -- ".*\/(\w+)" "\$1" "$plugin")

    cd $repo_name && git pull && cd $script_dir
end
