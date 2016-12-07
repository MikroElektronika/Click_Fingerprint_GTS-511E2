#line 1 "C:/Users/Viktor/Desktop/Klikovi/Fingerptint_click/stm32_primer/fingerprint.c"
#line 1 "c:/users/viktor/desktop/klikovi/fingerptint_click/stm32_primer/fingerprint.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 17 "c:/users/viktor/desktop/klikovi/fingerptint_click/stm32_primer/fingerprint.h"
void fingerprint_is_ready();
#line 23 "c:/users/viktor/desktop/klikovi/fingerptint_click/stm32_primer/fingerprint.h"
void fingerprint_capture_image();
#line 29 "c:/users/viktor/desktop/klikovi/fingerptint_click/stm32_primer/fingerprint.h"
void fingerprint_display_image();
#line 35 "c:/users/viktor/desktop/klikovi/fingerptint_click/stm32_primer/fingerprint.h"
void fingerprint_reset_default();
#line 41 "c:/users/viktor/desktop/klikovi/fingerptint_click/stm32_primer/fingerprint.h"
void fingerprint_end_image_transfer();
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 4 "C:/Users/Viktor/Desktop/Klikovi/Fingerptint_click/stm32_primer/fingerprint.c"
extern sfr sbit CS_PIN;
extern sfr sbit TFT_CS;

void fingerprint_is_ready()
{
 uint8_t temp_spi_buffer;
 CS_PIN = 0;
 delay_ms(10);
 Spi_Write( 0x3E );
 delay_ms(20);
 CS_PIN = 1;

 temp_spi_buffer = 0;

 while ( temp_spi_buffer !=  0x3F  )
 {
 CS_PIN = 0;
 delay_ms(10);
 temp_spi_buffer = SPI_Read( 0x41 );
 temp_spi_buffer = SPI_Read( 0x41 );
 CS_PIN = 1;
 delay_ms(1000);
 }
}

void fingerprint_capture_image()
{
 uint8_t temp_spi_buffer;
 CS_PIN = 0;
 delay_ms(10);
 Spi_Write( 0x31 );
 delay_ms(20);
 CS_PIN = 1;
 delay_ms(1000);

 temp_spi_buffer= 0;

 while ( temp_spi_buffer != 1 )
 {
 CS_PIN = 0;
 delay_ms(10);
 temp_spi_buffer = SPI_Read( 0x41 );
 temp_spi_buffer = SPI_Read( 0x41 );
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
 Spi_Write( 0x32 );
 delay_ms(20);
 CS_PIN = 1;
 delay_ms(20);
 TFT_CS = 0;
 TFT_Set_Address_Ptr(0,0);


 for (temp_i = 0; temp_i < 240*320; temp_i++)
 {
 CS_PIN = 0;
 temp_spi_buffer = SPI_READ( 0x41 );
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
 Spi_Write( 0x34 );
 delay_ms(20);
 CS_PIN = 1;
 delay_ms(20);
 temp_spi_buffer= 0;

 while ( temp_spi_buffer !=  0x41  )
 {
 CS_PIN = 0;
 delay_ms(10);
 temp_spi_buffer = SPI_Read( 0x41 );
 temp_spi_buffer = SPI_Read( 0x41 );
 CS_PIN = 1;
 delay_ms(1000);
 }

}

void fingerprint_reset_default()
{
 uint8_t temp_spi_buffer;
 CS_PIN = 0;
 delay_ms(10);
 Spi_Write( 0x30 );
 delay_ms(20);
 CS_PIN = 1;
 delay_ms(1000);

 temp_spi_buffer= 0;

 while ( temp_spi_buffer != 1 )
 {
 CS_PIN = 0;
 delay_ms(10);
 temp_spi_buffer = SPI_Read( 0x41 );
 temp_spi_buffer = SPI_Read( 0x41 );
 CS_PIN = 1;
 delay_ms(1000);
 }
}
