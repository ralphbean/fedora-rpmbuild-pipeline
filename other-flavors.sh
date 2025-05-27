# This file is just an example configuration for the 'diff-flavor.sh' script.
# Make your own copy named `.other-flavors.sh` (note the leading dot) in
# git-root directory, and configure other flavors.

# Prefix name is 'example' (shell array)
flavors+=( example )

# Where to download raw files from (shell string, starts with `example_`!)
example_raw_link=https://gitlab.example.com/foo/rpmbuild-pipeline/-/raw/main

# Files that are named differently in that flavor (shell array of strings -
# pairs - like "here_location there_location")
example_overrides=( "pipeline/build-rpm-package.yaml pipeline/build-custom-package.yaml" )
