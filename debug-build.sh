#!/bin/bash

cd ./debug-build/
cmake -G "Ninja"\
    -DCMAKE_BUILD_TYPE=Debug\
    -DLLVM_TARGETS_TO_BUILD="X86"\
    -DLLVM_ENABLE_CXX1Y=ON\
    -DBUILD_SHARED_LIBS=ON\
    -DCMAKE_CXX_FLAGS="-std=c++14"\
    /home/s1736883/Work/llvm/llvm-60
cmake --build .
cd ..
