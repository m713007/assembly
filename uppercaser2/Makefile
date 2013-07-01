all: uppercaser2-gas uppercaser2-nasm

uppercaser2-gas: uppercaser2-gas.o
	ld -o uppercaser2-gas uppercaser2-gas.o

uppercaser2-nasm: uppercaser2-nasm.o
	ld -o uppercaser2-nasm uppercaser2-nasm.o

uppercaser2-gas.o : uppercaser2-gas.s
	as -g --gstabs -o uppercaser2-gas.o uppercaser2-gas.s

uppercaser2-nasm.o : uppercaser2-nasm.asm
	nasm -f elf64 -g -F stabs -o uppercaser2-nasm.o uppercaser2-nasm.asm

clean:
	rm uppercaser2-gas.o uppercaser2-gas uppercaser2-nasm.o uppercaser2-nasm
