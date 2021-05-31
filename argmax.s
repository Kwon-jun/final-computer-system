.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 is the pointer to the start of the vector
#	a1 is the # of elements in the vector
# Returns:
#	a0 is the first index of the largest element
# =================================================================
argmax:

    # Prologue
	addi t0 x0 0	#i
    lw t1 0(a0)		#greatest
    addi t2 x0 0	#g_index
    addi t3 x0 0	#present value a[i]
	
loop_start:
	beq t0 a1 loop_end
    
    lw t3 0(a0)
    bge t1 t3 loop_continue
    mv t2 t0	#index update
    mv t1 t3	#greatest update

loop_continue:
	addi t0 t0 1
    addi a0 a0 4
	j loop_start
    
loop_end:
    # Epilogue
	mv a0 t2
    ret
