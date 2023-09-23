# Install script for directory: /Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/thirdparty/zstd/build/cmake/lib

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/matt/Documents/GitHub/blind-librarian-ethnyc/library/target/debug/build/seal_fhe-7737973cd428fd40/out/build/thirdparty/zstd/lib/libzstd.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/thirdparty/zstd/build/cmake/../../lib/zstd.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/thirdparty/zstd/build/cmake/../../lib/deprecated/zbuff.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/thirdparty/zstd/build/cmake/../../lib/dictBuilder/zdict.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/thirdparty/zstd/build/cmake/../../lib/dictBuilder/cover.h"
    "/Users/matt/.cargo/registry/src/index.crates.io-6f17d22bba15001f/seal_fhe-0.8.1/SEAL/thirdparty/zstd/build/cmake/../../lib/common/zstd_errors.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/matt/Documents/GitHub/blind-librarian-ethnyc/library/target/debug/build/seal_fhe-7737973cd428fd40/out/build/lib/libzstd.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libzstd.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libzstd.a")
    execute_process(COMMAND "/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libzstd.a")
  endif()
endif()

