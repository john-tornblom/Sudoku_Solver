GPRBUILD  := gprbuild
GPRCLEAN  := gprclean
GNATPROVE := gnatprove
MKDIR     := mkdir

all: main

obj:
	$(MKDIR) obj

main: obj
	$(GPRBUILD) -O0

proof:
	$(GNATPROVE)

clean:
	$(GPRCLEAN)
