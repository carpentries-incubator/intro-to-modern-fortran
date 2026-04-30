#!/bin/bash

set -e

PFUNIT_REMOTE_URL="https://github.com/Goddard-Fortran-Ecosystem/pFUnit.git"
PFUNIT_INSTALLED_PATH="" # Path to pFUnit/installed directory

DEFAULT_PFUNIT_SRC_PATH="$(pwd)/pFUnit"
DEFAULT_PFUNIT_VERSION="v4.12.0"

clean=false
build=false
test=false
pfunit_src_path="$DEFAULT_PFUNIT_SRC_PATH"
pfunit_version="$DEFAULT_PFUNIT_VERSION"

help() {
  echo "Usage:"
  echo "    $0 [-h|--help] [-c|--clean] [-b|--build] [-p|--path <path/to/pfunit>] [-v|--version <version>]"
  echo ""
  echo "ARGS:"
  echo "    -h | --help                 Display this help message."
  echo "    -c | --clean                Clean all build artifacts."
  echo "    -b | --build                Build pFUnit."
  echo "    -t | --test                 Test a pFUnit installation."
  echo "    -p | --path                 Absolute path to the pFUnit src. Defaults to $DEFAULT_PFUNIT_SRC_PATH."
  echo "    -v | --version <version>    The version of pFUnit to install. Defaults to $DEFAULT_PFUNIT_VERSION."
  exit 0
}

# check for no input arguments and show help
if [ $# -eq 0 ];
then
    help
    exit 1
fi

# parse input arguments
while [ $# -gt 0 ] ; do
    case $1 in
        -h | --help)
            help
            exit 0
            ;;
        -c | --clean)
            clean=true
            shift 1
            continue
            ;;
        -b | --build)
            build=true
            shift 1
            continue
            ;;
        -t | --test)
            test=true
            shift 1
            continue
            ;;
        -p | --path)
            pfunit_src_path=$2
            PFUNIT_INSTALLED_PATH="$pfunit_src_path/build/installed"
            shift 2
            continue
            ;;
        -v | --version)
            pfunit_version=$2
            shift 2
            continue
            ;;
        *) 
            echo "Invalid option: $1" >&2; 
            help 
            exit 1
            ;;
    esac
    shift 1
done

# if nothing to do, tell user
if [[ "$build" == "false" && "$clean" == "false" && "$test" == "false" ]]
then
    echo "Nothing to do. Please specify at least one of --clean, --build or --test. Use --help for details"
    exit 0
fi

# Clean pFUnit build dir
if [ "$clean" == "true" ]
then
    if [ -d "$pfunit_src_path/build" ]
    then
        echo "Cleaning pFUnit build"
        rm -rf $pfunit_src_path/build
    else
        echo "No pFUnit build found at $pfunit_src_path/build. Nothing to clean."
    fi
fi

# Build pFUnit
if [ "$build" == "true" ]
then
    # Verify the provided pfunit dir
    if [ "$pfunit_src_path" == "" ]
    then
        echo "Building pFUnit requested but no root dir for pFUnit provided. Please provide a path using --path."
        exit 0
    else    
        if [ -d "$pfunit_src_path" ]
        then
            pushd $pfunit_src_path > /dev/null
            if [ $(git remote get-url origin) != "$PFUNIT_REMOTE_URL" ]
            then
                echo "pFUnit source path $pfunit_src_path is not a valid pFUnit clone. Please remove the existing clone or choose a different path."
                exit 1
            fi
            current_pfunit_version=$(git describe --exact-match --tags)

            if [ "$current_pfunit_version" != "$pfunit_version" ]
            then
                echo "pFUnit version $current_pfunit_version found but $pfunit_version was requested. Please switch versions or remove the existing clone."
                exit 1
            fi
            popd > /dev/null
        else
            mkdir $pfunit_src_path
            pushd $pfunit_src_path > /dev/null
            echo "Cloning pFUnit from $PFUNIT_REMOTE_PATH"
            git clone --branch $pfunit_version $PFUNIT_REMOTE_URL $pfunit_src_path
            popd > /dev/null
        fi
    fi

    echo "Building pFUnit from source"
    cmake $pfunit_src_path -B $pfunit_src_path/build -DINSTALL_PATH=$PFUNIT_INSTALLED_PATH -DMPI=YES -DCMAKE_Fortran_COMPILER=mpif90 -DOPENMP=YES
    cmake --build $pfunit_src_path/build "-j$num_build_threads" --target install

    echo ""
    echo "Successfully built pFUnit. To use installation, add the following to cmake flags"
    echo "  -DCMAKE_PREFIX_PATH=$PFUNIT_INSTALLED_PATH"
fi

if [ "$test" == "true" ]
then
    if [ "$pfunit_src_path" == "" ]
    then
        echo "Testing pFUnit requested but no root dir for pFUnit provided. Please provide a path using --path."
        exit 0
    else
        # exclude tests starting with test_derived as these are for a dependency of pFUnit
        ctest --test-dir "$pfunit_src_path/build" --output-on-failure -E "(test_derived).*"
    fi
fi
