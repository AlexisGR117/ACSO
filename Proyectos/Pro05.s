.data

.balign 4
scan_pattern:   .asciz "%d"

.balign 4
scan_coordenada:.asciz "%f %f %f"

.balign 4
rectangulo:  	.asciz "rectangulo\n"

.balign 4
obtusangulo:  	.asciz "obtusangulo\n"

.balign 4
acutangulo:  	.asciz "acutangulo\n"

.balign 4
n:              .word 0

.balign 4
ax:             .float 0f0.0

.balign 4
bx:             .float 0f0.0

.balign 4
cx:             .float 0f0.0

.balign 4
ay:             .float 0f0.0

.balign 4
by:             .float 0f0.0

.balign 4
cy:             .float 0f0.0

.balign 4
ab:             .float 0f0.0

.balign 4
ac:             .float 0f0.0

.balign 4
bc:             .float 0f0.0

.balign 4
p:	        .float 0f0.000001

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

        LDR R0, =scan_coordenada
        LDR R1, =ax
	LDR R2, =ay
	LDR R3, =bx
	BL scanf
        LDR R0, =scan_coordenada
        LDR R1, =by
	LDR R2, =cx
	LDR R3, =cy
	BL scanf

	LDR R0, =ax
	VLDR.f32 S0, [R0]
	LDR R0, =ay
	VLDR.f32 S1, [R0]
	LDR R0, =bx
	VLDR.f32 S2, [R0]
	LDR R0, =by
	VLDR.f32 S3, [R0]
	LDR R0, =cx
	VLDR.f32 S4, [R0]
	LDR R0, =cy
	VLDR.f32 S5, [R0]

    	VSUB.f32    S6, S2, S0
    	VMUL.f32    S7, S6, S6
    	VSUB.f32    S8, S3, S1
    	VMUL.f32    S9, S8, S8
    	VADD.f32    S6, S7, S9
    	VSQRT.f32   S7, S6
    	LDR R0, =ab
    	VSTR.f32    S7, [R0]

    	VSUB.f32    S6, S4, S0
    	VMUL.f32    S7, S6, S6
    	VSUB.f32    S8, S5, S1
    	VMUL.f32    S9, S8, S8
    	VADD.f32    S6, S7, S9
    	VSQRT.f32   S7, S6
    	LDR R0, =ac
    	VSTR.f32    S7, [R0]

    	VSUB.f32    S6, S4, S2
    	VMUL.f32    S7, S6, S6
    	VSUB.f32    S8, S5, S3
    	VMUL.f32    S9, S8, S8
    	VADD.f32    S6, S7, S9
    	VSQRT.f32   S7, S6
    	LDR R0, =bc
    	VSTR.f32    S7, [R0]

	LDR R0, =ab
	VLDR.F32 S0, [R0]
	LDR R0, =ac
	VLDR.F32 S1, [R0]
	LDR R0, =bc
	VLDR.F32 S2, [R0]
	LDR R0, =p
	VLDR.f32 S8, [R0]
	VCMP.F32 S0, S1
	VMRS APSR_nzcv, FPSCR
	BGE longer
	VCMP.f32 S1, S2
	VMRS APSR_nzcv, FPSCR
	BGE hac
	B hbc
longer:	VCMP.F32 S0, S2
	VMRS APSR_nzcv, FPSCR
	BGE hab
	B hbc
hab:	VMUL.f32 S3, S1, S1
	VMUL.f32 S4, S2, S2
	VADD.f32 S5, S3, S4
	VMUL.f32 S6, S0, S0
	VSUB.f32 S7, S5, S6
	VABS.f32 S7, S7
	VCMP.f32 S7, S8
	VMRS APSR_nzcv, FPSCR
	BLT r
	VCMP.f32 S5, S6
	VMRS APSR_nzcv, FPSCR
	BLT o
	B a
hbc:	VMUL.f32 S3, S0, S0
	VMUL.f32 S4, S1, S1
	VADD.f32 S5, S3, S4
	VMUL.f32 S6, S2, S2
	VSUB.f32 S7, S5, S6
	VABS.f32 S7, S7
	VCMP.f32 S7, S8
	VMRS APSR_nzcv, FPSCR
	BLT r
	VCMP.f32 S5, S6
	VMRS APSR_nzcv, FPSCR
	BLT o
	B a
hac:	VMUL.f32 S3, S0, S0
	VMUL.f32 S4, S2, S2
	VADD.f32 S5, S3, S4
	VMUL.f32 S6, S1, S1
	VSUB.f32 S7, S5, S6
	VABS.f32 S7, S7
	VCMP.f32 S7, S8
	VMRS APSR_nzcv, FPSCR
	BLT r
	VCMP.f32 S5, S6
	VMRS APSR_nzcv, FPSCR
	BLT o
	B a
r:	LDR R0, =rectangulo
	BL printf
	BAL end_while
o:	LDR R0, =obtusangulo
	BL printf
	BAL end_while
a:	LDR R0, =acutangulo
	BL printf
	BAL end_while

end_while:	LDR R11, =n
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
