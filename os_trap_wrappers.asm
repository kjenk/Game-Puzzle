;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Description: 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; This file has 3 big jobs: 
;;; 1) It partitions USER memory
;;; 2) It ensures a LABEL called: main
;;;    will be the first function PennSim should jump
;;;    to when PennSim starts executing code.
;;;    NOT a coincidence that we call our 1st function
;;;    in C: main ()
;;; 3) It defines "wrapper" subroutines for the TRAPS
;;;    in os.asm.  The purpose of which is to provide
;;;    a standard way of passing arguments to and from 
;;;    the TRAPS in os.asm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; 1) Setup USER Memory ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;; Declaration of Constants ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

USER_STACK_ADDR .UCONST x7FFF
USER_STACK_SIZE .UCONST x1000
USER_HEAP_SIZE  .UCONST x3000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; Data ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.DATA

;;; Reserve space for the heap and the stack so that the assembler will not try
;;; to place data in these regions.

.ADDR x4000
USER_HEAP .BLKW x3000

.ADDR x7000            
USER_STACK .BLKW x1000

;;; Reserve space to store the user stack pointer so that it can be retrieved
;;; after a trap call.

.ADDR x2000
TEMP_USER_STACK_ADDR .BLKW x1

;;; The following directive sets things up so that subsequent user globals will
;;; be stored in the right place.

.ADDR x2001

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; Code ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
.CODE
.ADDR x0000    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; 2) JUMP to MAIN subroutine ;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
USER_START
    LC R6, USER_STACK_ADDR    ; initialize the stack pointer
    LEA R7, main
    JSRR R7                   ; invoke the main routine
    TRAP x25                  ; call TRAP_HALT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;; 3) Wrappers for Traps ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_GETC Wrapper ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_getc

;; prologue

    ADD R6, R6, #-3    
    STR R5, R6, #0
    STR R7, R6, #1

;; trap call

    LEA R4, TEMP_USER_STACK_ADDR
    STR R6, R4, #0               ; save user stack pointer

    TRAP x00                     ; call TRAP_GETC

    LEA R4, TEMP_USER_STACK_ADDR
    LDR R6, R4, #0               ; restore user stack pointer

    STR R5, R6, #2               ; store return value in user stack

;; epilogue

    LDR R7, R6, #1
    LDR R5, R6, #0
    ADD R6, R6, #3

;; return

    RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_PUTC Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_putc

;; prologue

    ADD R6, R6, #-3
    STR R5, R6, #0
    STR R7, R6, #1

;; marshall arguments

    LDR R0, R6, #3

;; trap call

    LEA R4, TEMP_USER_STACK_ADDR
    STR R6, R4, #0               ; save user stack pointer

    TRAP x01                     ; call TRAP_PUTC

    LEA R4, TEMP_USER_STACK_ADDR
    LDR R6, R4, #0               ; restore user stack pointer

;; epilogue

    LDR R7, R6, #1
    LDR R5, R6, #0
    ADD R6, R6, #3

;; return

    RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; TRAP_PUTS Wrapper ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
	
lc4_puts

;;
;; TO DO: Add code to invoke TRAP_PUTS
;;

	
;; prologue

    ADD R6, R6, #-3
    STR R5, R6, #0
    STR R7, R6, #1

;; marshall arguments

    LDR R0, R6, #3

;; trap call

    LEA R4, TEMP_USER_STACK_ADDR
    STR R6, R4, #0               ; save user stack pointer

    TRAP x08                     ; call TRAP_PUTS

    LEA R4, TEMP_USER_STACK_ADDR
    LDR R6, R4, #0               ; restore user stack pointer

;; epilogue

    LDR R7, R6, #1
    LDR R5, R6, #0
    ADD R6, R6, #3

;; return
	
    RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TRAP_DRAW_BOX Wrapper ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.FALIGN
lc4_draw_box

;; prologue

    ADD R6, R6, #-3
    STR R5, R6, #0
    STR R7, R6, #1

;; marshall arguments

    LDR R0, R6, #3
    LDR R1, R6, #4
    LDR R2, R6, #5
    LDR R3, R6, #6

;; trap call

    LEA R4, TEMP_USER_STACK_ADDR
    STR R6, R4, #0               ; save user stack pointer

    TRAP x0A                     ; call TRAP_DRAW_BOX

    LEA R4, TEMP_USER_STACK_ADDR
    LDR R6, R4, #0               ; restore user stack pointer

;; epilogue

    LDR R7, R6, #1
    LDR R5, R6, #0
    ADD R6, R6, #3

;; return

    RET