; EXTERNAL DEPENDENCIES
INCLUDE		Irvine32.inc
INCLUDELIB	Irvine32.lib

; EXECUTION MODE PARAMETERS
.386
.model flat, stdcall
.stack 4096

; PROTOTYPES
ExitProcess PROTO, dwExitCode:DWORD

; DATA SEGMENT - declare my variables
.data
    ; Part 1 Labels (matching exact output format)
    part1_title BYTE "Part 1:",0dh,0ah,0
    count1_label BYTE "Counting 1 to 10 in base-10...",0dh,0ah,0
    count2_label BYTE "Counting 1 to 17 in base-2...",0dh,0ah,0
    count3_label BYTE "Counting 1 to 17 in base-16...",0dh,0ah,0
    count4_label BYTE "Counting 1 to 39 in base-10 showing only odd numbers...",0dh,0ah,0
    
    ; Part 2 Data
    part2_title BYTE "Part 2:",0dh,0ah,0dh,0ah,0
    eax_state1 BYTE "EAX state 1:",0dh,0ah,0dh,0ah,0
    eax_state2 BYTE "EAX state 2:",0dh,0ah,0dh,0ah,0
    eax_state3 BYTE "EAX state 3:",0dh,0ah,0dh,0ah,0
    eax_state4 BYTE "EAX state 4:",0dh,0ah,0dh,0ah,0
    eax_state5 BYTE "EAX state 5:",0dh,0ah,0dh,0ah,0
    eax_state6 BYTE "EAX state 6:",0dh,0ah,0dh,0ah,0
    
    ; Binary pattern data (only sequential 1s or 0s as required)
    all_zeros DWORD 00000000h
    all_ones DWORD 0FFFFFFFFh
    lower_ones WORD 0FFFFh
    upper_zeros WORD 0000h
    middle_ones BYTE 0FFh
    middle_zeros BYTE 00h
    
    newline BYTE 0dh,0ah,0
    space BYTE " ",0

.code

; PROCEDURE: DisplayBinaryWithSpaces
; Displays binary value with spaces every 4 bits
DisplayBinaryWithSpaces PROC
    push ecx
    push edx
    
    mov ecx, 8        ; 8 groups of 4 bits
    mov edx, 0        ; Clear EDX for shifting
    
display_loop:
    rol eax, 4        ; Rotate left 4 bits
    mov edx, eax      ; Copy to EDX
    and edx, 0Fh      ; Isolate lowest 4 bits
    
    ; Display the 4 bits
    push eax
    mov eax, edx
    call WriteBinB    ; Write 4 bits
    pop eax
    
    ; Add space if not last group
    cmp ecx, 1
    je no_space
    mov edx, OFFSET space
    call WriteString
    
no_space:
    loop display_loop
    
    pop edx
    pop ecx
    ret
DisplayBinaryWithSpaces ENDP



DisplayRegisterState PROC
    call DumpRegs         ; Display register dump
    call Crlf
    
    ; Display hex value
    call WriteHex         ; Display EAX in hex
    call Crlf
    call Crlf
    
    ; Display binary with spaces
    call DisplayBinaryWithSpaces
    call Crlf
    call Crlf
    
    ret
DisplayRegisterState ENDP

main PROC
    ; PART 1
    
    
    mov edx, OFFSET part1_title
    call WriteString
    call Crlf

    ; COUNT 1: Base 10, 1 to 10
    mov edx, OFFSET count1_label
    call WriteString
    
    mov eax, 1
    call WriteDec
    call Crlf
    add eax, 1
    call WriteDec
    call Crlf
    add eax, 1
    call WriteDec
    call Crlf
    add eax, 1
    call WriteDec
    call Crlf
    add eax, 1
    call WriteDec
    call Crlf
    add eax, 1
    call WriteDec
    call Crlf
    add eax, 1
    call WriteDec
    call Crlf
    add eax, 1
    call WriteDec
    call Crlf
    add eax, 1
    call WriteDec
    call Crlf
    add eax, 1
    call WriteDec
    call Crlf
    
    call Crlf

    ; COUNT 2: Base 2, 1 to 17
    mov edx, OFFSET count2_label
    call WriteString
    
    mov eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    add eax, 1
    call DisplayBinaryWithSpaces
    call Crlf
    
    call Crlf

    ; COUNT 3: Base 16, 1 to 17 (8-digit format)
    mov edx, OFFSET count3_label
    call WriteString
    
    mov eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    add eax, 1
    call WriteHex
    call Crlf
    
    call Crlf

    ; COUNT 4: Base 10, odd numbers 1 to 39
    mov edx, OFFSET count4_label
    call WriteString
    
    mov eax, 1
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    add eax, 2
    call WriteDec
    call Crlf
    
    call Crlf

    ; PART 2
 
    
    mov edx, OFFSET part2_title
    call WriteString

    ; State 1: EAX = 00000000
    mov edx, OFFSET eax_state1
    call WriteString
    mov eax, [all_zeros]    ; Load all zeros
    call DisplayRegisterState

    ; State 2: EAX = FFFFFFFF
    mov edx, OFFSET eax_state2
    call WriteString
    mov eax, [all_ones]     ; Load all ones
    call DisplayRegisterState

    ; State 3: EAX = 00000000
    mov edx, OFFSET eax_state3
    call WriteString
    mov eax, [all_zeros]    ; Load all zeros again
    call DisplayRegisterState

    ; State 4: EAX = 0000FFFF
    mov edx, OFFSET eax_state4
    call WriteString
    mov eax, [all_zeros]    ; Start with zeros
    mov ax, [lower_ones]    ; Set lower 16 bits to ones
    call DisplayRegisterState

    ; State 5: EAX = 0000FF00
    mov edx, OFFSET eax_state5
    call WriteString
    mov eax, [all_zeros]    ; Start with zeros
    mov ah, [middle_ones]   ; Set bits 8-15 to ones
    call DisplayRegisterState

    ; State 6: EAX = FFFF00FF
    mov edx, OFFSET eax_state6
    call WriteString
    mov eax, [all_ones]     ; Start with all ones
    mov ah, [middle_zeros]  ; Clear bits 8-15 to zeros
    call DisplayRegisterState

    ; Exit program
    INVOKE ExitProcess, 0
main ENDP

END main
