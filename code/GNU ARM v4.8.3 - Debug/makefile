################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include emlib/subdir.mk
-include CMSIS/efm32g/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: USB-voltmeter.axf

# Tool invocations
USB-voltmeter.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU ARM C Linker'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m3 -mthumb -T "USB-voltmeter.ld" -Xlinker --gc-sections -Xlinker -Map="USB-voltmeter.map" --specs=nano.specs -o USB-voltmeter.axf "./src/InitDevice.o" "./src/main.o" "./emlib/em_adc.o" "./emlib/em_cmu.o" "./emlib/em_dac.o" "./emlib/em_emu.o" "./emlib/em_gpio.o" "./emlib/em_system.o" "./emlib/em_usart.o" "./CMSIS/efm32g/startup_gcc_efm32g.o" "./CMSIS/efm32g/system_efm32g.o" -Wl,--start-group -lgcc -lc -lnosys -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

	@echo 'Building hex file: USB-voltmeter.hex'
	arm-none-eabi-objcopy -O ihex "USB-voltmeter.axf" "USB-voltmeter.hex"
	@echo ' '

	@echo 'Building bin file: USB-voltmeter.bin'
	arm-none-eabi-objcopy -O binary "USB-voltmeter.axf" "USB-voltmeter.bin"
	@echo ' '

	@echo 'Running size tool'
	arm-none-eabi-size "USB-voltmeter.axf"
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES) USB-voltmeter.axf
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
