# Install script for directory: /Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/matt/Documents/GitHub/blind-librarian-ethnyc/library/target/debug/build/seal_fhe-01db8b2f2fc2f53a/out")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SEAL-4.0/seal/util" TYPE FILE FILES
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/blake2.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/blake2-impl.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/clang.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/clipnormal.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/common.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/croots.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/defines.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/dwthandler.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/fips202.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/galois.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/gcc.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/globals.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/hash.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/hestdparms.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/iterator.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/locks.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/mempool.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/msvc.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/numth.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/pointer.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/polyarithsmallmod.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/polycore.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/rlwe.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/rns.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/scalingvariant.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/ntt.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/streambuf.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/uintarith.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/uintarithmod.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/uintarithsmallmod.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/uintcore.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/util/ztools.h"
    )
endif()

