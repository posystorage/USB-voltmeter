################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/InitDevice.c \
../src/main.c 

OBJS += \
./src/InitDevice.o \
./src/main.o 

C_DEPS += \
./src/InitDevice.d \
./src/main.d 


# Each subdirectory must supply rules for building sources it contributes
src/InitDevice.o: ../src/InitDevice.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m3 -mthumb '-DEFM32G222F128=1' -I"F:/github/USB-voltmeter/code/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/emlib/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/CMSIS/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/bsp" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/Device/SiliconLabs/EFM32G/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/drivers" -O0 -Wall -c -fmessage-length=0 -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -std=c99 -MMD -MP -MF"src/InitDevice.d" -MT"src/InitDevice.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/main.o: ../src/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m3 -mthumb '-DEFM32G222F128=1' -I"F:/github/USB-voltmeter/code/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/emlib/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/CMSIS/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/bsp" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/Device/SiliconLabs/EFM32G/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/drivers" -O0 -Wall -c -fmessage-length=0 -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -std=c99 -MMD -MP -MF"src/main.d" -MT"src/main.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


