################################################################################
# @file CMakeLists.txt
# @author Josepablo C (josepablo134@gmail.com)
################################################################################
cmake_minimum_required( VERSION 3.18.4 )

project( kendrytebsp
		DESCRIPTION "Kendryte K210 BSP and drivers"
		VERSION 1.0.0
		LANGUAGES C ASM
)

set(COMPONENT_NAME BSP)
set(SUBCOMPONENT_NAME K210)

set(CURRENT_COMPONENT_NAME kendryte)

add_library(${CURRENT_COMPONENT_NAME} STATIC
		# ASM
		${CMAKE_CURRENT_LIST_DIR}/system_src/crt.S
		# System sources
		${CMAKE_CURRENT_LIST_DIR}/system_src/entry_user.c
		${CMAKE_CURRENT_LIST_DIR}/system_src/entry.c
		${CMAKE_CURRENT_LIST_DIR}/system_src/interrupt.c
		${CMAKE_CURRENT_LIST_DIR}/system_src/locks.c
		${CMAKE_CURRENT_LIST_DIR}/system_src/printf.c
		${CMAKE_CURRENT_LIST_DIR}/system_src/sleep.c
		${CMAKE_CURRENT_LIST_DIR}/system_src/syscalls.c
		# C Drivers
		${CMAKE_CURRENT_LIST_DIR}/src/aes.c
		${CMAKE_CURRENT_LIST_DIR}/src/apu.c
		${CMAKE_CURRENT_LIST_DIR}/src/clint.c
		${CMAKE_CURRENT_LIST_DIR}/src/dmac.c
		${CMAKE_CURRENT_LIST_DIR}/src/dvp.c
		${CMAKE_CURRENT_LIST_DIR}/src/fft.c
		${CMAKE_CURRENT_LIST_DIR}/src/fpioa.c
		${CMAKE_CURRENT_LIST_DIR}/src/gpio.c
		${CMAKE_CURRENT_LIST_DIR}/src/gpiohs.c
		${CMAKE_CURRENT_LIST_DIR}/src/i2c.c
		${CMAKE_CURRENT_LIST_DIR}/src/i2s.c
		${CMAKE_CURRENT_LIST_DIR}/src/kpu.c
		${CMAKE_CURRENT_LIST_DIR}/src/plic.c
		${CMAKE_CURRENT_LIST_DIR}/src/pwm.c
		${CMAKE_CURRENT_LIST_DIR}/src/rtc.c
		${CMAKE_CURRENT_LIST_DIR}/src/sha256.c
		${CMAKE_CURRENT_LIST_DIR}/src/spi.c
		${CMAKE_CURRENT_LIST_DIR}/src/sysctl.c
		${CMAKE_CURRENT_LIST_DIR}/src/timer.c
		${CMAKE_CURRENT_LIST_DIR}/src/uart.c
		${CMAKE_CURRENT_LIST_DIR}/src/uarths.c
		${CMAKE_CURRENT_LIST_DIR}/src/utils.c
		${CMAKE_CURRENT_LIST_DIR}/src/wdt.c
)

target_include_directories(${CURRENT_COMPONENT_NAME} PUBLIC
		${CMAKE_CURRENT_LIST_DIR}/include
		${CMAKE_CURRENT_LIST_DIR}/system_inc
)

# Export BSP:Drivers
add_library(${COMPONENT_NAME}::${SUBCOMPONENT_NAME} ALIAS ${CURRENT_COMPONENT_NAME})

target_compile_options( ${CURRENT_COMPONENT_NAME}
    PRIVATE
$<$<COMPILE_LANGUAGE:C>:
# C only Options
	-std=gnu11 -Wno-pointer-to-int-cast
	-Wno-old-style-declaration
>
# ASM only Options
$<$<COMPILE_LANGUAGE:ASM>:
	-x assembler-with-cpp -D __riscv64
>
# Any LANG option
	-Wall
	-Werror=all
	-Wno-error=unused-function
	-Wno-error=unused-but-set-variable
	-Wno-error=unused-variable
	-Wno-error=deprecated-declarations
	-Wextra
	-Werror=frame-larger-than=32768
	-Wno-unused-parameter
	-Wno-sign-compare
	-Wno-error=missing-braces
	-Wno-error=return-type
	-Wno-error=pointer-sign
	-Wno-missing-braces
	-Wno-strict-aliasing
	-Wno-implicit-fallthrough
	-Wno-missing-field-initializers
	-Wno-int-to-pointer-cast
	-Wno-error=comment
	-Wno-error=logical-not-parentheses
	-Wno-error=duplicate-decl-specifier
	-Wno-error=parentheses

	-mcmodel=medany
	-mabi=lp64f
	-march=rv64imafc
	-fno-common
	-ffunction-sections
	-fdata-sections
	-fstrict-volatile-bitfields
	-fno-zero-initialized-in-bss
	-ffast-math
	-fno-math-errno
	-fsingle-precision-constant
	-Os
	-ggdb
)
