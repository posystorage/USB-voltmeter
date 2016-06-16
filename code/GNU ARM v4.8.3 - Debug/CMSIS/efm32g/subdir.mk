################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../CMSIS/efm32g/system_efm32g.c 

S_SRCS += \
../CMSIS/efm32g/startup_gcc_efm32g.s 

OBJS += \
./CMSIS/efm32g/startup_gcc_efm32g.o \
./CMSIS/efm32g/system_efm32g.o 

C_DEPS += \
./CMSIS/efm32g/system_efm32g.d 


# Each subdirectory must supply rules for building sources it contributes
CMSIS/efm32g/%.o: ../CMSIS/efm32g/%.s
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Assembler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m3 -mthumb -c -x assembler-with-cpp -I"F:/github/USB-voltmeter/code/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/bsp" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/emlib/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/drivers" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/Device/SiliconLabs/EFM32G/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/CMSIS/Include" '-DEFM32G222F128=1' -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

CMSIS/efm32g/system_efm32g.o: ../CMSIS/efm32g/system_efm32g.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m3 -mthumb '-DEFM32G222F128=1' -I"F:/github/USB-voltmeter/code/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/bsp" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/emlib/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/drivers" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/Device/SiliconLabs/EFM32G/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/CMSIS/Include" -O0 -Wall -c -fmessage-length=0 -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -std=c99 -MMD -MP -MF"CMSIS/efm32g/system_efm32g.d" -MT"CMSIS/efm32g/system_efm32g.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


