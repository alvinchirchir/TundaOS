all: run

kernel.bin: kernel_entry.o kernel.o
	i386-elf-ld -o $@ -Ttext 0x1000 $^ --oformat binary

kernel_entry.o: kernel_entry.asm
	nasm $< -f elf -o $@

kernel.o: kernel.cpp
	i386-elf-gcc -ffreestanding -m32 -g -c $< -o $@

mbr.bin: mbr.asm
	nasm $< -f bin -o $@

tungaos-image.bin: mbr.bin kernel.bin
	cat $^ > $@

run: tungaos-image.bin
	qemu-system-i386 -fda $<

clean:
	$(RM) *.bin *.o *.dis
