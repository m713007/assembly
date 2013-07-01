all: eatsyscall-gas eatsyscall-nasm

eatsyscall-gas: eatsyscall-gas.o
	ld -o eatsyscall-gas eatsyscall-gas.o

eatsyscall-nasm: eatsyscall-nasm.o
	ld -o eatsyscall-nasm eatsyscall-nasm.o

eatsyscall-gas.o : eatsyscall-gas.s
	as -g --gstabs -o eatsyscall-gas.o eatsyscall-gas.s

eatsyscall-nasm.o : eatsyscall-nasm.asm
	nasm -f elf64 -g -F stabs -o eatsyscall-nasm.o eatsyscall-nasm.asm
