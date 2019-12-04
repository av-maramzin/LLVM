#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath $0)")"
LLVM_PROJECT_DIR="$SCRIPT_DIR/llvm-project/llvm"
BUILD_DIR="$SCRIPT_DIR/build"
DEBUG_BUILD_DIR="$SCRIPT_DIR/debug-build"

if [ ! -d "$LLVM_PROJECT_DIR" ]; then
    echo "Error: LLVM git repository has not been found!"
    exit 1
fi

echo "LLVM folder: $SCRIPT_DIR"
echo "LLVM repository: $LLVM_PROJECT_DIR"
echo "LLVM debug build directory: $DEBUG_BUILD_DIR"
echo ""

if [ -d "$DEBUG_BUILD_DIR" ]; then
    echo "Removing existent build directory"
    rm -rf $DEBUG_BUILD_DIR
fi

mkdir $DEBUG_BUILD_DIR

cd $DEBUG_BUILD_DIR
cmake -G "Ninja"\
    -DCMAKE_BUILD_TYPE=Debug\
    -DLLVM_ENABLE_PROJECTS="clang"\
    -DLLVM_TARGETS_TO_BUILD="X86"\
    -DLLVM_ENABLE_CXX1Y=ON\
    -DBUILD_SHARED_LIBS=ON\
    -DLLVM_ENABLE_ASSERTIONS=ON\
    -DCMAKE_CXX_FLAGS="-std=c++14"\
    $LLVM_PROJECT_DIR
cmake --build .
cd $SCRIPT_DIR
