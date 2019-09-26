#!/bin/bash

cd ./build/
cmake -G "Ninja"\
    -DCMAKE_BUILD_TYPE=RelWithDebInfo\
    -DLLVM_TARGETS_TO_BUILD="X86"\
    -DLLVM_ENABLE_CXX1Y=ON\
    -DBUILD_SHARED_LIBS=ON\
    -DLLVM_ENABLE_ASSERTIONS=ON\
    -DCMAKE_CXX_FLAGS="-std=c++14"\
    /home/s1736883/Work/llvm/llvm-70
cmake --build .
cd ..
