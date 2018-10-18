	AREA    |.text|, CODE, READONLY

      EXPORT  asm_main
      IMPORT  Ext_Debug_Init	
      IMPORT  SystemClock_Config
	  IMPORT memcpy
		 
		  
;resetReg		 	RN 8
;setReg			 	RN 9
;addressPortF		RN 10


asm_main PROC
	bl SystemClock_Config		;enable 216MHz
	ldr r0, =0xE000E010			;load the address of the timer interrupt register 
	mov r1, #0					
	str r1, [r0]				;disable the interrupt of the timer
	;mov resetReg, #0x00
	;mov setReg, #0x200
	;ldr addressPortF,=0x40021414
	
	bl  Ext_Debug_Init
	mov r0, #0x00
	ldr r1, =0x40021414
	str r0, [r1]
loop 
	mov r0, #0x200
	ldr r1, =0x40021414
	str r0, [r1]
    ldr    r4,=TableA
    ldr    r5,=TableB
    mov    r6,#TableB-TableA
copy
	;bl memcpy	;task5
	
    ;ldrb   r7,[r4],#1	;task 1
    ;strb   r7,[r5],#1	;task 1
	;ldr	r7,[r4],#4	;task 2
	;str	r7,[r5],#4	;task 2
	
	ldrd	r7, r11, [r4],#8		;task 3.1
	strd	r7, r11, [r5],#8		;task 3.1
	;ldm	r4!, {r0-r3, r7-r11}	;task 3.2
	;stm	r5!, {r0-r3, r7-r11}	;task 3.2
    subs   r6,r6,#8
    bne    copy
	
	mov r0, #0x00
	ldr r1, =0x40021414
	str r0, [r1]
    b    loop
    ENDP
	
;-------------------------------------------------------------------
; data section 
;-------------------------------------------------------------------
	AREA  |.data|, DATA, READWRITE, ALIGN=4
TableA		DCB 	"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
			DCB 	"abcdefghijklmnopqrstuvwxyz+-.,<>()/#"
endTableA
TableB		SPACE   endTableA-TableA
	END