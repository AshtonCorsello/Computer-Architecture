.data
	inputmsg: .asciiz "Input a positive integer: "
	invalidinp: .asciiz "Invalid Entry"
	zero: .asciiz "zero "
	one: .asciiz "one "
	two: .asciiz "two "
	three: .asciiz "three "
	four: .asciiz "four "
	five: .asciiz "five "
	six: .asciiz "six "
	seven: .asciiz "seven "
	eight: .asciiz "eight "
	nine: .asciiz "nine "

.text 
main: 
	li $v0, 4
	la $a0, inputmsg
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0       # $s0 = num (will change)
	move $s2, $s0       # $s2 = num (does not change)**
	
	blt $s0, $zero, ERROR_Neg_Entry
	
	jal reverse_num
	
	printLoop:
		div $s1, $t0
		mfhi $t1
		jal print
		mflo $s1
		div $s2, $t0
		mflo $s2
		bnez $s2, printLoop
		
	li $v0, 10
	syscall
		

reverse_num: 
	li $s1, 0          # $s1 = reversedNum
	li $t0, 10         # For mod 10
	
	loop:
		div $s0, $t0       #num / 10
		mfhi $t1           # $t1 = num % 10
		sll $t2, $s1, 3    # $t2 = reversedNum * 8
		sll $t3, $s1, 1    # $t3 = reversedNum * 2
		add $s1, $t2, $t3 
		add $s1, $s1, $t1  # reversedNum = reversedNum * 10 + tmp
		mflo $s0
		bnez $s0, loop
		jr $ra
		
		
print:
	beq $t1, 0, printZero
	beq $t1, 1, printOne
	beq $t1, 2, printTwo
	beq $t1, 3, printThree
	beq $t1, 4, printFour
	beq $t1, 5, printFive
	beq $t1, 6, printSix
	beq $t1, 7, printSeven
	beq $t1, 8, printEight
	beq $t1, 9, printNine
	
	printZero:
		li $v0, 4
		la $a0, zero
		syscall
		jr $ra
	printOne:
		li $v0, 4
		la $a0, one
		syscall
		jr $ra
	printTwo:
		li $v0, 4
		la $a0, two
		syscall
		jr $ra
	printThree:
		li $v0, 4
		la $a0, three
		syscall
		jr $ra
	printFour:
		li $v0, 4
		la $a0, four
		syscall
		jr $ra
	printFive:
		li $v0, 4
		la $a0, five
		syscall
		jr $ra
	printSix:
		li $v0, 4
		la $a0, six
		syscall
		jr $ra
	printSeven:
		li $v0, 4
		la $a0, seven
		syscall
		jr $ra
	printEight:
		li $v0, 4
		la $a0, eight
		syscall
		jr $ra
	printNine:
		li $v0, 4
		la $a0, nine
		syscall
		jr $ra

ERROR_Neg_Entry:
	li $v0, 4
	la $a0, invalidinp
	syscall
	
	li $v0, 10
	syscall
	
