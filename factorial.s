n: .word 8

.text
main:
	la t0, n
    lw a0, 0(t0)
    
    jal ra, factorial
    
    addi a1, t2, 0
    addi a0, x0, 1
    ecall # Print Result
    
    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline
    
    addi a0, x0, 10
    ecall # Exit
    
factorial:
	# Code
    add t0 a0 x0
    li t1 1
    li t2 1
    loop:
    	ble t0 t1 exit
        mul t2 t2 t0
        addi t0 t0 -1
        j loop
    exit:
    	add a0 t0 x0
        jr ra
