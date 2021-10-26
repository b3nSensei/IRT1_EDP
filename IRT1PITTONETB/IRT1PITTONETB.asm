
_main:

	MOVLW      3
	MOVWF      TRISA+0
	CLRF       PORTA+0
	CLRF       TRISB+0
	CLRF       PORTB+0
	BSF        PCON+0, 3
	MOVLW      7
	MOVWF      CMCON+0
L_main0:
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main3
	MOVLW      1
	MOVWF      PORTB+0
	BCF        RA3_bit+0, BitPos(RA3_bit+0)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main5
	BCF        RA6_bit+0, BitPos(RA6_bit+0)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main7
	BCF        RA7_bit+0, BitPos(RA7_bit+0)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	CALL       _permanent+0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
L_main7:
	CALL       _cycle+0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
L_main5:
	CALL       _ledParLed+0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
L_main3:
	BSF        RA3_bit+0, BitPos(RA3_bit+0)
	BSF        RA6_bit+0, BitPos(RA6_bit+0)
	BSF        RA7_bit+0, BitPos(RA7_bit+0)
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main

_ledParLed:

L_ledParLed12:
	MOVF       PORTB+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_ledParLed13
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_ledParLed16
	MOVLW      128
	SUBWF      PORTB+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_ledParLed16
L__ledParLed37:
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
L_ledParLed16:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      95
	MOVWF      R12+0
	MOVLW      163
	MOVWF      R13+0
L_ledParLed17:
	DECFSZ     R13+0, 1
	GOTO       L_ledParLed17
	DECFSZ     R12+0, 1
	GOTO       L_ledParLed17
	DECFSZ     R11+0, 1
	GOTO       L_ledParLed17
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_ledParLed20
	MOVF       PORTB+0, 0
	XORLW      128
	BTFSS      STATUS+0, 2
	GOTO       L_ledParLed20
L__ledParLed36:
	CLRF       PORTB+0
L_ledParLed20:
	GOTO       L_ledParLed12
L_ledParLed13:
L_end_ledParLed:
	RETURN
; end of _ledParLed

_cycle:

L_cycle21:
	MOVF       PORTB+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_cycle22
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_cycle23:
	DECFSZ     R13+0, 1
	GOTO       L_cycle23
	DECFSZ     R12+0, 1
	GOTO       L_cycle23
	DECFSZ     R11+0, 1
	GOTO       L_cycle23
	NOP
	NOP
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	MOVF       PORTB+0, 0
	SUBLW      128
	BTFSC      STATUS+0, 0
	GOTO       L_cycle24
	MOVLW      1
	MOVWF      PORTB+0
L_cycle24:
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_cycle25
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_cycle26:
	DECFSZ     R13+0, 1
	GOTO       L_cycle26
	DECFSZ     R12+0, 1
	GOTO       L_cycle26
	DECFSZ     R11+0, 1
	GOTO       L_cycle26
	NOP
	NOP
L_cycle27:
	BTFSS      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_cycle28
	GOTO       L_cycle27
L_cycle28:
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_cycle29:
	DECFSZ     R13+0, 1
	GOTO       L_cycle29
	DECFSZ     R12+0, 1
	GOTO       L_cycle29
	DECFSZ     R11+0, 1
	GOTO       L_cycle29
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_cycle30
	CLRF       PORTB+0
L_cycle30:
L_cycle25:
	GOTO       L_cycle21
L_cycle22:
L_end_cycle:
	RETURN
; end of _cycle

_permanent:

L_permanent31:
	MOVF       PORTB+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_permanent32
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_permanent33:
	DECFSZ     R13+0, 1
	GOTO       L_permanent33
	DECFSZ     R12+0, 1
	GOTO       L_permanent33
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	MOVF       PORTB+0, 0
	SUBLW      128
	BTFSC      STATUS+0, 0
	GOTO       L_permanent34
	MOVLW      1
	MOVWF      PORTB+0
L_permanent34:
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_permanent35
	CLRF       PORTB+0
L_permanent35:
	GOTO       L_permanent31
L_permanent32:
L_end_permanent:
	RETURN
; end of _permanent
