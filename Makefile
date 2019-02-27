GPRBUILD  := gprbuild
GPRCLEAN  := gprclean
GNATTEST  := gnattest
GNATPROVE := gnatprove

MKDIR := mkdir
RM    := rm
MV    := mv

ROOTDIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

all: $(ROOTDIR)/sudoku

$(ROOTDIR)/obj:
	$(MKDIR) $(ROOTDIR)/obj

$(ROOTDIR)/sudoku: $(ROOTDIR)/obj
	$(GPRBUILD) -P $(ROOTDIR)/sudoku_solver.gpr -o $(ROOTDIR)/sudoku

$(ROOTDIR)/obj/gnattest:
	$(GNATTEST) --tests-dir=$(ROOTDIR)/tests \
		    --exit-status=on \
		    -P $(ROOTDIR)/sudoku_solver.gpr

$(ROOTDIR)/obj/gnattest/harness/test_driver: $(ROOTDIR)/obj/gnattest
	$(GPRBUILD) -P $(ROOTDIR)/obj/gnattest/harness/test_driver.gpr

results: $(ROOTDIR)/obj/gnattest/harness/test_driver
	$(ROOTDIR)/obj/gnattest/harness/test_runner

proofs:
	$(GNATPROVE) -P $(ROOTDIR)/sudoku_solver.gpr \
		     -j0 \
		     --report=all \
		     --mode=all \
		     --cwe \
		     -f \
		     --level=0
	$(MV) $(ROOTDIR)/obj/gnatprove/gnatprove.out \
	      $(ROOTDIR)/proof_summary.txt

clean:
	$(RM) -rf $(ROOTDIR)/obj
