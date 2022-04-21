.data
	inpmsgX: .asciiz "Input integer X: "              #Store input message string into inpmsgX
	inpmsgY: .asciiz "Input integer Y: "              #Store input message string 2 into inpmsgY
	
	outmsgX: .asciiz "X = "                           #Store output message string into outmsgX
	outmsgY: .asciiz "\nY = "                         #Store output message string 2 into outmsgY
	
.text
main: 
	li $v0, 4
	la  $a0, inpmsgX            #Write message to console
	syscall
	
	li $v0, 5
	syscall                     #Get integer from user and store in $0
	move $s0, $v0
	
	li $v0, 4
	la $a0, inpmsgY             #Write message 2 to console
	syscall
	
	li $v0, 5   
	syscall                     #Get integer from user and store in $s1
	move $s1, $v0
	
	subi $sp, $sp, 4            #Make room in stack for one word
	sw $s0, 0($sp)              #Store contents of $s0 into stack to temporary hold value
	
	move $s0, $s1               #Move contents of $s1 to $s0 
	lw $s1, 0($sp)              #Move saved value from stack to $s1
	addi $sp, $sp, 4	    #Delete saved value from stack
	
	li $v0, 4
	la $a0, outmsgX             #Write output message to console
	syscall
	
	li $v0, 1
	move $a0, $s0               #Write contents of $s0 to console
	syscall
	
	li $v0, 4
	la $a0, outmsgY             #Write output message 2 to console
	syscall
	
	li $v0, 1
	move $a0, $s1               #Write contents of $s1 to console
	syscall
	
EXIT:
	li $v0, 10                  #Terminate program
	syscall
	
	
