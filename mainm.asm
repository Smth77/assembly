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
count1_start DB "Count 1: display base 10, count 1(10) to 10(10)",0dh,0ah,0
count1_end DB "End Count 1",0dh,0ah,0dh,0ah,0

count2_start DB "Count 2: display base 2, count 1(10) to 17(10)",0dh,0ah,0
count2_end DB "End Count 2",0dh,0ah,0dh,0ah,0

count3_start DB "Count 3: display base 16, count 1(10) to 17(10)",0dh,0ah,0
count3_end DB "End Count 3",0dh,0ah,0dh,0ah,0

count4_start DB "Count 4: display base 10, count 1(10) to 39(10), show only odd numbers",0dh,0ah,0
count4_end DB "End Count 4",0dh,0ah,0

newline DB 0dh,0ah,0

; CODE SEGMENT
.code
main PROC
    ;  COUNT 1: Base 10, 1 to 10 
    mov EDX, OFFSET count1_start
    call WriteString
    
    mov EAX, 1      ; Start value
    call WriteDec   ; Display 1
    call Crlf
    
    ADD EAX, 1      ; 2
    call WriteDec
    call Crlf
    
    ADD EAX, 1      ; 3
    call WriteDec
    call Crlf
    
    ADD EAX, 1      ; 4
    call WriteDec
    call Crlf
    
    ADD EAX, 1      ; 5
    call WriteDec
    call Crlf
    
    ADD EAX, 1      ; 6
    call WriteDec
    call Crlf
    
    ADD EAX, 1      ; 7
    call WriteDec
    call Crlf
    
    ADD EAX, 1      ; 8
    call WriteDec
    call Crlf
    
    ADD EAX, 1      ; 9
    call WriteDec
    call Crlf
    
    ADD EAX, 1      ; 10
    call WriteDec
    call Crlf
    
    mov EDX, OFFSET count1_end
    call WriteString

    ; === COUNT 2: Base 2, 1 to 17 ===
    mov EDX, OFFSET count2_start
    call WriteString
    
    mov EAX, 1      ; Start value
    call WriteBin   ; Display 1 in binary
    call Crlf
    
    ADD EAX, 1      ; 2
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 3
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 4
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 5
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 6
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 7
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 8
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 9
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 10
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 11
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 12
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 13
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 14
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 15
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 16
    call WriteBin
    call Crlf
    
    ADD EAX, 1      ; 17
    call WriteBin
    call Crlf
    
    mov EDX, OFFSET count2_end
    call WriteString

    ; === COUNT 3: Base 16, 1 to 17 ===
    mov EDX, OFFSET count3_start
    call WriteString
    
    mov EAX, 1      ; Start value
    call WriteHex   ; Display 1 in hex
    call Crlf
    
    ADD EAX, 1      ; 2
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 3
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 4
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 5
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 6
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 7
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 8
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 9
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 10
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 11
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 12
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 13
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 14
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 15
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 16
    call WriteHex
    call Crlf
    
    ADD EAX, 1      ; 17
    call WriteHex
    call Crlf
    
    mov EDX, OFFSET count3_end
    call WriteString

    ; === COUNT 4: Base 10, odd numbers 1 to 39 ===
    mov EDX, OFFSET count4_start
    call WriteString
    
    mov EAX, 1      ; Start value (first odd)
    call WriteDec   ; Display 1
    call Crlf
    
    ADD EAX, 2      ; 3 (skip even numbers)
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 5
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 7
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 9
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 11
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 13
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 15
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 17
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 19
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 21
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 23
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 25
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 27
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 29
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 31
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 33
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 35
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 37
    call WriteDec
    call Crlf
    
    ADD EAX, 2      ; 39
    call WriteDec
    call Crlf
    
    mov EDX, OFFSET count4_end
    call WriteString

    ; Exit program
    INVOKE ExitProcess, 0
main ENDP

END main