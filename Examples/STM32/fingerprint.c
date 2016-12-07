#include "fingerprint.h"
#include <stdint.h>

extern sfr sbit CS_PIN;
extern sfr sbit TFT_CS;

void fingerprint_is_ready()
{
     uint8_t temp_spi_buffer;
     CS_PIN = 0;
     delay_ms(10);
     Spi_Write(FP_TEST);
     delay_ms(20);
     CS_PIN = 1;

     temp_spi_buffer = 0;

     while ( temp_spi_buffer != FP_READY )
     {
           CS_PIN = 0;
           delay_ms(10);
           temp_spi_buffer = SPI_Read(FP_DUMMY);
           temp_spi_buffer = SPI_Read(FP_DUMMY);
           CS_PIN = 1;
           delay_ms(1000);
     }
}

void fingerprint_capture_image()
{
     uint8_t temp_spi_buffer;
     CS_PIN = 0;
     delay_ms(10);
     Spi_Write(FP_CAPTURE);
     delay_ms(20);
     CS_PIN = 1;
     delay_ms(1000);

     temp_spi_buffer= 0;

     while ( temp_spi_buffer != 1 )
     {
           CS_PIN = 0;
           delay_ms(10);
           temp_spi_buffer = SPI_Read(FP_DUMMY);
           temp_spi_buffer = SPI_Read(FP_DUMMY);
           CS_PIN = 1;
           delay_ms(1000);
     }
}

void fingerprint_display_image()
{
     uint8_t temp_spi_buffer;
     uint64_t temp_i;
     CS_PIN = 0;
     delay_ms(10);
     Spi_Write(FP_GET_IMAGE);
     delay_ms(20);
     CS_PIN = 1;
     delay_ms(20);
     TFT_CS = 0;
     TFT_Set_Address_Ptr(0,0);


     for (temp_i = 0; temp_i < 240*320; temp_i++)
     {
        CS_PIN = 0;
        temp_spi_buffer = SPI_READ(FP_DUMMY);
        CS_PIN = 1;
        tft_write_data_ptr(temp_spi_buffer);
     }
     TFT_CS = 0;

}

void fingerprint_end_image_transfer()
{
     uint8_t temp_spi_buffer;
     uint64_t temp_i;
     CS_PIN = 0;
     delay_ms(10);
     Spi_Write(FP_END_IMG_TRANSFER);
     delay_ms(20);
     CS_PIN = 1;
     delay_ms(20);
     temp_spi_buffer= 0;

     while ( temp_spi_buffer != FP_DUMMY )
     {
           CS_PIN = 0;
           delay_ms(10);
           temp_spi_buffer = SPI_Read(FP_DUMMY);
           temp_spi_buffer = SPI_Read(FP_DUMMY);
           CS_PIN = 1;
           delay_ms(1000);
     }

}

void fingerprint_reset_default()
{
     uint8_t temp_spi_buffer;
     CS_PIN = 0;
     delay_ms(10);
     Spi_Write(FP_RESET_DEFAULT);
     delay_ms(20);
     CS_PIN = 1;
     delay_ms(1000);

     temp_spi_buffer= 0;

     while ( temp_spi_buffer != 1 )
     {
           CS_PIN = 0;
           delay_ms(10);
           temp_spi_buffer = SPI_Read(FP_DUMMY);
           temp_spi_buffer = SPI_Read(FP_DUMMY);
           CS_PIN = 1;
           delay_ms(1000);
     }
}