# Executable name : EATSYSCALL
# Version         : 1.0
# Created date    : 3 jun 2013
# Last update     : 3 jun 2013
# Author          : Líff Huybrechts
# Description     : A simple assembly app for Linux, using NASM
#                   demonstrating the use of Linux INT 80H 
#                   syscalls to display text.
#
# Build using these commands:
#   as -g --gstabs -o eatsyscall-gas.o eatsyscall.s
#   ld -o eatsyscall-gas eatsyscall-gas.o
#

.section .data				# Section containing initialized data

eatmsg:
	.ascii "Eat at Joe's!\n"
eatmsgend:
	.set eatlen, eatmsgend - eatmsg

.section .bss				# Section containing uninitialized data

.section .text				# Section containing code


.globl _start				# Linker needs this to find the entry point!


_start:
	nop						# This no-op keeps gdb happy (see text)
	movl $4,      %eax		# Specify sys_write syscalls
	movl $1,      %ebx		# Specify File Descriptor 1: Standard Output
	movl $eatmsg, %ecx		# Pass offset of the message
	movl $eatlen, %edx		# Pass the length of the message
	int  $0x80				# Make syscall to output the text to stdout
	
	movl $1,      %eax		# Specify Exit syscall
	movl $0,      %ebx		# Return a code of zero
	int  $0x80				# Make syscall to terminate the program

