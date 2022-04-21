.data 
	inpmsgW: .asciiz "Input value for W: "                 #Store input message string for var W in inpmsgW
	inpmsgX: .asciiz "\nInput value for X:"               #Store input message string for var X in inpmsgX
	inpmsgY: .asciiz "\nInput value for Y: "               #Store input message string for var Y in inpmsgY
	inpmsgZ: .asciiz "\nInput value for Z: "               #Store input message string for var Z in inpmsgZ
	
	outmsgX: .asciiz "\nX = "
	
	
.text 
main: 
	
	li $v0, 4
	la $a0, inpmsgW                 #Write inpmsgW to console
	syscall
	
	li $v0, 6
	syscall                         #Store inputted number into $f1 (w)
	mov.s $f1, $f0
	
	li $v0, 4
	la $a0, inpmsgX                 #Write inpmsgX to console
	syscall
	
	li $v0, 6
	syscall                         #Store inputted number into $f2 (x)
	mov.s $f2, $f0
	
	li $v0, 4
	la $a0, inpmsgY                 #Write inpmsgY to console
	syscall
	
	li $v0, 6
	syscall                         #Store inputted number into $f3 (y)
	mov.s $f3, $f0
	
	li $v0, 4
	la $a0, inpmsgZ                 #Write inpmsgZ to console
	syscall
	
	li $v0, 6
	syscall                         #Store inputted number into $f4 (z)
	mov.s $f4, $f0
	
	sub.s $f5, $f2, $f3             #Subtract $f3 from $f2 and store into $f5 (f = x - y)
	
	c.lt.s $f5, $f1               #If $f5 < $f1, set conditino bit to 1, else set to 0  (bool greaterThan = (f < w))
	bc1f XTOY                     #If condition bit == 0 (previous statement is false), jump to XTOY 
	c.eq.s $f5, $f1
	bc1t XTOY                     #If $f5 == $f1, jump to XTOY (Satisfies greater than or equal to condition)

	j XTOZ                        #If all previous statments false (f < w), just to XTOZ
	
XTOY:
	mov.s $f2, $f3                  #Set $f2 equal to $f3 (x = y)
	j EXIT				#Jump to exit
	
XTOZ:
	mov.s $f2, $f4			#Set $f2 equal to $f4 (x = z)
	j EXIT
	
EXIT:
	li $v0, 4
	la $a0, outmsgX			#Write outmsgX to console
	syscall
	
	li $v0, 2
	mov.s $f12, $f2             	#Write $f2 (x) to console
	syscall

	li $v0, 10			#Terminate program
	syscall
	
