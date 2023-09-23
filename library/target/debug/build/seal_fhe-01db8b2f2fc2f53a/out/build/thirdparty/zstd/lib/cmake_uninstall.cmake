 
if(NOT EXISTS "/Users/matt/Documents/GitHub/blind-librarian-ethnyc/library/target/debug/build/seal_fhe-01db8b2f2fc2f53a/out/build/install_manifest.txt")
  message(FATAL_ERROR "Cannot find install manifest: /Users/matt/Documents/GitHub/blind-librarian-ethnyc/library/target/debug/build/seal_fhe-01db8b2f2fc2f53a/out/build/install_manifest.txt")
endif()

file(READ "/Users/matt/Documents/GitHub/blind-librarian-ethnyc/library/target/debug/build/seal_fhe-01db8b2f2fc2f53a/out/build/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")
foreach(file ${files})
  message(STATUS "Uninstalling $ENV{DESTDIR}${file}")
  if(IS_SYMLINK "$ENV{DESTDIR}${file}" OR EXISTS "$ENV{DESTDIR}${file}")
    exec_program(
      "/opt/homebrew/Cellar/cmake/3.27.6/bin/cmake" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
      OUTPUT_VARIABLE rm_out
      RETURN_VALUE rm_retval
      )
    if(NOT "${rm_retval}" STREQUAL 0)
      message(FATAL_ERROR "Problem when removing $ENV{DESTDIR}${file}")
    endif()
  else()
    message(STATUS "File $ENV{DESTDIR}${file} does not exist.")
  endif()
endforeach()
