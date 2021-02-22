#!/usr/bin/env fish

set -l script_dir (realpath (dirname (status --current-filename)))

for plugin in (cat vim_plugins)
    set repository_name (string replace -a -r -- ".*\/(\w+)" "\$1" "$plugin")

    if test -d $repository_name
        echo -e "$repository_name already exists, skipping"
        continue
    end

    git clone "https://github.com/$plugin.git"
end
