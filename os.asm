;;; adapted from code by Amir Roth; CJT Oct 17, 2010
;;; modified 2/2013 - tjf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; OS Code ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .OS
    .CODE
    .ADDR x8000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; TRAP VECTOR TABLE ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    JMP TRAP_GETC     ; x00
    JMP TRAP_PUTC     ; x01
    JMP TRAP_DRAW_H_LINE ; x02
    JMP BAD_TRAP      ; x03
    JMP BAD_TRAP      ; x04
    JMP BAD_TRAP      ; x05
    JMP BAD_TRAP      ; x06
    JMP BAD_TRAP      ; x07
    JMP TRAP_PUTS     ; x08
    JMP BAD_TRAP      ; x09
    JMP TRAP_DRAW_BOX ; x0A
    JMP BAD_TRAP      ; x0B
    JMP BAD_TRAP      ; x0C
    JMP BAD_TRAP      ; x0D
    JMP BAD_TRAP      ; x0E
    JMP BAD_TRAP      ; x0F
    JMP BAD_TRAP      ; x10
    JMP BAD_TRAP      ; x11
    JMP BAD_TRAP      ; x12
    JMP BAD_TRAP      ; x13
    JMP BAD_TRAP      ; x14
    JMP BAD_TRAP      ; x15
    JMP BAD_TRAP      ; x16
    JMP BAD_TRAP      ; x17
    JMP BAD_TRAP      ; x18
    JMP BAD_TRAP      ; x19
    JMP BAD_TRAP      ; x1A
    JMP BAD_TRAP      ; x1B
    JMP BAD_TRAP      ; x1C
    JMP BAD_TRAP      ; x1D
    JMP BAD_TRAP      ; x1E
    JMP BAD_TRAP      ; x1F
    JMP BAD_TRAP      ; x20
    JMP BAD_TRAP      ; x21
    JMP BAD_TRAP      ; x22
    JMP BAD_TRAP      ; x23
    JMP BAD_TRAP      ; x24
    JMP TRAP_HALT     ; x25
    JMP BAD_TRAP      ; x26
    JMP BAD_TRAP      ; x27
    JMP BAD_TRAP      ; x28
    JMP BAD_TRAP      ; x29
    JMP BAD_TRAP      ; x2A
    JMP BAD_TRAP      ; x2B
    JMP BAD_TRAP      ; x2C
    JMP BAD_TRAP      ; x2D
    JMP BAD_TRAP      ; x2E
    JMP BAD_TRAP      ; x2F
    JMP BAD_TRAP      ; x30
    JMP BAD_TRAP      ; x31
    JMP BAD_TRAP      ; x32
    JMP BAD_TRAP      ; x33
    JMP BAD_TRAP      ; x34
    JMP BAD_TRAP      ; x35
    JMP BAD_TRAP      ; x36
    JMP BAD_TRAP      ; x37
    JMP BAD_TRAP      ; x38
    JMP BAD_TRAP      ; x39
    JMP BAD_TRAP      ; x3A
    JMP BAD_TRAP      ; x3B
    JMP BAD_TRAP      ; x3C
    JMP BAD_TRAP      ; x3D
    JMP BAD_TRAP      ; x3E
    JMP BAD_TRAP      ; x3F
    JMP BAD_TRAP      ; x40
    JMP BAD_TRAP      ; x41
    JMP BAD_TRAP      ; x42
    JMP BAD_TRAP      ; x43
    JMP BAD_TRAP      ; x44
    JMP BAD_TRAP      ; x45
    JMP BAD_TRAP      ; x46
    JMP BAD_TRAP      ; x47
    JMP BAD_TRAP      ; x48
    JMP BAD_TRAP      ; x49
    JMP BAD_TRAP      ; x4A
    JMP BAD_TRAP      ; x4B
    JMP BAD_TRAP      ; x4C
    JMP BAD_TRAP      ; x4D
    JMP BAD_TRAP      ; x4E
    JMP BAD_TRAP      ; x4F
    JMP BAD_TRAP      ; x50
    JMP BAD_TRAP      ; x51
    JMP BAD_TRAP      ; x52
    JMP BAD_TRAP      ; x53
    JMP BAD_TRAP      ; x54
    JMP BAD_TRAP      ; x55
    JMP BAD_TRAP      ; x56
    JMP BAD_TRAP      ; x57
    JMP BAD_TRAP      ; x58
    JMP BAD_TRAP      ; x59
    JMP BAD_TRAP      ; x5A
    JMP BAD_TRAP      ; x5B
    JMP BAD_TRAP      ; x5C
    JMP BAD_TRAP      ; x5D
    JMP BAD_TRAP      ; x5E
    JMP BAD_TRAP      ; x5F
    JMP BAD_TRAP      ; x60
    JMP BAD_TRAP      ; x61
    JMP BAD_TRAP      ; x62
    JMP BAD_TRAP      ; x63
    JMP BAD_TRAP      ; x64
    JMP BAD_TRAP      ; x65
    JMP BAD_TRAP      ; x66
    JMP BAD_TRAP      ; x67
    JMP BAD_TRAP      ; x68
    JMP BAD_TRAP      ; x69
    JMP BAD_TRAP      ; x6A
    JMP BAD_TRAP      ; x6B
    JMP BAD_TRAP      ; x6C
    JMP BAD_TRAP      ; x6D
    JMP BAD_TRAP      ; x6E
    JMP BAD_TRAP      ; x6F
    JMP BAD_TRAP      ; x70
    JMP BAD_TRAP      ; x71
    JMP BAD_TRAP      ; x72
    JMP BAD_TRAP      ; x73
    JMP BAD_TRAP      ; x74
    JMP BAD_TRAP      ; x75
    JMP BAD_TRAP      ; x76
    JMP BAD_TRAP      ; x77
    JMP BAD_TRAP      ; x78
    JMP BAD_TRAP      ; x79
    JMP BAD_TRAP      ; x7A
    JMP BAD_TRAP      ; x7B
    JMP BAD_TRAP      ; x7C
    JMP BAD_TRAP      ; x7D
    JMP BAD_TRAP      ; x7E
    JMP BAD_TRAP      ; x7F
    JMP BAD_TRAP      ; x80
    JMP BAD_TRAP      ; x81
    JMP BAD_TRAP      ; x82
    JMP BAD_TRAP      ; x83
    JMP BAD_TRAP      ; x84
    JMP BAD_TRAP      ; x85
    JMP BAD_TRAP      ; x86
    JMP BAD_TRAP      ; x87
    JMP BAD_TRAP      ; x88
    JMP BAD_TRAP      ; x89
    JMP BAD_TRAP      ; x8A
    JMP BAD_TRAP      ; x8B
    JMP BAD_TRAP      ; x8C
    JMP BAD_TRAP      ; x8D
    JMP BAD_TRAP      ; x8E
    JMP BAD_TRAP      ; x8F
    JMP BAD_TRAP      ; x90
    JMP BAD_TRAP      ; x91
    JMP BAD_TRAP      ; x92
    JMP BAD_TRAP      ; x93
    JMP BAD_TRAP      ; x94
    JMP BAD_TRAP      ; x95
    JMP BAD_TRAP      ; x96
    JMP BAD_TRAP      ; x97
    JMP BAD_TRAP      ; x98
    JMP BAD_TRAP      ; x99
    JMP BAD_TRAP      ; x9A
    JMP BAD_TRAP      ; x9B
    JMP BAD_TRAP      ; x9C
    JMP BAD_TRAP      ; x9D
    JMP BAD_TRAP      ; x9E
    JMP BAD_TRAP      ; x9F
    JMP BAD_TRAP      ; xA0
    JMP BAD_TRAP      ; xA1
    JMP BAD_TRAP      ; xA2
    JMP BAD_TRAP      ; xA3
    JMP BAD_TRAP      ; xA4
    JMP BAD_TRAP      ; xA5
    JMP BAD_TRAP      ; xA6
    JMP BAD_TRAP      ; xA7
    JMP BAD_TRAP      ; xA8
    JMP BAD_TRAP      ; xA9
    JMP BAD_TRAP      ; xAA
    JMP BAD_TRAP      ; xAB
    JMP BAD_TRAP      ; xAC
    JMP BAD_TRAP      ; xAD
    JMP BAD_TRAP      ; xAE
    JMP BAD_TRAP      ; xAF
    JMP BAD_TRAP      ; xB0
    JMP BAD_TRAP      ; xB1
    JMP BAD_TRAP      ; xB2
    JMP BAD_TRAP      ; xB3
    JMP BAD_TRAP      ; xB4
    JMP BAD_TRAP      ; xB5
    JMP BAD_TRAP      ; xB6
    JMP BAD_TRAP      ; xB7
    JMP BAD_TRAP      ; xB8
    JMP BAD_TRAP      ; xB9
    JMP BAD_TRAP      ; xBA
    JMP BAD_TRAP      ; xBB
    JMP BAD_TRAP      ; xBC
    JMP BAD_TRAP      ; xBD
    JMP BAD_TRAP      ; xBE
    JMP BAD_TRAP      ; xBF
    JMP BAD_TRAP      ; xC0
    JMP BAD_TRAP      ; xC1
    JMP BAD_TRAP      ; xC2
    JMP BAD_TRAP      ; xC3
    JMP BAD_TRAP      ; xC4
    JMP BAD_TRAP      ; xC5
    JMP BAD_TRAP      ; xC6
    JMP BAD_TRAP      ; xC7
    JMP BAD_TRAP      ; xC8
    JMP BAD_TRAP      ; xC9
    JMP BAD_TRAP      ; xCA
    JMP BAD_TRAP      ; xCB
    JMP BAD_TRAP      ; xCC
    JMP BAD_TRAP      ; xCD
    JMP BAD_TRAP      ; xCE
    JMP BAD_TRAP      ; xCF
    JMP BAD_TRAP      ; xD0
    JMP BAD_TRAP      ; xD1
    JMP BAD_TRAP      ; xD2
    JMP BAD_TRAP      ; xD3
    JMP BAD_TRAP      ; xD4
    JMP BAD_TRAP      ; xD5
    JMP BAD_TRAP      ; xD6
    JMP BAD_TRAP      ; xD7
    JMP BAD_TRAP      ; xD8
    JMP BAD_TRAP      ; xD9
    JMP BAD_TRAP      ; xDA
    JMP BAD_TRAP      ; xDB
    JMP BAD_TRAP      ; xDC
    JMP BAD_TRAP      ; xDD
    JMP BAD_TRAP      ; xDE
    JMP BAD_TRAP      ; xDF
    JMP BAD_TRAP      ; xE0
    JMP BAD_TRAP      ; xE1
    JMP BAD_TRAP      ; xE2
    JMP BAD_TRAP      ; xE3
    JMP BAD_TRAP      ; xE4
    JMP BAD_TRAP      ; xE5
    JMP BAD_TRAP      ; xE6
    JMP BAD_TRAP      ; xE7
    JMP BAD_TRAP      ; xE8
    JMP BAD_TRAP      ; xE9
    JMP BAD_TRAP      ; xEA
    JMP BAD_TRAP      ; xEB
    JMP BAD_TRAP      ; xEC
    JMP BAD_TRAP      ; xED
    JMP BAD_TRAP      ; xEE
    JMP BAD_TRAP      ; xEF
    JMP BAD_TRAP      ; xF0
    JMP BAD_TRAP      ; xF1
    JMP BAD_TRAP      ; xF2
    JMP BAD_TRAP      ; xF3
    JMP BAD_TRAP      ; xF4
    JMP BAD_TRAP      ; xF5
    JMP BAD_TRAP      ; xF6
    JMP BAD_TRAP      ; xF7
    JMP BAD_TRAP      ; xF8
    JMP BAD_TRAP      ; xF9
    JMP BAD_TRAP      ; xFA
    JMP BAD_TRAP      ; xFB
    JMP BAD_TRAP      ; xFC
    JMP BAD_TRAP      ; xFD
    JMP BAD_TRAP      ; xFE
    JMP BAD_TRAP      ; xFF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; OS MEMORY ADDRESS CONSTANTS ;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

USER_CODE_ADDR  .UCONST x0000
OS_CODE_ADDR    .UCONST x8000

OS_GLOBALS_ADDR .UCONST xA000
OS_STACK_ADDR   .UCONST xBFFF
OS_VIDEO_ADDR   .UCONST xC000

OS_KBSR_ADDR    .UCONST xFE00 ; keyboard status register
OS_KBDR_ADDR    .UCONST xFE02 ; keyboard data register
OS_ADSR_ADDR    .UCONST xFE04 ; display status register
OS_ADDR_ADDR    .UCONST xFE06 ; display data register
OS_TSR_ADDR     .UCONST xFE08 ; timer register
OS_TIR_ADDR     .UCONST xFE0A ; timer interval register
OS_VDCR_ADDR    .UCONST xFE0C ; video display control register
OS_MCR_ADDR     .UCONST xFFEE ; machine control register

TIM_INIT        .UCONST #320

MASK_L15        .UCONST x7FFF
MASK_H4         .UCONST xF000
MASK_H1         .UCONST x8000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; OS VIDEO MEMORY ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .DATA
    .ADDR xC000

OS_VIDEO_MEM .BLKW x3E00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; OS GLOBALS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .DATA
    .ADDR xA000

OS_GLOBALS_MEM    .BLKW x1000

OS_VIDEO_NUM_COLS .UCONST #128
OS_VIDEO_NUM_ROWS .UCONST #124

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; OS START ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; operating system entry point (always starts at x8200) ;;;;

    .CODE
    .ADDR x8200

OS_START
    LC R7, USER_CODE_ADDR ; R7 = User code address (x0000)
    RTI                   ; RTI removes the privilege bit

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; BAD TRAP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; BAD_TRAP - code to execute for undefined trap ;;;;;;;;;

    .CODE

BAD_TRAP
    JMP TRAP_HALT ; execute HALT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; TRAP_HALT ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; TRAP_HALT - halts the program and jumps to OS_START ;;;;;;

    .CODE

TRAP_HALT
    LC R3, OS_MCR_ADDR ; clear run bit in MCR
    LDR R0, R3, #0
    LC R1, MASK_L15
    AND R0, R0, R1
    STR R0, R3, #0
    JMP OS_START       ; restart machine

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; TRAP_GETC ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TRAP_GETC - Check for a character from the keyboard
;;; Inputs    - none
;;; Outputs   - R5 = value of character read from the keyboard

    .CODE

TRAP_GETC

    LC R0, OS_KBSR_ADDR
    LDR R1, R0, #0      ; Read the KBSR into R1
    BRzp TRAP_GETC      ; Loop while the MSB is zero

    LC R0, OS_KBDR_ADDR
    LDR R5, R0, #0      ; Read the character into R5

    RTI

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; TRAP_PUTC ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TRAP_PUTC - Put a character on the console
;;; Inputs    - R0 = ASCII caharacter value to output to display
;;; Outputs   - none

    .CODE

TRAP_PUTC

    LC R1, OS_ADSR_ADDR
    LDR R2, R1, #0
    BRzp TRAP_PUTC      ; Loop while the MSB is zero

    LC R1, OS_ADDR_ADDR
    STR R0, R1, #0      ; Write out the character

    RTI

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; TRAP_PUTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TRAP_PUTS - writes a null-terminated string to ASCII display
;;; Inputs    - R0 = address of first character in string
;;; Outputs   - none

    .CODE

TRAP_PUTS

TRAP_PUTS____CHAR_LOOP
    LDR R1, R0, #0
    BRz TRAP_PUTS____END

TRAP_PUTS____ADSR_LOOP
    LC R2, OS_ADSR_ADDR
    LDR R2, R2, #0
    BRzp TRAP_PUTS____ADSR_LOOP
    LC R2, OS_ADDR_ADDR
    STR R1, R2, #0
    ADD R0, R0, #1              ; go to next character
    JMP TRAP_PUTS____CHAR_LOOP

TRAP_PUTS____END
    RTI

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; TRAP_DRAW_H_LINE ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TRAP_DRAW_H_LINE - Draw horizontal line on the video display
;;; Inputs           - R0 = row to draw on
;;;                  - R1 = column address 1
;;;                  - R2 = column address 2
;;;                  - R3 = color to draw with
;;; Outputs          - none

    .CODE

TRAP_DRAW_H_LINE

;;; First we figure out whether R1 or R2 is larger - they should both be 0-127
    CMP R1, R2
    BRnz NO_SWAP_H

;;; Swap R1 and R2 using R4
    ADD R4, R1, #0
    ADD R1, R2, #0
    ADD R2, R4, #0

;;; Now R1 <= R2

NO_SWAP_H
    LEA R4, OS_VIDEO_MEM
    LC R5, OS_VIDEO_NUM_COLS

    MUL R5, R0, R5           ; Compute (row * NUM_COLS)
    ADD R5, R5, R1           ; Compute (row * NUM_COLS) + col
    ADD R4, R4, R5           ; Add the offset to the start of video memory

R1_LE_R2_H
    STR R3, R4, #0           ; Fill in the pixel
    ADD R4, R4, #1           ; Update the pixel address
    ADD R1, R1, #1           ; Update R1

    CMP R1, R2               ; Test whether R1 <= R2
    BRnz R1_LE_R2_H

	RTI

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;; TRAP_DRAW_BOX ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TRAP_DRAW_BOX - draws a multicolor box on the screen
;;; Inputs        - R0 = x coordinate, upper-left corner of box
;;;               - R1 = y coordinate, upper-left corner of box
;;;               - R2 = length of the side of the box
;;;               - R3 = starting address in memory that lists 
;;;                      colors for each pixel in the box
;;; Outputs       - none

    .CODE

TRAP_DRAW_BOX

TRAP_DRAW_BOX____INITIALIZATION
    MUL R4, R2, R2                  ; i = length * length

TRAP_DRAW_BOX____MAIN_LOOP
    CMPI R4, #0
    BRz TRAP_DRAW_BOX____END        ; if i == 0, return

    CMPI R0, #0
    BRn TRAP_DRAW_BOX____LOOP_END   ; if x < 0, goto LOOP_END
    CMPI R1, #0
    BRn TRAP_DRAW_BOX____LOOP_END   ; if y < 0, goto LOOP_END
    LC R5, OS_VIDEO_NUM_COLS
    CMP R0, R5
    BRzp TRAP_DRAW_BOX____LOOP_END  ; if x >= NUM_COLS, goto LOOP_END
    LC R5, OS_VIDEO_NUM_ROWS
    CMP R1, R5
    BRzp TRAP_DRAW_BOX____LOOP_END  ; if y >= NUM_ROWS, goto LOOP_END

    LEA R6, OS_VIDEO_MEM            ; R6 = VIDEO_MEMORY_OFFSET
    LC R5, OS_VIDEO_NUM_COLS        ; temp = NUM_COLS
    MUL R5, R1, R5                  ; temp = y * temp
    ADD R5, R5, R0                  ; temp = temp + x
    ADD R5, R5, R6                  ; temp = temp + VIDEO_MEMORY_OFFSET

    LDR R6, R3, #0                  ; color = mem[address]
    STR R6, R5, #0                  ; mem[temp] = color

TRAP_DRAW_BOX____LOOP_END
    ADD R4, R4, #-1                 ; i = i - 1
    ADD R3, R3, #1                  ; address = address + 1

    ADD R0, R0, #1                  ; x = x + 1

    MOD R5, R4, R2                  ; temp = i mod length
    CMPI R5, #0
    BRnp TRAP_DRAW_BOX____MAIN_LOOP ; if temp != 0, goto MAIN_LOOP

    ADD R1, R1, #1                  ; y = y + 1
    SUB R0, R0, R2                  ; x = x - length

    JMP TRAP_DRAW_BOX____MAIN_LOOP  ; goto MAIN_LOOP

TRAP_DRAW_BOX____END
    RTI