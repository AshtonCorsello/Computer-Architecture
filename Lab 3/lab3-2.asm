.data
	InpMsg1: .asciiz "Input first integer: "
	InpMsg2: .asciiz "Input second integer: "
	InpMsg3: .asciiz "Input third integer: "
	OutMsg: .asciiz "Sum of two largest integers =  " 
	
.text
main: 
	li $v0, 4
	la $a0, InpMsg1              #Print input message
	syscall
	
	li $v0, 5
	syscall                     #Get integer
	move $t1, $v0
	
	li $v0, 4
	la $a0, InpMsg2
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	li $v0, 4
	la $a0, InpMsg3
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0
	
	#Sorting algorithm 
	li $t4, 2    #SWAPAB Counter compare 
	li $t5, 0    #SWAPAB Counter
	        
	bgt $t1, $t2, SWAPAB          #If a > b, swap
	addi $t5, $t5, 1              #add 1 to counter to return to return3 on second call
	return1:                      #Return from SWAPAB call here
	bgt $t2, $t3, SWAPBC          #If b > c, swap
	return2:
	bgt $t1, $t2, SWAPAB          #If a > b, swap
	return3:
	
	add $s0, $t2, $t3             #$t1,t2,t3 are now sorted least to greatest -> add t2 + t3
	
	j EXIT           
	

SWAPAB: 
	move $t0, $t1
	move $t1, $t2              #Swaps $t1 & $t2 using temp register
	move $t2, $t0
	
	addi $t5, $t5, 1          #increment SWAPAB call counter
	
	beq $t4, $t5, return3     #If second SWAPAB call, return to return3

	j return1                 #Else return to return1
	
	
SWAPBC: 
	move $t0, $t2
	move $t2, $t3
	move $t3, $t0
	
	j return2
	
	
EXIT: 
	li $v0, 4
	la $a0, OutMsg
	syscall
	
	li $v0, 1
	move $a0, $s0          #Prints out sum of two largest inputted integers
	syscall
	
	li $v0, 10
	syscall                #Ends program
	
	
	
	
