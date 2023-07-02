# Kendryte K210 Template

A template for projects based on the Kendryte K210 microcontroller.

This template has been tested with the dev. board [SiPEED MAiX BiT](https://wiki.sipeed.com/soft/maixpy/en/develop_kit_board/maix_bit.html) ([Kendryte K210](https://www.canaan.io/product/kendryteai)). The BSP and the RISCV 64bit toolchain is provided by [Canaan](https://www.canaan.io/developer).

At the moment, the template toolchain only support Windows OS.

# Project structure

 - __project/cmake__ : Contains the toolchain (compiler, linker and options definition), the linker script and some project specific cmake variables.

 - __project/BSP__ : Software component containing the basic software package ([Kendryte Standalone SDK](https://www.canaan.io/developer)).

 - __project/main.c__ : The file where the magic happens. After the startup code from the BSP, the system's entry point is defined here.

# CMake and Ninja

[CMake](https://cmake.org/) is a tool for generation and automation of code. The name is an abbreviation of __cross platform make__. It is a multiplatform, open-source tool that can generate Makefiles (or different build system projects like Ninja) from a simple and more readable configuration file. CMake in a nutshell is a syntax to describe a project and the compiler environment so it can be abstracted from the final build system file (Makefiles, Ninja.build, Eclipse .cproject, etc)

[Ninja](https://ninja-build.org/), in other hand, is a build system tool meant to replace Makefiles. It is focused by design to run as fast as possible. It already knows the number of cores of your machine, so it dynamically decides when and how to parallelize the build process.

## Build Process

The build process is pretty straightforward, just create a build folder, invoke CMake over the `project` folder and then run ninja (I recommend to use Ninja instead of Make).

```.sh
$ #Assuming you are at the root folder of this repo:
$ mkdir build
$ cd build
$ cmake ../project -GNinja
$ ninja
```

After the compilation, the artifacts are located at the new `build/bin` folder. This will generate __ELF__, __S19__ and __HEX__ files.
You can now load the binary to the microcontroller using OpenOCD and see the leds blinking.

## __Important!__

If you have any comment or question, you can reach me out [josepablo134@gmail.com](mailto:josepablo134@gmail.com)