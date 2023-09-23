# Install script for directory: /Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SEAL-4.0/seal/c" TYPE FILE FILES
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/batchencoder.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/ciphertext.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/ckksencoder.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/contextdata.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/decryptor.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/defines.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/encryptionparameterqualifiers.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/encryptionparameters.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/encryptor.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/evaluator.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/galoiskeys.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/keygenerator.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/kswitchkeys.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/memorymanager.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/memorypoolhandle.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/modulus.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/plaintext.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/polyarray.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/publickey.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/relinkeys.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/rns.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/sealcontext.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/secretkey.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/serialization.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/stdafx.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/targetver.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/utilities.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/valcheck.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/native/src/seal/c/version.h"
    )
endif()

