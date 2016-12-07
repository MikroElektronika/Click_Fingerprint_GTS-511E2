_fingerprint_is_ready:
;fingerprint.c,7 :: 		void fingerprint_is_ready()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;fingerprint.c,10 :: 		CS_PIN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,11 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_fingerprint_is_ready0:
SUBS	R7, R7, #1
BNE	L_fingerprint_is_ready0
NOP
NOP
NOP
;fingerprint.c,12 :: 		Spi_Write(FP_TEST);
MOVS	R0, #62
BL	_SPI_Write+0
;fingerprint.c,13 :: 		delay_ms(20);
MOVW	R7, #43391
MOVT	R7, #3
NOP
NOP
L_fingerprint_is_ready2:
SUBS	R7, R7, #1
BNE	L_fingerprint_is_ready2
NOP
NOP
NOP
;fingerprint.c,14 :: 		CS_PIN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,16 :: 		temp_spi_buffer = 0;
; temp_spi_buffer start address is: 0 (R0)
MOVS	R0, #0
; temp_spi_buffer end address is: 0 (R0)
;fingerprint.c,18 :: 		while ( temp_spi_buffer != FP_READY )
L_fingerprint_is_ready4:
; temp_spi_buffer start address is: 0 (R0)
CMP	R0, #63
IT	EQ
BEQ	L_fingerprint_is_ready5
; temp_spi_buffer end address is: 0 (R0)
;fingerprint.c,20 :: 		CS_PIN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,21 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_fingerprint_is_ready6:
SUBS	R7, R7, #1
BNE	L_fingerprint_is_ready6
NOP
NOP
NOP
;fingerprint.c,22 :: 		temp_spi_buffer = SPI_Read(FP_DUMMY);
MOVS	R0, #65
BL	_SPI_Read+0
;fingerprint.c,23 :: 		temp_spi_buffer = SPI_Read(FP_DUMMY);
MOVS	R0, #65
BL	_SPI_Read+0
; temp_spi_buffer start address is: 8 (R2)
UXTB	R2, R0
;fingerprint.c,24 :: 		CS_PIN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,25 :: 		delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_fingerprint_is_ready8:
SUBS	R7, R7, #1
BNE	L_fingerprint_is_ready8
NOP
NOP
NOP
;fingerprint.c,26 :: 		}
UXTB	R0, R2
; temp_spi_buffer end address is: 8 (R2)
IT	AL
BAL	L_fingerprint_is_ready4
L_fingerprint_is_ready5:
;fingerprint.c,27 :: 		}
L_end_fingerprint_is_ready:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _fingerprint_is_ready
_fingerprint_capture_image:
;fingerprint.c,29 :: 		void fingerprint_capture_image()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;fingerprint.c,32 :: 		CS_PIN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,33 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_fingerprint_capture_image10:
SUBS	R7, R7, #1
BNE	L_fingerprint_capture_image10
NOP
NOP
NOP
;fingerprint.c,34 :: 		Spi_Write(FP_CAPTURE);
MOVS	R0, #49
BL	_SPI_Write+0
;fingerprint.c,35 :: 		delay_ms(20);
MOVW	R7, #43391
MOVT	R7, #3
NOP
NOP
L_fingerprint_capture_image12:
SUBS	R7, R7, #1
BNE	L_fingerprint_capture_image12
NOP
NOP
NOP
;fingerprint.c,36 :: 		CS_PIN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,37 :: 		delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_fingerprint_capture_image14:
SUBS	R7, R7, #1
BNE	L_fingerprint_capture_image14
NOP
NOP
NOP
;fingerprint.c,39 :: 		temp_spi_buffer= 0;
; temp_spi_buffer start address is: 0 (R0)
MOVS	R0, #0
; temp_spi_buffer end address is: 0 (R0)
;fingerprint.c,41 :: 		while ( temp_spi_buffer != 1 )
L_fingerprint_capture_image16:
; temp_spi_buffer start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_fingerprint_capture_image17
; temp_spi_buffer end address is: 0 (R0)
;fingerprint.c,43 :: 		CS_PIN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,44 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_fingerprint_capture_image18:
SUBS	R7, R7, #1
BNE	L_fingerprint_capture_image18
NOP
NOP
NOP
;fingerprint.c,45 :: 		temp_spi_buffer = SPI_Read(FP_DUMMY);
MOVS	R0, #65
BL	_SPI_Read+0
;fingerprint.c,46 :: 		temp_spi_buffer = SPI_Read(FP_DUMMY);
MOVS	R0, #65
BL	_SPI_Read+0
; temp_spi_buffer start address is: 8 (R2)
UXTB	R2, R0
;fingerprint.c,47 :: 		CS_PIN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,48 :: 		delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_fingerprint_capture_image20:
SUBS	R7, R7, #1
BNE	L_fingerprint_capture_image20
NOP
NOP
NOP
;fingerprint.c,49 :: 		}
UXTB	R0, R2
; temp_spi_buffer end address is: 8 (R2)
IT	AL
BAL	L_fingerprint_capture_image16
L_fingerprint_capture_image17:
;fingerprint.c,50 :: 		}
L_end_fingerprint_capture_image:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _fingerprint_capture_image
_fingerprint_display_image:
;fingerprint.c,52 :: 		void fingerprint_display_image()
SUB	SP, SP, #12
STR	LR, [SP, #0]
;fingerprint.c,56 :: 		CS_PIN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,57 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_fingerprint_display_image22:
SUBS	R7, R7, #1
BNE	L_fingerprint_display_image22
NOP
NOP
NOP
;fingerprint.c,58 :: 		Spi_Write(FP_GET_IMAGE);
MOVS	R0, #50
BL	_SPI_Write+0
;fingerprint.c,59 :: 		delay_ms(20);
MOVW	R7, #43391
MOVT	R7, #3
NOP
NOP
L_fingerprint_display_image24:
SUBS	R7, R7, #1
BNE	L_fingerprint_display_image24
NOP
NOP
NOP
;fingerprint.c,60 :: 		CS_PIN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,61 :: 		delay_ms(20);
MOVW	R7, #43391
MOVT	R7, #3
NOP
NOP
L_fingerprint_display_image26:
SUBS	R7, R7, #1
BNE	L_fingerprint_display_image26
NOP
NOP
NOP
;fingerprint.c,62 :: 		TFT_CS = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TFT_CS+0)
MOVT	R0, #hi_addr(TFT_CS+0)
STR	R1, [R0, #0]
;fingerprint.c,63 :: 		TFT_Set_Address_Ptr(0,0);
MOVS	R1, #0
MOVS	R0, #0
MOVW	R4, #lo_addr(_TFT_Set_Address_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Set_Address_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
;fingerprint.c,66 :: 		for (temp_i = 0; temp_i < 240*320; temp_i++)
; temp_i start address is: 20 (R5)
MOVS	R5, #0
MOVS	R6, #0
; temp_i end address is: 20 (R5)
L_fingerprint_display_image28:
; temp_i start address is: 20 (R5)
SUBS	R0, R5, #76800
SBCS	R0, R6, #0
IT	CS
BCS	L_fingerprint_display_image29
;fingerprint.c,68 :: 		CS_PIN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,69 :: 		temp_spi_buffer = SPI_READ(FP_DUMMY);
STRD	R5, R6, [SP, #4]
MOVS	R0, #65
BL	_SPI_Read+0
;fingerprint.c,70 :: 		CS_PIN = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(CS_PIN+0)
MOVT	R1, #hi_addr(CS_PIN+0)
STR	R2, [R1, #0]
;fingerprint.c,71 :: 		tft_write_data_ptr(temp_spi_buffer);
UXTB	R0, R0
MOVW	R4, #lo_addr(_TFT_Write_Data_Ptr+0)
MOVT	R4, #hi_addr(_TFT_Write_Data_Ptr+0)
LDR	R4, [R4, #0]
BLX	R4
LDRD	R5, R6, [SP, #4]
;fingerprint.c,66 :: 		for (temp_i = 0; temp_i < 240*320; temp_i++)
ADDS	R5, R5, #1
ADC	R6, R6, #0
;fingerprint.c,72 :: 		}
; temp_i end address is: 20 (R5)
IT	AL
BAL	L_fingerprint_display_image28
L_fingerprint_display_image29:
;fingerprint.c,73 :: 		TFT_CS = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TFT_CS+0)
MOVT	R0, #hi_addr(TFT_CS+0)
STR	R1, [R0, #0]
;fingerprint.c,75 :: 		}
L_end_fingerprint_display_image:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _fingerprint_display_image
_fingerprint_end_image_transfer:
;fingerprint.c,77 :: 		void fingerprint_end_image_transfer()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;fingerprint.c,81 :: 		CS_PIN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,82 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_fingerprint_end_image_transfer31:
SUBS	R7, R7, #1
BNE	L_fingerprint_end_image_transfer31
NOP
NOP
NOP
;fingerprint.c,83 :: 		Spi_Write(FP_END_IMG_TRANSFER);
MOVS	R0, #52
BL	_SPI_Write+0
;fingerprint.c,84 :: 		delay_ms(20);
MOVW	R7, #43391
MOVT	R7, #3
NOP
NOP
L_fingerprint_end_image_transfer33:
SUBS	R7, R7, #1
BNE	L_fingerprint_end_image_transfer33
NOP
NOP
NOP
;fingerprint.c,85 :: 		CS_PIN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,86 :: 		delay_ms(20);
MOVW	R7, #43391
MOVT	R7, #3
NOP
NOP
L_fingerprint_end_image_transfer35:
SUBS	R7, R7, #1
BNE	L_fingerprint_end_image_transfer35
NOP
NOP
NOP
;fingerprint.c,87 :: 		temp_spi_buffer= 0;
; temp_spi_buffer start address is: 0 (R0)
MOVS	R0, #0
; temp_spi_buffer end address is: 0 (R0)
;fingerprint.c,89 :: 		while ( temp_spi_buffer != FP_DUMMY )
L_fingerprint_end_image_transfer37:
; temp_spi_buffer start address is: 0 (R0)
CMP	R0, #65
IT	EQ
BEQ	L_fingerprint_end_image_transfer38
; temp_spi_buffer end address is: 0 (R0)
;fingerprint.c,91 :: 		CS_PIN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,92 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_fingerprint_end_image_transfer39:
SUBS	R7, R7, #1
BNE	L_fingerprint_end_image_transfer39
NOP
NOP
NOP
;fingerprint.c,93 :: 		temp_spi_buffer = SPI_Read(FP_DUMMY);
MOVS	R0, #65
BL	_SPI_Read+0
;fingerprint.c,94 :: 		temp_spi_buffer = SPI_Read(FP_DUMMY);
MOVS	R0, #65
BL	_SPI_Read+0
; temp_spi_buffer start address is: 8 (R2)
UXTB	R2, R0
;fingerprint.c,95 :: 		CS_PIN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,96 :: 		delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_fingerprint_end_image_transfer41:
SUBS	R7, R7, #1
BNE	L_fingerprint_end_image_transfer41
NOP
NOP
NOP
;fingerprint.c,97 :: 		}
UXTB	R0, R2
; temp_spi_buffer end address is: 8 (R2)
IT	AL
BAL	L_fingerprint_end_image_transfer37
L_fingerprint_end_image_transfer38:
;fingerprint.c,99 :: 		}
L_end_fingerprint_end_image_transfer:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _fingerprint_end_image_transfer
_fingerprint_reset_default:
;fingerprint.c,101 :: 		void fingerprint_reset_default()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;fingerprint.c,104 :: 		CS_PIN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,105 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_fingerprint_reset_default43:
SUBS	R7, R7, #1
BNE	L_fingerprint_reset_default43
NOP
NOP
NOP
;fingerprint.c,106 :: 		Spi_Write(FP_RESET_DEFAULT);
MOVS	R0, #48
BL	_SPI_Write+0
;fingerprint.c,107 :: 		delay_ms(20);
MOVW	R7, #43391
MOVT	R7, #3
NOP
NOP
L_fingerprint_reset_default45:
SUBS	R7, R7, #1
BNE	L_fingerprint_reset_default45
NOP
NOP
NOP
;fingerprint.c,108 :: 		CS_PIN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,109 :: 		delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_fingerprint_reset_default47:
SUBS	R7, R7, #1
BNE	L_fingerprint_reset_default47
NOP
NOP
NOP
;fingerprint.c,111 :: 		temp_spi_buffer= 0;
; temp_spi_buffer start address is: 0 (R0)
MOVS	R0, #0
; temp_spi_buffer end address is: 0 (R0)
;fingerprint.c,113 :: 		while ( temp_spi_buffer != 1 )
L_fingerprint_reset_default49:
; temp_spi_buffer start address is: 0 (R0)
CMP	R0, #1
IT	EQ
BEQ	L_fingerprint_reset_default50
; temp_spi_buffer end address is: 0 (R0)
;fingerprint.c,115 :: 		CS_PIN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,116 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_fingerprint_reset_default51:
SUBS	R7, R7, #1
BNE	L_fingerprint_reset_default51
NOP
NOP
NOP
;fingerprint.c,117 :: 		temp_spi_buffer = SPI_Read(FP_DUMMY);
MOVS	R0, #65
BL	_SPI_Read+0
;fingerprint.c,118 :: 		temp_spi_buffer = SPI_Read(FP_DUMMY);
MOVS	R0, #65
BL	_SPI_Read+0
; temp_spi_buffer start address is: 8 (R2)
UXTB	R2, R0
;fingerprint.c,119 :: 		CS_PIN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(CS_PIN+0)
MOVT	R0, #hi_addr(CS_PIN+0)
STR	R1, [R0, #0]
;fingerprint.c,120 :: 		delay_ms(1000);
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_fingerprint_reset_default53:
SUBS	R7, R7, #1
BNE	L_fingerprint_reset_default53
NOP
NOP
NOP
;fingerprint.c,121 :: 		}
UXTB	R0, R2
; temp_spi_buffer end address is: 8 (R2)
IT	AL
BAL	L_fingerprint_reset_default49
L_fingerprint_reset_default50:
;fingerprint.c,122 :: 		}
L_end_fingerprint_reset_default:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _fingerprint_reset_default
