.data
	inpmsg1: .asciiz "\nEnter value for f: "
	inpmsg2: .asciiz "Enter value for g: "
	outmsg: .asciiz "Answer for f = g - (f + 5): "
	
.text
main:
	li $t2, 0   #Loop counter
	li $t3, 3   #Amount of loops

loop:
	li $v0, 4
	la $a0,inpmsg1     #Ask for f
	syscall
	
	li $v0,5
	syscall           #Read in integer f
	move $s1,$v0
	
	li $v0, 4
	la $a0, inpmsg2    #Ask for g
	syscall
	
	li $v0, 5
	syscall           #Read in integer g
	move $t0,$v0
	
	addi $t1, $s1, 5
	sub $s0, $t0, $t1
	
	li $v0, 4
	la $a0, outmsg        #Output final message text
	syscall
	
	li $v0,1
	move $a0,$s0          #Output integer answer
	syscall
	
	addi $t2, $t2, 1
	beq $t2, $t3, Exit         #Loop until $t2 is 3
	j loop
	
Exit:
	li $v0, 10           #End program
	syscall

