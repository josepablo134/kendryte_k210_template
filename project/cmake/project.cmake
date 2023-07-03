################################################################################
# @file CMakeLists.txt
# @author Josepablo C (josepablo134@gmail.com)
# @version 1.0
################################################################################

set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs )
set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs )
set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin )
set( CMAKE_RUNTIME_LOCATE_DIRECTORY ${CMAKE_BINARY_DIR}/linker )
set( CMAKE_EXECUTABLE_SUFFIX .elf)
set( OUTPUT_S19 ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${EXEC_NAME}.s19)
set( OUTPUT_HEX ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${EXEC_NAME}.hex)
set( OUTPUT_BIN ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${EXEC_NAME}.bin)
set( OUTPUT_MAP ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${EXEC_NAME}.map)

set( PRE_LINKER_SCRIPT ${WORK_DIR}/cmake/kendryte_k210_cfg.ld)
set( LINKER_SCRIPT ${CMAKE_RUNTIME_LOCATE_DIRECTORY}/kendryte_k210.ld)

add_definitions(-DCONFIG_LOG_LEVEL=LOG_VERBOSE -DCONFIG_LOG_ENABLE -DCONFIG_LOG_COLORS -DLOG_KERNEL -D__riscv64 -DLV_CONF_INCLUDE_SIMPLE)
