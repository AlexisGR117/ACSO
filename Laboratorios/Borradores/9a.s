.data

.balign 4
scan_pattern:   .asciz "%d"

.balign 4
print_pattern:  .asciz "%d\n"

.balign 4
n:              .word 0

.balign 4
a:              .word 0

.balign 4
b:              .word 0

.balign 4
c:              .word 0

.balign 4
X:              .word 0

.balign 4
r:              .word 0

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

while:  
        LDR R11, =n
        LDR R11, [R11]

	CMP R11, #0
        BEQ end

        LDR R0, =scan_pattern
        LDR R1, =a
        BL scanf

        LDR R0, =scan_pattern
        LDR R1, =b
        BL scanf

        LDR R0, =scan_pattern
        LDR R1, =c
        BL scanf
        LDR R0, =scan_pattern
        LDR R1, =X
        BL scanf

        LDR R2, =a
        LDR R2, [R2]

        LDR R3, =b
        LDR R3, [R3]

        LDR R4, =c
        LDR R4, [R4]

        LDR R5, =X
        LDR R5, [R5]

        MUL R6, R5, R5
        MUL R7, R2, R6
        MUL R8, R3, R5

        ADD R9, R7, R8

        LDR R10, =r
        STR R10, [R10]
        ADD R10, R9, R4

        LDR R1, =r
        STR R10, [R1]

        LDR R0, =print_pattern
        LDR R1, =r
        LDR R1, [R1]
        BL printf

        LDR R11, =n
        LDR R1, [R11]
        SUB R11, R1, #1
        LDR R12, =n
        STR R11, [R12]

        B while

end:    MOV R0, #0
	LDR LR, =return
        LDR LR, [LR]
        BX LR

.global scanf
.global printf
.end
