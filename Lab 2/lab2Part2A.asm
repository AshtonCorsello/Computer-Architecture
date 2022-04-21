.data
	inpmsgX: .asciiz "Input integer X: "              #Store input message string into inpmsgX
	inpmsgY: .asciiz "Input integer Y: "              #Store input message string 2 into inpmsgY
	
	outmsgX: .asciiz "X = "                           #Store output message string into outmsgX
	outmsgY: .asciiz "\nY = "                         #Store output message string 2 into outmsgY
	
.text
main: 
	li $v0, 4
	la  $a0, inpmsgX               #Write input message to console
	syscall
	
	li $v0, 5
	syscall                        #Get integer from user and store in $s0
	move $s0, $v0
	
	li $v0, 4
	la $a0, inpmsgY                #Write input message 2 to console
	syscall
	
	li $v0, 5
	syscall                        #Get integer from user and store in $s1
	move $s1, $v0
	
	move $t0, $s0                  #Move contents of $s0 into temporary register $t0
	move $s0, $s1                  #Move contents of $s1 into $s0
	move $s1, $t0                  #Move contents from temporary register $t0 into $s1
	
	li $v0, 4
	la $a0, outmsgX                #Write output messsage to console
	syscall
	
	li $v0, 1
	move $a0, $s0                  #Write contents of $s0 to console
	syscall
	
	li $v0, 4
	la $a0, outmsgY                #Write output message 2 to console
	syscall
	
	li $v0, 1
	move $a0, $s1                  #Write contents of #s1 to console
	syscall
	
EXIT:
	li $v0, 10                     #Terminate program
	syscall
	
	
	
	