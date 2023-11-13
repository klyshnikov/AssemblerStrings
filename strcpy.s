.text
.globl strcpy
strcpy:
	#t0  = str
	#t1 = new_str

	addi sp, sp, -4
	sw ra, (sp)
	addi sp, sp, 4
	lw t0, (sp)
	addi sp, sp, 4
	lw t1, (sp)
	addi sp, sp, -8

	copy_loop:
	lb t3, (t0)
	sb t3, (t1)
	
	addi t0, t0, 1
	addi t1, t1, 1
	beqz t3, end_copy_loop
	j copy_loop

	end_copy_loop:
	lw ra (sp)
	addi sp sp 4 
	ret