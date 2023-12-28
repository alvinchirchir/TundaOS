### Tunda OS
A minimal written kernel for the 32 bit x86 computer.

##### Why is TundaOS ?
I know, I know 32 bit x86 systems are legacy but I they are a great starting point. I believe in beginning with the basics, where things are relatively 'simple,' before navigating the complexities that may follow. 

##### Documentation
I've created a make file that you can just run using the following commands. Make sure you checkout the requirement section.

###### Requirements

- brew install nasm
- brew install qemu-system-i386
- brew install i386-elf-ld 
- brew install i386-elf-gcc 

Then using make file use the commands below:
```sh
make run
make clean
```