################################################################################
# @file CMakeLists.txt
# @author Josepablo C (josepablo134@gmail.com)
# @version 1.0
################################################################################

message( FATAL_ERROR "This environment is not ready yet. Sorry :(" )

set(EXT "")

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR RISCV)

set(TOOLCHAIN "riscv64-unknown-elf")
set(TOOLCHAIN_PREFIX "/usr")
set(TOOLCHAIN_UTILS_PREFIX "/usr/lib/picolibc")

set(TOOLCHAIN_BIN_DIR ${TOOLCHAIN_PREFIX}/bin)
set(TOOLCHAIN_INC_DIR ${TOOLCHAIN_UTILS_PREFIX}/${TOOLCHAIN}/include)
set(TOOLCHAIN_LIB_DIR ${TOOLCHAIN_UTILS_PREFIX}/${TOOLCHAIN}/lib)

#---------------------------------------------------------------------------------------
# Set compilers
#---------------------------------------------------------------------------------------
set(CMAKE_C_COMPILER ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-gcc${EXT} CACHE INTERNAL "Compiler From RISCV GCC Package")
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-g++${EXT} CACHE INTERNAL "Compiler From RISCV GCC Package")
set(CMAKE_LINKER ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-ld${EXT} CACHE INTERNAL "Linker From RISCV GCC Package")
set(CMAKE_AR ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-ar${EXT} CACHE INTERNAL "Archiver From RISCV GCC Package")
set(CMAKE_OBJCOPY ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-objcopy${EXT} CACHE INTERNAL "Bin util From RISCV GCC Package")
set(CMAKE_SIZE ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-size${EXT} CACHE INTERNAL "Bin util From RISCV GCC Package")
set(CMAKE_OBJDUMP ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-objdump${EXT} CACHE INTERNAL "Bin utilFrom RISCV GCC Package")

set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_UTILS_PREFIX}/${TOOLCHAIN} ${CMAKE_PREFIX_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE BOTH)
