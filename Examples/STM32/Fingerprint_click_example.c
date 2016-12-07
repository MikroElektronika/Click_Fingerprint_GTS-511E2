#include <stdint.h>
#include "fingerprint.h"

sbit CS_PIN at GPIOD_ODR.b13;

unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RST at GPIOE_ODR.B8;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_BLED at GPIOE_ODR.B9;


void main()
{
    SPI3_Init_Advanced( _SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
                    _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                    _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE |
                    _SPI_SSI_1, &_GPIO_MODULE_SPI3_PC10_11_12 );

     GPIO_Digital_Output( &GPIOD_BASE, _GPIO_PINMASK_13 );
     Delay_ms(3000);

     
     TFT_Init_ILI9341_8bit(320, 240);
     TFT_Set_Pen(CL_BLACK, 1);
     TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
     TFT_Fill_Screen(CL_Aqua);

     TFT_Write_Text("TFT Initialized, waiting for fingerprint click",10,10);
     Delay_ms(1000);
     TFT_Set_Address_Ptr(0,0);
     delay_ms(10000); // wait for the click to go out of bootloader mode
     
//     TFT_Write_Text("Reset fingerprint to default...", 10, 30);
//     fingerprint_reset_default();
//     TFT_Write_Text("passed", 200, 30);
     
     TFT_Write_Text("Fingerprint ready test...", 10, 50);
     fingerprint_is_ready();
     TFT_Write_Text("passed", 200, 50);

     TFT_Write_Text("Fingerprint capture image...", 10, 70);
     fingerprint_capture_image();
     TFT_Write_Text("passed", 200, 70);
     
     TFT_Write_Text("Displaying image", 10, 90);
     delay_ms(3000);
     fingerprint_display_image();
     fingerprint_end_image_transfer();

}