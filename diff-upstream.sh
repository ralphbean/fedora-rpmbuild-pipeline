#! /bin/bash -x

TMPDIR=$(mktemp -d /tmp/compare-rpmbuild-pipeline-XXXXXX)

files_to_diff="
pipeline/build-rpm-package.yaml
task/calculate-deps.yaml
task/check-noarch.yaml
task/get-rpm-sources.yaml
task/import-to-quay.yaml
task/rpmbuild.yaml
"

overrides=( )
raw_link=https://raw.githubusercontent.com/konflux-ci/rpmbuild-pipeline/refs/heads/main

for file in $files_to_diff; do
    url=$raw_link/$file
    for override in "${overrides[@]}"; do
        set -- $override
        if test "$1" == "$file"; then
            url=$raw_link/$2
            break
        fi
    done
    dest=$TMPDIR/$file
    (
        cd "$TMPDIR"
        mkdir -p "$(dirname "$file")"
    )
    curl "$url" > "$dest" 2>/dev/null
    vim -d "$file" "$dest"
done

