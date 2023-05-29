.data

.balign 4
scan_pattern:   .asciz "%d"

.balign 4
print_pattern:  .asciz "%d %d\n"

.balign 4
no:  		.asciz "NO\n"

.balign 4
n:              .word 0

.balign 4
c:              .word 0

.balign 4
a:              .word 0

.balign 4
b:              .word 0

.balign 4
return:         .word 0

.text
.global main
.func main
main:   LDR R1, =return
        STR LR, [R1]

        LDR R0, =scan_pattern
        LDR R1, =n
        BL scanf

        LDR R11, =n
        LDR R11, [R11]

while:  CMP R11, #0
        BEQ end

        LDR R0, =scan_pattern
        LDR R1, =c
        BL scanf

        LDR R2, =c
        LDR R2, [R2]

	CMP R2, #4
	BLE print_no

	MOV R1, #1	
	LDR R3, =a
	STR R1, [R3]
while_2:	LDR R3, =a
		LDR R3, [R3]
		LDR R2, =c
		LDR R2, [R2]
		CMP R3, R2
		BGT print_no

		LDR R3, =a
		LDR R3, [R3]
		ADD R4, R3, #1
		LDR R3, =a
		STR R4, [R3]		

		LDR R3, =a
		LDR R3, [R3]
		LDR R4, =b
		LDR R4, [R4]
		ADD R5, R3, #1
		LDR R4, =b
		STR R5, [R4]

while_3:	LDR R4, =b
		LDR R4, [R4]
		LDR R2, =c
		LDR R2, [R2]
		CMP R4, R2
		BGT while_2

		LDR R3, =a
		LDR R3, [R3]
		LDR R4, =b
		LDR R4, [R4]
		LDR R2, =c
		LDR R2, [R2]
		MUL R5, R3, R3
		MUL R6, R4, R4
		ADD R7, R5, R6
		MUL R8, R2, R2
		CMP R7, R8
		BEQ print

		LDR R4, =b
		LDR R4, [R4]
		ADD R5, R4, #1
		LDR R4, =b
		STR R5, [R4]
		BAL while_3			

end_while:      LDR R11, =n
        	LDR R1, [R11]
        	SUB R11, R1, #1
        	LDR R12, =n
        	STR R11, [R12]
        	B while

end:    MOV R0, #0
	LDR LR, =return
        LDR LR, [LR]
        BX LR

print_no:	LDR R0, =no
    		BL printf
    		B end_while

print: 	LDR R0, =print_pattern
	LDR R1, =a
	LDR R1, [R1]
	LDR R2, =b
	LDR R2, [R2]
	BL printf
	BAL end_while

.global scanf
.global printf
.end
