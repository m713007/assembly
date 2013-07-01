all: uppercaser1-gas uppercaser1-nasm

uppercaser1-gas: uppercaser1-gas.o
	ld -o uppercaser1-gas uppercaser1-gas.o

uppercaser1-nasm: uppercaser1-nasm.o
	ld -o uppercaser1-nasm uppercaser1-nasm.o

uppercaser1-gas.o : uppercaser1-gas.s
	as -g --gstabs -o uppercaser1-gas.o uppercaser1-gas.s

uppercaser1-nasm.o : uppercaser1-nasm.asm
	nasm -f elf64 -g -F stabs -o uppercaser1-nasm.o uppercaser1-nasm.asm

clean:
	rm uppercaser1-gas.o uppercaser1-gas uppercaser1-nasm.o uppercaser1-nasm
