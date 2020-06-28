

all: c asm

c:
	gcc -g -o socket socket.c

asm:
	as -o socket_s.o socket.s
	ld socket_s.o  -o socket_s -lc -I /lib64/ld-linux-x86-64.so.2

