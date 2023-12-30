### Tunda OS
A minimal written kernel for the 32 bit x86 computer.

##### Why is TundaOS ?
I know, I know 32 bit x86 systems are legacy but I think they are a great starting point. I believe in beginning with the basics, where things are relatively "simple," before navigating the complexities that may follow.

_"Simplicity is the ultimate sophistication." - Leonardo da Vinci_

##### Documentation

I've created a makefile that you can just run using the following commands. Make sure you check out the requirement section.


###### Requirements

- brew install nasm
- brew install qemu-system-i386
- brew install i386-elf-ld 
- brew install i386-elf-gcc 

Then using make file, run the commands below ;)
```sh
make run
make clean
```
