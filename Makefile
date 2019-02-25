GPRBUILD  := gprbuild
GPRCLEAN  := gprclean
GNATTEST  := gnattest
GNATPROVE := gnatprove

MKDIR := mkdir
RM    := rm

ROOTDIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

all: main

$(ROOTDIR)/obj:
	$(MKDIR) $(ROOTDIR)/obj

main: $(ROOTDIR)/obj
	$(GPRBUILD) -P $(ROOTDIR)/sudoku_solver.gpr

$(ROOTDIR)/obj/gnattest:
	$(GNATTEST) --tests-dir=$(ROOTDIR)/tests \
		    --exit-status=on \
		    -P $(ROOTDIR)/sudoku_solver.gpr

$(ROOTDIR)/obj/gnattest/harness/test_driver: $(ROOTDIR)/obj/gnattest
	$(GPRBUILD) -P $(ROOTDIR)/obj/gnattest/harness/test_driver.gpr

results: $(ROOTDIR)/obj/gnattest/harness/test_driver
	$(ROOTDIR)/obj/gnattest/harness/test_runner

proofs:
	$(GNATPROVE)

clean:
	$(RM) -rf $(ROOTDIR)/obj
