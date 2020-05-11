all: build test

build:
	./masm_rmd < Hw5.asm > Hw5.obj

test:
	./mic1 prom_mrd.dat Hw5.obj 0 1024

clean:
	rm *.obj
