.data 
	InpMsg: .asciiz "Input integers to add. To quit, input 0\n"
	OutMsg: .asciiz "Running sum = " 
	NewNum: .asciiz "Number to add (0 to quit): " 
	NewLine: .asciiz "\n"
	FinMsg: .asciiz "Total = " 
	
.text
main: 

	li $s0, 0        #Store 0 in s0 to begin addition 

	li $v0, 4
	la $a0, InpMsg          #Output message
	syscall
	
	j LOOP
	
LOOP: 
	li $v0, 4
	la $a0, NewNum              #Output message
	syscall

	li $v0, 5                 #Get integer from user
	syscall
	
	beqz $v0, EXIT             #Exit if user inputs 0
	
	add $s0, $s0, $v0            #Calculate running sum
	
	li $v0, 4 
	la $a0, OutMsg                  #Output message
	syscall
	
	li $v0, 1
	move $a0, $s0                #Print running sum
	syscall
	
	li $v0, 4
	la $a0, NewLine               #print new line
	syscall
	
	j LOOP
	
EXIT: 
	li $v0, 4
	la $a0, FinMsg             #Output message
	syscall
	
	li $v0, 1
	move $a0, $s0              #Print running sum
	syscall
	
	li $v0, 10                 #Terminate program
	syscall

	
