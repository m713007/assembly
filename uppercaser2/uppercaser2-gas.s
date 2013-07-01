# Executable name : UPPERCASER2
# Version         : 1.0
# Created date    : 30 jun 2013
# Last update     : 30 jun 2013
# Author          : Peter Huybrechts
# Description     : 
#                    
#                   
#
# Build using these commands:
#   as -g --gstabs -o uppercaser2-gas.o uppercaser2-gas.s
#   ld -o uppercaser2-gas uppercaser2-gas.o
#

.section .data


.section .bss

	.lcomm buff, 1			# Reserve 1 byte of memory as buffer

	
.section .text


.globl _start


_start:
	nop						# This no-op keeps the debugger happy

read:	
	movl $3,    %eax		# Specify sys_read call
	movl $0,    %ebx		# Specify File Descriptor 0 : Standard input
	movl $buff, %ecx		# Pass address of buff to read to
	movl $1,    %edx		# Tell sys_read to read one char from stdin
	int  $0x80				# Call sys_read

	cmpl $0, %eax			# Look at sys_read's return value in EAX
	je   exit				# Jump if Equal to 0 (0 means EOF) to Exit
							# or fall through to test for lowercase
	cmpb $0x61, (buff)		# Test input char against lowercase 'a'
	jb   write				# If below 'a' in ASCII chart, not lowercase
	cmpb $0x7A, (buff)		# Test input char against lowercase 'z'
	ja   write				# If above 'z' in ASCII chart, not lowercase
							# At this point, we have a lowercase character
	subb $0x20, (buff)		# Subtract 20H from lowercase to give uppercase...

write:						# ...and then write out the char to stdout
	movl $4,    %eax		# Specify sys_write call
	movl $1,    %ebx		# Specify File Descriptor 1 : Standard output
	movl $buff, %ecx		# Pass address of the character to write
	movl $1,    %edx		# Pass number of chars to write
	int  $0x80				# Call sys_write...
	jmp  read				# ...then go to the beginning to get another character

exit:	
	movl $1,    %eax		# Code for Exit Syscall
	movl $0,    %ebx		# Return a code of zero to Linux
	int  $0x80				# Make kernel call to exit program

