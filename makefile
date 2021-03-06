#gcc -Ofast -std=c11 -lm -o crb crb.c -D_XOPEN_SOURCE=600 -march=native -fomit-frame-pointer
all: crb crb-dbl crb-omp ocamlrb hsrb gorb nimrb nimrb_dbl asmrb crrb

.PHONY: crb
crb:
	gcc crb.c -o crb -std=c11 -O3 -lm -D_XOPEN_SOURCE=600

.PHONY: crb-dbl
crb-dbl:
	gcc crb-dbl.c -o crb-dbl -std=c11 -O3 -lm -D_XOPEN_SOURCE=600

.PHONY: crb-omp
crb-omp:
	gcc crb-omp.c -o crb-omp -std=c11 -O3 -lm -fopenmp -D_XOPEN_SOURCE=600

.PHONY: ocamlrb
ocamlrb:
	ocamlopt -inline 9 -unsafe -ccopt -O9 -o ocamlrb ocamlrb.ml

.PHONY: hsrb
hsrb:
	ghc -O3 -o hsrb hsrb.hs

.PHONY: gorb
gorb:
	go build gorb.go

.PHONY: nimrb
nimrb:
	nim c --boundChecks:off --floatChecks:off --opt:speed -d:release nimrb.nim

.PHONY: nimrb_dbl
nimrb_dbl:
	nim c --boundChecks:off --floatChecks:off --opt:speed -d:release nimrb_dbl.nim


.PHONY: asmrb
asmrb:
	fasm asmrb.fasm asmrb.o
	gcc -o asmrb asmrb.o

.PHONY: crrb
crrb:
	crystal build --release crrb.cr
