#!/bin/bash

# Originally taken from a repository at https://github.com/m0nhawk/conda-package-publish-action
set -ex
set -o pipefail

check_if_build_command_exists() {
    FILE=build_command.txt
    if [ -f "$FILE" ]; then
        BUILD_COMMAND=`cat $FILE`
    else 
        echo "BUILD COMMAND file doesn't exist"
        exit 1
    fi
}


go_to_build_dir() {
    if [ ! -z $INPUT_SUBDIR ]; then
        cd $INPUT_SUBDIR
    fi
}

check_if_meta_yaml_file_exists() {
    if [ ! -f meta.yaml ]; then
        echo "meta.yaml must exist in the directory that is being packaged and published."
        exit 1
    fi
}

build_package(){
    $BUILD_COMMAND
    # conda convert -p osx-64 linux-64/*.tar.bz2
}

upload_package(){
    export ANACONDA_API_TOKEN=$INPUT_ANACONDATOKEN
    anaconda upload --force --label main noarch/*.tar.bz2
    # anaconda upload --label main osx-64/*.tar.bz2
}


check_if_build_command_exists
go_to_build_dir
check_if_meta_yaml_file_exists
build_package
upload_package
