################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../emlib/em_adc.c \
../emlib/em_cmu.c \
../emlib/em_dac.c \
../emlib/em_emu.c \
../emlib/em_gpio.c \
../emlib/em_system.c \
../emlib/em_usart.c 

OBJS += \
./emlib/em_adc.o \
./emlib/em_cmu.o \
./emlib/em_dac.o \
./emlib/em_emu.o \
./emlib/em_gpio.o \
./emlib/em_system.o \
./emlib/em_usart.o 

C_DEPS += \
./emlib/em_adc.d \
./emlib/em_cmu.d \
./emlib/em_dac.d \
./emlib/em_emu.d \
./emlib/em_gpio.d \
./emlib/em_system.d \
./emlib/em_usart.d 


# Each subdirectory must supply rules for building sources it contributes
emlib/em_adc.o: ../emlib/em_adc.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m3 -mthumb '-DEFM32G222F128=1' -I"F:/github/USB-voltmeter/code/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/CMSIS/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/bsp" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/Device/SiliconLabs/EFM32G/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/drivers" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/emlib/inc" -O0 -Wall -c -fmessage-length=0 -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -std=c99 -MMD -MP -MF"emlib/em_adc.d" -MT"emlib/em_adc.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emlib/em_cmu.o: ../emlib/em_cmu.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m3 -mthumb '-DEFM32G222F128=1' -I"F:/github/USB-voltmeter/code/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/CMSIS/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/bsp" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/Device/SiliconLabs/EFM32G/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/drivers" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/emlib/inc" -O0 -Wall -c -fmessage-length=0 -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -std=c99 -MMD -MP -MF"emlib/em_cmu.d" -MT"emlib/em_cmu.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emlib/em_dac.o: ../emlib/em_dac.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m3 -mthumb '-DEFM32G222F128=1' -I"F:/github/USB-voltmeter/code/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/CMSIS/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/bsp" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/Device/SiliconLabs/EFM32G/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/drivers" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/emlib/inc" -O0 -Wall -c -fmessage-length=0 -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -std=c99 -MMD -MP -MF"emlib/em_dac.d" -MT"emlib/em_dac.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emlib/em_emu.o: ../emlib/em_emu.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m3 -mthumb '-DEFM32G222F128=1' -I"F:/github/USB-voltmeter/code/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/CMSIS/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/bsp" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/Device/SiliconLabs/EFM32G/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/drivers" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/emlib/inc" -O0 -Wall -c -fmessage-length=0 -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -std=c99 -MMD -MP -MF"emlib/em_emu.d" -MT"emlib/em_emu.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emlib/em_gpio.o: ../emlib/em_gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m3 -mthumb '-DEFM32G222F128=1' -I"F:/github/USB-voltmeter/code/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/CMSIS/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/bsp" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/Device/SiliconLabs/EFM32G/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/drivers" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/emlib/inc" -O0 -Wall -c -fmessage-length=0 -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -std=c99 -MMD -MP -MF"emlib/em_gpio.d" -MT"emlib/em_gpio.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emlib/em_system.o: ../emlib/em_system.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m3 -mthumb '-DEFM32G222F128=1' -I"F:/github/USB-voltmeter/code/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/CMSIS/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/bsp" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/Device/SiliconLabs/EFM32G/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/drivers" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/emlib/inc" -O0 -Wall -c -fmessage-length=0 -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -std=c99 -MMD -MP -MF"emlib/em_system.d" -MT"emlib/em_system.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

emlib/em_usart.o: ../emlib/em_usart.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m3 -mthumb '-DEFM32G222F128=1' -I"F:/github/USB-voltmeter/code/inc" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/CMSIS/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/bsp" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/Device/SiliconLabs/EFM32G/Include" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/kits/common/drivers" -I"H:/SimplicityStudio/v3/developer/sdks/efm32/v2/emlib/inc" -O0 -Wall -c -fmessage-length=0 -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -std=c99 -MMD -MP -MF"emlib/em_usart.d" -MT"emlib/em_usart.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


