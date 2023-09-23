# Install script for directory: /Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/matt/Documents/GitHub/blind-librarian-ethnyc/library/target/debug/build/seal_fhe-7737973cd428fd40/out")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SEAL-4.0/seal" TYPE FILE FILES
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/batchencoder.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/ciphertext.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/ckks.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/modulus.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/context.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/decryptor.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/dynarray.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/encryptionparams.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/encryptor.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/evaluator.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/galoiskeys.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/keygenerator.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/kswitchkeys.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/memorymanager.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/plaintext.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/polyarray.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/publickey.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/randomgen.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/randomtostd.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/relinkeys.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/seal.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/secretkey.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/serializable.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/serialization.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/valcheck.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/version.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/matt/Documents/GitHub/blind-librarian-ethnyc/library/target/debug/build/seal_fhe-7737973cd428fd40/out/build/native/src/seal/util/cmake_install.cmake")

endif()

