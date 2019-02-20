GPRBUILD  := gprbuild
GPRCLEAN  := gprclean
GNATPROVE := gnatprove

all:
	$(GPRBUILD) -O0

proof:
	$(GNATPROVE)

clean:
	$(GPRCLEAN)
