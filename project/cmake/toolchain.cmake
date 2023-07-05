if (WIN32)
    include(${CMAKE_CURRENT_LIST_DIR}/win-toolchain.cmake)
else ()
    include(${CMAKE_CURRENT_LIST_DIR}/linux-toolchain.cmake)
endif ()

# Perform compiler test with static library
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

execute_process(COMMAND ${CMAKE_C_COMPILER} -print-file-name=crt0.o OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE CRT0_OBJ)
execute_process(COMMAND ${CMAKE_C_COMPILER} -print-file-name=crtbegin.o OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE CRTBEGIN_OBJ)
execute_process(COMMAND ${CMAKE_C_COMPILER} -print-file-name=crtend.o OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE CRTEND_OBJ)
execute_process(COMMAND ${CMAKE_C_COMPILER} -print-file-name=crti.o OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE CRTI_OBJ)
execute_process(COMMAND ${CMAKE_C_COMPILER} -print-file-name=crtn.o OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE CRTN_OBJ)

set(CMAKE_C_LINK_EXECUTABLE
        "<CMAKE_C_COMPILER>  <FLAGS> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> \"${CRTI_OBJ}\" \"${CRTBEGIN_OBJ}\" <OBJECTS> \"${CRTEND_OBJ}\" \"${CRTN_OBJ}\" -o <TARGET> <LINK_LIBRARIES>")

set(CMAKE_CXX_LINK_EXECUTABLE
        "<CMAKE_CXX_COMPILER>  <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> \"${CRTI_OBJ}\" \"${CRTBEGIN_OBJ}\" <OBJECTS> \"${CRTEND_OBJ}\" \"${CRTN_OBJ}\" -o <TARGET> <LINK_LIBRARIES>")

#---------------------------------------------------------------------------------------
# Set compiler/linker flags
#---------------------------------------------------------------------------------------

# Object build options
# -O0                   No optimizations, reduce compilation time and make debugging produce the expected results.
# -mthumb               Generat thumb instructions.
# -fno-builtin          Do not use built-in functions provided by GCC.
# -Wall                 Print only standard warnings, for all use Wextra
# -ffunction-sections   Place each function item into its own section in the output file.
# -fdata-sections       Place each data item into its own section in the output file.
# -fomit-frame-pointer  Omit the frame pointer in functions that don’t need one.
# -mabi=aapcs           Defines enums to be a variable sized type.
set(OBJECT_GEN_FLAGS "-mcmodel=medany -mabi=lp64f -march=rv64imafc -fno-common -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -fno-zero-initialized-in-bss -ffast-math -fno-math-errno -fsingle-precision-constant -Os -ggdb")

set(CMAKE_C_FLAGS   "${OBJECT_GEN_FLAGS} -std=gnu99 " CACHE INTERNAL "C Compiler options")
set(CMAKE_CXX_FLAGS "${OBJECT_GEN_FLAGS} -std=c++11 " CACHE INTERNAL "C++ Compiler options")
set(CMAKE_ASM_FLAGS "${OBJECT_GEN_FLAGS} -x assembler-with-cpp " CACHE INTERNAL "ASM Compiler options")

# -Wl,--gc-sections     Perform the dead code elimination.
# --specs=nano.specs    Link with newlib-nano.
# --specs=nosys.specs   No syscalls, provide empty implementations for the POSIX system calls.
set(CMAKE_EXE_LINKER_FLAGS "-nostartfiles -static -Wl,--gc-sections -Wl,-static -Wl,--start-group -Wl,--whole-archive -Wl,--no-whole-archive -Wl,--end-group -Wl,-EL -Wl,--no-relax" CACHE INTERNAL "Linker options")

#---------------------------------------------------------------------------------------
# Set debug/release build configuration Options
#---------------------------------------------------------------------------------------

# Options for DEBUG build
# -Og   Enables optimizations that do not interfere with debugging.
# -g    Produce debugging information in the operating system’s native format.
set(CMAKE_C_FLAGS_DEBUG "-Og -g" CACHE INTERNAL "C Compiler options for debug build type")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -g" CACHE INTERNAL "C++ Compiler options for debug build type")
set(CMAKE_ASM_FLAGS_DEBUG "-g" CACHE INTERNAL "ASM Compiler options for debug build type")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "" CACHE INTERNAL "Linker options for debug build type")

# Options for RELEASE build
# -Os   Optimize for size. -Os enables all -O2 optimizations.
# -flto Runs the standard link-time optimizer.
set(CMAKE_C_FLAGS_RELEASE "-Os -flto" CACHE INTERNAL "C Compiler options for release build type")
set(CMAKE_CXX_FLAGS_RELEASE "-Os -flto" CACHE INTERNAL "C++ Compiler options for release build type")
set(CMAKE_ASM_FLAGS_RELEASE "" CACHE INTERNAL "ASM Compiler options for release build type")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "-flto" CACHE INTERNAL "Linker options for release build type")
