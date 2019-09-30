#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath $0)")"
LLVM_PROJECT_DIR="$SCRIPT_DIR/llvm-project"
BUILD_DIR="$SCRIPT_DIR/build"
DEBUG_BUILD_DIR="$SCRIPT_DIR/debug-build"

if [ ! -d "$LLVM_PROJECT_DIR" ]; then
    echo "Error: LLVM git repository has not been found!"
    exit 1
fi

echo "LLVM folder: $SCRIPT_DIR"
echo "LLVM repository: $LLVM_PROJECT_DIR"
echo "LLVM build directory: $BUILD_DIR"
echo "LLVM build directory: $DEBUG_BUILD_DIR"
echo ""

if [ -d "$BUILD_DIR" ]; then
    echo "Removing existent build directory"
    echo "Removed: $BUILD_DIR"
    rm -rf $BUILD_DIR
fi

if [ -d "$DEBUG_BUILD_DIR" ]; then
    echo "Removing existent build directory"
    echo "Removed: $DEBUG_BUILD_DIR"
    rm -rf $DEBUG_BUILD_DIR
fi

echo "LLVM repository: checking out the master branch"
cd $LLVM_PROJECT_DIR
git checkout master

cd $SCRIPT_DIR
