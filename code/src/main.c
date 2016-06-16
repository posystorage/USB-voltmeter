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
        //GPIO_PinOutToggle(gpioPortA, 9);
    }
}

void sys_int(void)
{
    CHIP_Init();

    /* Infinite loop */
    enter_DefaultMode_from_RESET();

    //GPIO_PinOutClear(gpioPortA, 8);

    /*串口进中断的关键，屏蔽两行没问题，原因不明*/
    USART0->IFC = _USART_IFC_MASK;
    NVIC_ClearPendingIRQ(USART0_RX_IRQn);
    NVIC_EnableIRQ(USART0_RX_IRQn);
    USART0->IEN = USART_IEN_RXDATAV;
    USART0->ROUTE |=  USART_ROUTE_TXPEN | USART_ROUTE_RXPEN | USART_ROUTE_LOCATION_LOC0;
    /*串口进中断结束*/
    /* Enable DAC channel 0, located on pin PB11 */
    DAC_Enable(DAC0, 0, true);

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

uint32_t ADC0_get_result()
{
    uint32_t samp;
    ADC_Start(ADC0, adcStartSingle);
    /* Wait while conversion is active */
    while (ADC0->STATUS & ADC_STATUS_SINGLEACT) ;
    /* Get ADC result */
    samp = ADC_DataSingleGet(ADC0);
    return samp;
}

uint32_t ADC0_get_send_result()
{
    uint32_t samp;

    uint8_t cache1 = 0;
    uint8_t cache = 0;
    uint32_t cache2 = 0;
    samp = ADC0_get_result();
    cache2 = samp;
    cache1 = samp;
    samp >>= 8;
    cache = samp;
    USART_Tx(USART0, cache);
    USART_Tx(USART0, cache1);
    return cache2;

}

void adc_change_input_ch(uint8_t ch)
{
	ADC_InitSingle_TypeDef initsingle = ADC_INITSINGLE_DEFAULT;
    switch(ch)
    {
    case 4:
        initsingle.prsSel = adcPRSSELCh0;
        initsingle.acqTime = adcAcqTime64;
        initsingle.reference = adcRef1V25;
        initsingle.resolution = adcRes12Bit;
        initsingle.input = adcSingleInpCh4;
        initsingle.diff = 0;
        initsingle.prsEnable = 0;
        initsingle.leftAdjust = 0;
        initsingle.rep = 0;
        ADC_InitSingle(ADC0, &initsingle);
        break;
    case 5:
        initsingle.prsSel = adcPRSSELCh0;
        initsingle.acqTime = adcAcqTime64;
        initsingle.reference = adcRef1V25;
        initsingle.resolution = adcRes12Bit;
        initsingle.input = adcSingleInpCh5;
        initsingle.diff = 0;
        initsingle.prsEnable = 0;
        initsingle.leftAdjust = 0;
        initsingle.rep = 0;
        ADC_InitSingle(ADC0, &initsingle);
        break;

    case 6:
    	initsingle.prsSel = adcPRSSELCh0;
		initsingle.acqTime = adcAcqTime64;
		initsingle.reference = adcRef1V25;
		initsingle.resolution = adcRes12Bit;
		initsingle.input = adcSingleInpCh6;
		initsingle.diff = 0;
		initsingle.prsEnable = 0;
		initsingle.leftAdjust = 0;
		initsingle.rep = 0;
		ADC_InitSingle(ADC0, &initsingle);
		break;
    }
}

/**************************************************************************//**
 * @brief  Main function
 *****************************************************************************/
int main(void)
{
    int i;

    uint32_t sample;
    uint8_t working_satae = 1;//0-普通5v  //1-qc2.0插入前  //2-qc2.0前奏   //3-qc2.0-9v
    uint32_t DAC_Value;
    sys_int();
    while (1)
    {
        switch(working_satae)
        {
			case 0:
			{
				for(i = 0; i < 20000; i++);
				DAC_Enable(DAC0, 0, 0);
				adc_change_input_ch(4);
				ADC0_get_send_result();
				adc_change_input_ch(6);
				ADC0_get_send_result();
				break;
			}//case 0
			case 1:
			{
				for(i = 0; i < 20000; i++);
				DAC_Value = 0x2e8;
				DAC_WriteData(DAC0, DAC_Value, 0);
				adc_change_input_ch(4);
				ADC0_get_send_result();
				adc_change_input_ch(6);
				ADC0_get_send_result();
				adc_change_input_ch(5);
				sample =  ADC0_get_result();
				if(sample > 0x600 )
				{
					for(i = 0; i < 200; i++);
					adc_change_input_ch(5);
					sample =  ADC0_get_result();
					if(sample > 0x600 )
					{
						working_satae = 2;
					}
				}
				break;
			}
			case 2:
			{
				DAC_Enable(DAC0, 0, 1);
				for(i = 0; i < 20000; i++);
				DAC_Value = 0x2e8;
				DAC_WriteData(DAC0, DAC_Value, 0);
				adc_change_input_ch(4);
				ADC0_get_send_result();
				adc_change_input_ch(6);
				ADC0_get_send_result();
				adc_change_input_ch(5);
				sample =  ADC0_get_result();

				if(sample < 0xd0 )
				{
					for(i = 0; i < 20000; i++);
					adc_change_input_ch(5);
					sample =  ADC0_get_result();
					if(sample < 0xd0 )
					{
						GPIO_PinOutSet(gpioPortA, 8);
						GPIO_PinModeSet(gpioPortE, 13, gpioModePushPullDrive, 1);
						GPIO_PinOutSet(gpioPortE, 13);
						DAC_Value = 0xfff;
						DAC_WriteData(DAC0, DAC_Value, 0);
						GPIO_PinOutClear(gpioPortA, 9);
						working_satae = 3;
					}
					else
					{
						GPIO_PinOutClear(gpioPortA, 8);
						GPIO_PinOutSet(gpioPortA, 9);
						GPIO_PinOutClear(gpioPortE, 13);
						GPIO_PinModeSet(gpioPortE, 13, gpioModeInput, 0);
					}

				}

				break;
			}//case 1
			case 3:
			{
				DAC_Enable(DAC0, 0, 1);
				for(i = 0; i < 20000; i++);
				adc_change_input_ch(4);
				ADC0_get_send_result();
				adc_change_input_ch(6);
				ADC0_get_send_result();
				adc_change_input_ch(5);
				sample = ADC0_get_result();
				if(sample > 0x7a0)
				{
					for(i = 0; i < 20000; i++);
					//adc_change_input_ch(5);
					sample =  ADC0_get_result();
					if(sample > 0x780)
					{
					working_satae = 1;
					GPIO_PinOutClear(gpioPortA, 8);
					GPIO_PinOutSet(gpioPortA, 9);
					GPIO_PinOutClear(gpioPortE, 13);
					GPIO_PinModeSet(gpioPortE, 13, gpioModeInput, 0);
					}
				}
				break;
			}//case 2
        }
    }
}

