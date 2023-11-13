.include "strcpy.m"            # Include macros of strcpy
.data
str: .space 1000                 # Reserv strings
new_str: .space 1000
msg1: .asciz "Enter string: \n"
msg2: .asciz "Copy was success! Copied string:\n"

.text
la a0, msg1                           # Enter messages
li a7, 4
ecall

la a2, str                             # Call enter strnig program
la a3, new_str
sw a2, (sp)
jal enter_string

sw a3, (sp)                              # Call strcpy macro
addi sp, sp, -4
sw a2, (sp)
strcpy

la a0, msg2                            
li a7, 4
ecall

sw a3, (sp)                                # Call print string program
jal print_copy

j end_program

.text


enter_string:                           # void enter_string()
	addi sp, sp, -4                       # Read from stack
	sw ra, (sp)
	addi sp, sp, 4
	lw t1, (sp)
	addi sp, sp, -4
	mv a0, t1                             # Read string
	li a1, 100
	li a7, 8
	ecall
	lw ra (sp)                            # Return
	addi sp sp 4 
	ret

.text
print_copy:                              # void print_copy(string copy)
	addi sp, sp, -4                         # Read from stack
	sw ra, (sp)  
	addi sp, sp, 4
	lw t0, (sp)
	addi sp, sp, -4

	print_copy_loop:                          # Read char while char != '\0'
	lb t1, (t0)
	beqz t1, end_print_copy_loop              
	mv a0, t1
	li a7, 11
	ecall
	addi t0, t0, 1
	j print_copy_loop

	end_print_copy_loop:                           
	lw ra (sp)                              # Return 
	addi sp sp 4 
	ret



end_program:
