################################################################################
# @file CMakeLists.txt
# @author Josepablo C (josepablo134@gmail.com)
# @version 1.0
################################################################################

set(EXT ".exe")

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR RISCV)

set(TOOLCHAIN "D:/opt/kendryte-toolchain/bin")

#---------------------------------------------------------------------------------------
# Set compilers
#---------------------------------------------------------------------------------------
set(CMAKE_C_COMPILER "${TOOLCHAIN}/riscv64-unknown-elf-gcc${EXT}")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN}/riscv64-unknown-elf-g++${EXT}")
set(CMAKE_LINKER "${TOOLCHAIN}/riscv64-unknown-elf-ld${EXT}")
set(CMAKE_AR "${TOOLCHAIN}/riscv64-unknown-elf-ar${EXT}")
set(CMAKE_OBJCOPY "${TOOLCHAIN}/riscv64-unknown-elf-objcopy${EXT}")
set(CMAKE_SIZE "${TOOLCHAIN}/riscv64-unknown-elf-size${EXT}")
set(CMAKE_OBJDUMP "${TOOLCHAIN}/riscv64-unknown-elf-objdump${EXT}")
