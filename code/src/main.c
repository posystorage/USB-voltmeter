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
        GPIO_PinOutToggle(gpioPortA, 9);
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
    uint8_t cache1 = 0;
    uint8_t cache = 0;
    uint32_t DAC_Value;
    sys_int();
    while (1)
    {

        for(i = 0; i < 20000; i++);
        //for(i = 0; i < 200000; i++);

        DAC_Value = 0x7ff;
        DAC_WriteData(DAC0, DAC_Value, 0);

        ADC_Start(ADC0, adcStartSingle);
        /* Wait while conversion is active */
        while (ADC0->STATUS & ADC_STATUS_SINGLEACT) ;
        /* Get ADC result */
        sample = ADC_DataSingleGet(ADC0);

        if(sample < 0xe0)
        {
            GPIO_PinOutSet(gpioPortA, 8);
        }
        else
        {
            GPIO_PinOutClear(gpioPortA, 8);
        }

        cache1 = sample;
        sample >>= 8;
        cache = sample;
        USART_Tx(USART0, cache);
        USART_Tx(USART0, cache1);
    }
}

// GPIO_PinOutToggle(gpioPortA, 8);
