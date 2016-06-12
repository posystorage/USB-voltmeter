/**************************************************************************//**
 * @file
 * @brief Empty Project
 * @author Energy Micro AS
 * @version 3.20.2
 ******************************************************************************
 * @section License
 * <b>(C) Copyright 2014 Silicon Labs, http://www.silabs.com</b>
 *******************************************************************************
 *
 * This file is licensed under the Silicon Labs Software License Agreement. See
 * "http://developer.silabs.com/legal/version/v11/Silicon_Labs_Software_License_Agreement.txt"
 * for details. Before using this software for any purpose, you must agree to the
 * terms of that agreement.
 *
 ******************************************************************************/
#include <stdint.h>
#include <stdbool.h>
#include "em_usart.h"
#include "em_device.h"
#include "em_chip.h"
#include "InitDevice.h"
#include "em_cmu.h"
#include "em_gpio.h"
#include "stdio.h"
#include "em_emu.h"
#include "em_adc.h"
#include "em_dac.h"



void USART0_RX_IRQHandler(void)
{
    if(USART_Rx(USART0) == 0x05)
    {
        GPIO_PinOutToggle(gpioPortA, 8);
    }
}

void sys_int(void)
{
	  CHIP_Init();
	  //UART_Initial();
	  /* Infinite loop */
	  enter_DefaultMode_from_RESET();
	  /*串口进中断的关键，屏蔽两行没问题，原因不明*/
	  USART0->IFC = _USART_IFC_MASK;
	   NVIC_ClearPendingIRQ(USART0_RX_IRQn);
	   NVIC_EnableIRQ(USART0_RX_IRQn);
	    USART0->IEN = USART_IEN_RXDATAV;
	     USART0->ROUTE |=  USART_ROUTE_TXPEN | USART_ROUTE_RXPEN | USART_ROUTE_LOCATION_LOC0;
	    /*串口进中断结束*/
	     /* Enable DAC channel 0, located on pin PB11 */
	    	  DAC_Enable(DAC0, 0, true);

	 //CMU_ClockEnable(cmuClock_GPIO, true);
	 //GPIO_PinModeSet(gpioPortA, 9, gpioModePushPullDrive, 1);
	 //GPIO_PinModeSet(gpioPortA, 8, gpioModePushPullDrive, 1);

}


/**************************************************************************//**
 * @brief  Write DAC conversion value
 *****************************************************************************/
void DAC_WriteData(DAC_TypeDef *dac, unsigned int value, unsigned int ch)
{
  /* Write data output value to the correct register. */
  if (!ch)
  {
    dac->CH0DATA = value;
  }
  else
  {
    dac->CH1DATA = value;
  }
}


/**************************************************************************//**
 * @brief  Main function
 *****************************************************************************/
int main(void)
{
	int i;
	//unsigned char ucData = 0;

	  uint32_t sample;
	  uint8_t cache1=0;
	  uint8_t cache=0;
	  uint32_t DAC_Value;
	sys_int();
  while (1) {

	  //GPIO_PinOutSet(gpioPortA, 9);
	  for(i = 0; i < 200000; i++);


	  /* Calculate output to 0.5 V. */
	  DAC_Value = 0x428;

	  /* Write the new value to DAC register */
	  DAC_WriteData(DAC0, DAC_Value, 0);

	  GPIO_PinOutClear(gpioPortA, 9);
	  for(i = 0; i < 200000; i++);
	 // GPIO_PinOutToggle(gpioPortA, 8);
	 // if(ucData < 255)ucData++;
	 // else ucData = 0;
	 // USART_Tx(USART0,ucData);

	  ADC_Start(ADC0, adcStartSingle);
	     /* Wait while conversion is active */
	     while (ADC0->STATUS & ADC_STATUS_SINGLEACT) ;
	     /* Get ADC result */
	     sample = ADC_DataSingleGet(ADC0);


	     cache1=sample;
	     sample>>=8;
	     cache=sample;
	     USART_Tx(USART0,cache);
	     USART_Tx(USART0,cache1);
  }
}
