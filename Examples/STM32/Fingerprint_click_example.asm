_main:
;Fingerprint_click_example.c,15 :: 		void main()
SUB	SP, SP, #4
;Fingerprint_click_example.c,20 :: 		_SPI_SSI_1, &_GPIO_MODULE_SPI3_PC10_11_12 );
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVW	R1, #772
;Fingerprint_click_example.c,17 :: 		SPI3_Init_Advanced( _SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #0
;Fingerprint_click_example.c,20 :: 		_SPI_SSI_1, &_GPIO_MODULE_SPI3_PC10_11_12 );
BL	_SPI3_Init_Advanced+0
;Fingerprint_click_example.c,22 :: 		GPIO_Digital_Output( &GPIOD_BASE, _GPIO_PINMASK_13 );
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Fingerprint_click_example.c,23 :: 		Delay_ms(3000);
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;Fingerprint_click_example.c,26 :: 		TFT_Init_ILI9341_8bit(320, 240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;Fingerprint_click_example.c,27 :: 		TFT_Set_Pen(CL_BLACK, 1);
MOVS	R1, #1
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;Fingerprint_click_example.c,28 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;Fingerprint_click_example.c,29 :: 		TFT_Fill_Screen(CL_Aqua);
MOVW	R0, #4095
BL	_TFT_Fill_Screen+0
;Fingerprint_click_example.c,31 :: 		TFT_Write_Text("TFT Initialized, waiting for fingerprint click",10,10);
MOVW	R0, #lo_addr(?lstr1_Fingerprint_click_example+0)
MOVT	R0, #hi_addr(?lstr1_Fingerprint_click_example+0)
MOVS	R2, #10
MOVS	R1, #10
BL	_TFT_Write_Text+0
;Fingerprint_click_example.c,32 :: 		Delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;Fingerprint_click_example.c,33 :: 		TFT_Set_Address_Ptr(0,0);
MOVS	R1, #0
MOVS	R0, #0
MOVW	R4, #lo_addr(_TFT_Set_Address_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Set_Address_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;Fingerprint_click_example.c,34 :: 		delay_ms(10000); // wait for the click to go out of bootloader mode
MOVW	R7, #3583
MOVT	R7, #1831
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;Fingerprint_click_example.c,36 :: 		TFT_Write_Text("Reset fingerprint to default...", 10, 30);
MOVW	R0, #lo_addr(?lstr2_Fingerprint_click_example+0)
MOVT	R0, #hi_addr(?lstr2_Fingerprint_click_example+0)
MOVS	R2, #30
MOVS	R1, #10
BL	_TFT_Write_Text+0
;Fingerprint_click_example.c,37 :: 		fingerprint_reset_default();
BL	_fingerprint_reset_default+0
;Fingerprint_click_example.c,38 :: 		TFT_Write_Text("passed", 200, 30);
MOVW	R0, #lo_addr(?lstr3_Fingerprint_click_example+0)
MOVT	R0, #hi_addr(?lstr3_Fingerprint_click_example+0)
MOVS	R2, #30
MOVS	R1, #200
BL	_TFT_Write_Text+0
;Fingerprint_click_example.c,40 :: 		TFT_Write_Text("Fingerprint ready test...", 10, 50);
MOVW	R0, #lo_addr(?lstr4_Fingerprint_click_example+0)
MOVT	R0, #hi_addr(?lstr4_Fingerprint_click_example+0)
MOVS	R2, #50
MOVS	R1, #10
BL	_TFT_Write_Text+0
;Fingerprint_click_example.c,41 :: 		fingerprint_is_ready();
BL	_fingerprint_is_ready+0
;Fingerprint_click_example.c,42 :: 		TFT_Write_Text("passed", 200, 50);
MOVW	R0, #lo_addr(?lstr5_Fingerprint_click_example+0)
MOVT	R0, #hi_addr(?lstr5_Fingerprint_click_example+0)
MOVS	R2, #50
MOVS	R1, #200
BL	_TFT_Write_Text+0
;Fingerprint_click_example.c,44 :: 		TFT_Write_Text("Fingerprint capture image...", 10, 70);
MOVW	R0, #lo_addr(?lstr6_Fingerprint_click_example+0)
MOVT	R0, #hi_addr(?lstr6_Fingerprint_click_example+0)
MOVS	R2, #70
MOVS	R1, #10
BL	_TFT_Write_Text+0
;Fingerprint_click_example.c,45 :: 		fingerprint_capture_image();
BL	_fingerprint_capture_image+0
;Fingerprint_click_example.c,46 :: 		TFT_Write_Text("passed", 200, 70);
MOVW	R0, #lo_addr(?lstr7_Fingerprint_click_example+0)
MOVT	R0, #hi_addr(?lstr7_Fingerprint_click_example+0)
MOVS	R2, #70
MOVS	R1, #200
BL	_TFT_Write_Text+0
;Fingerprint_click_example.c,48 :: 		TFT_Write_Text("Displaying image", 10, 90);
MOVW	R0, #lo_addr(?lstr8_Fingerprint_click_example+0)
MOVT	R0, #hi_addr(?lstr8_Fingerprint_click_example+0)
MOVS	R2, #90
MOVS	R1, #10
BL	_TFT_Write_Text+0
;Fingerprint_click_example.c,49 :: 		delay_ms(3000);
MOVW	R7, #20735
MOVT	R7, #549
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
;Fingerprint_click_example.c,50 :: 		fingerprint_display_image();
BL	_fingerprint_display_image+0
;Fingerprint_click_example.c,51 :: 		fingerprint_end_image_transfer();
BL	_fingerprint_end_image_transfer+0
;Fingerprint_click_example.c,53 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
