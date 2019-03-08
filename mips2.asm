.data
	str:	.space 100						
	fail_print:	.asciiz "\r\nFail!\r\n"			
	success_print:	.asciiz "\r\nSuccess! Location: "		
	ln:		.asciiz "\r\n"					
	
	.text
	.globl main
main:	la	$a0, str		
	li	$a1, 100
	li	$v0, 8			
	syscall
start:	li	$v0, 12			
	syscall
	beq	$v0, '?', stop		
	add	$t1, $0, 0		
ask:	lb	$t2, str($t1)		
	beq	$t2, '\n', fail		
	beq	$v0, $t2, success	
	add	$t1, $t1, 1		
	j	ask
fail:	la	$a0, fail_print
	li	$v0, 4			
	syscall
	j	start			
success:la	$a0, success_print
	li	$v0, 4			
	syscall
	add	$a0, $t1, 1	
	li	$v0, 1
	syscall
	la	$a0, ln			
	li	$v0, 4
	syscall
	j 	start			
stop:	
	li $v0, 10			
	syscall
