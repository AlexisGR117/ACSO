.data

.balign 4
scan_pattern:   .asciz "%d"

.balign 4
scan_coordenada:.asciz "%f %f %f"

.balign 4
print_pattern:  .asciz "%f "

.balign 4
escaleno:  	.asciz "escaleno\n"

.balign 4
isoceles:  	.asciz "isoceles\n"

.balign 4
equilatero:  	.asciz "equilatero\n"

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
perimetro:	.float 0f0.0

.balign 4
area:		.float 0f0.0

.balign 4
p:	        .float 0f0.000001

.balign 4
dos:        	.float 0f2.0

.balign 4
c:         	.word 0

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
    	VLDR.f32    S0, [R0]
    	LDR R0, =ac
    	VLDR.f32    S1, [R0]
    	LDR R0, =bc
    	VLDR.f32    S2, [R0]
    	VADD.f32    S3, S0, S1
    	VADD.f32    S4, S3, S2
    	LDR R0, =perimetro
    	VSTR.f32    S4, [R0]
	VCVT.f64.f32 D0, S4
	LDR R0, = print_pattern
	VMOV R2, R3, D0
	BL printf

    	LDR R0, =ab
    	VLDR.f32    S0, [R0]
   	LDR R0, =ac
    	VLDR.f32    S1, [R0]
    	LDR R0, =bc
    	VLDR.f32    S2, [R0]
    	LDR R0, =perimetro
    	VLDR.f32    S3, [R0]
    	LDR R0, =dos
    	VLDR.f32    S4, [R0]
    	VDIV.f32    S5, S3, S4
    	VSUB.f32    S6, S5, S0
    	VSUB.f32    S7, S5, S1
    	VSUB.f32    S8, S5, S2
    	VMUL.f32    S9, S6, S7
    	VMUL.f32    S10, S9, S8
	VMUL.f32    S11, S10, S5
    	VSQRT.f32   S6, S11
	LDR R0, =area
	VSTR.f32 S6, [R0]
	VCVT.f64.f32 D0, S6
	LDR R0, = print_pattern
	VMOV R2, R3, D0
	BL printf

    	LDR R0, =ab
    	VLDR.f32    S0, [R0]
    	LDR R0, =ac
    	VLDR.f32    S1, [R0]
    	LDR R0, =bc
    	VLDR.f32    S2, [R0]
    	LDR R0, =p
    	VLDR.f32    S9, [R0]		
	VSUB.F32 S3, S0, S1
	VABS.F32 S4, S3
	VSUB.F32 S5, S1, S2
	VABS.F32 S6, S5
	VSUB.F32 S7, S2, S0
	VABS.F32 S8, S7	
	MOV R1, #0
	LDR R2, =c
	STR R1, [R2]
if1:	VCMP.F32 S4, S9
	VMRS APSR_nzcv, FPSCR
	BLT sume1
	B if2
sume1:	LDR R1, =c
	LDR R1, [R1]
	ADD R2, R1, #1
	LDR R1, =c
	STR R2, [R1]
if2:	VCMP.F32 S6, S9
	VMRS APSR_nzcv, FPSCR
	BLT sume2
	B if3
sume2:	LDR R1, =c
	LDR R1, [R1]
	ADD R2, R1, #1
	LDR R1, =c
	STR R2, [R1]
if3:	VCMP.F32 S8, S9
	VMRS APSR_nzcv, FPSCR
	BLT sume3
	B clasificar	
sume3:	LDR R1, =c
	LDR R1, [R1]
	ADD R2, R1, #1
	LDR R1, =c
	STR R2, [R1]

clasificar:	LDR R1, =c
		LDR R1, [R1]
		CMP R1, #2
		BGE eq
		CMP R1, #1
		BEQ is
		B es
eq:	LDR R0, =equilatero
	BL printf
	B end_while
		
is:	LDR R0, =isoceles
	BL printf
	B end_while
		
es:	LDR R0, =escaleno
	BL printf

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
