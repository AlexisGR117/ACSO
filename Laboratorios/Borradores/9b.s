.data

.balign 4
scan_pattern:	.asciz "%d"

.balign 4
print_pattern:	.asciz "%d\n"

.balign 4
n:		.word 0

.balign 4
a:		.word 0

.balign 4
b:		.word 0

.balign 4
r:		.word 0

.balign 4
return:		.word 0

.balign 4
modR:		.word 0

.balign 4
divR:		.word 0

.balign 4
GCDR:		.word 0

.balign 4
divV:		.word 0

.balign 4
modV:		.word 0

.balign 4
egyptianR:	.word 0

.balign 4
a2:		.word 0

.balign 4
b2:		.word 0

.balign 4
a3:		.word 0

.balign 4
b3:		.word 0

.text

mod:		LDR R0, =modR
		STR LR, [R0]
modW:	CMP R1, R2
		BLT endMod
		SUB R1, R1, R2
		B modW
endMod:	MOV R0, R1
		LDR LR, =modR
		LDR LR, [LR]
		BX LR

div:		LDR R0, =divR
		STR LR, [R0]
		MOV R0, #0
divW:	SUB R1, R1, R2
		CMP R1, # 0
		BLT endDiv
		ADD R0, R0, #1
		B divW
endDiv:	LDR LR, =divR
		LDR LR, [LR]
		BX LR

GCD:		LDR R0, =GCDR
		STR LR, [R0]
GCD2:		CMP R2, #0
		BEQ endGCD
		B GCD3
GCD3:	MOV R3, R1
		MOV R4, R2
		BL mod
		MOV R2, R0
		MOV R1, R4
		B GCD2
endGCD:	MOV R0, R1
		LDR LR, =GCDR
		LDR LR, [LR]
		BX LR

egyptian:	LDR R0, =egyptianR
		STR LR, [R0]
egyptian2:	LDR R0, =a2
		STR R1, [R0]
		LDR R0, =b2
		STR R2, [R0]
		LDR R0, =b2
		LDR R1, [R0]
		LDR R0, =a2
		LDR R2, [R0]
		BL div
		LDR R5, =divV
		STR R0, [R5]
		LDR R0, =b2
		LDR R1, [R0]
		LDR R0, =a2
		LDR R2, [R0]
		BL mod
		LDR R6, =modV
		STR R0, [R6]
		CMP R0, #0
		BEQ endEgyptian
		B egyptian3
egyptian3:	LDR R5, =divV
		LDR R0, [R5]
		ADD R3, R0, #1
		LDR R1, =divV
		STR R3, [R1]

		LDR R0, =print_pattern
		LDR R1, =divV
		LDR R1, [R1]
		BL printf

		LDR R0, =divV
		LDR R3, [R0]
		LDR R0, =a2
		LDR R1, [R0]
		LDR R0, =b2
		LDR R2, [R0]
		MUL R4, R3, R1
		SUB R4, R4, R2
		LDR R0, =a3
		STR R4, [R0]
		MOV R7, R4
		MUL R4, R2, R3
		LDR R0, =b3
		STR R4, [R0]
		MOV R8, R4
		BL GCD
		MOV R9, R0
		MOV R2, R0
		MOV R1, R7
		BL div
		MOV R5, R0
		MOV R1, R8
		MOV R2, R9
		BL div
		MOV R6, R0
		MOV R1, R5
		MOV R2, R6
		B egyptian2
endEgyptian:	LDR R0, =print_pattern
		LDR R1, =divV
		LDR R1, [R1]
		BL printf

		LDR R0, =print_pattern
		MOV R1, #0
		BL printf

		LDR LR, =egyptianR
		LDR LR, [LR]
		BX LR

.global main
.func main
main:		LDR R1, =return
		STR LR, [R1]

		LDR R0, =scan_pattern
		LDR R1, =n
		BL scanf

        	LDR R11, =n
        	LDR R11, [R11]


while:  	CMP R11, #0
        	BEQ end

		LDR R0, =scan_pattern
		LDR R1, =a
		BL scanf

		LDR R0, =scan_pattern
		LDR R1, =b
		BL scanf

		LDR R1, =a
		LDR R1, [R1]

		LDR R2, =b
		LDR R2, [R2]

		BL egyptian

        	LDR R11, =n
        	LDR R1, [R11]
        	SUB R11, R1, #1
        	LDR R12, =n
        	STR R11, [R12]

        	BAL while

end:    	MOV R0, #0
		LDR LR, =return
        	LDR LR, [LR]
        	BX LR

.global scanf
.global printf
.end
