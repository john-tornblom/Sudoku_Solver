# Sudoku_Solver
Sudoku_Solver is an automated solver for the game
[Sudoku](https://en.wikipedia.org/wiki/Sudoku).
The solver in written in
[Ada SPARK](https://en.wikipedia.org/wiki/SPARK_(programming_language)),
and thus evidence for compliance with respect to some requirements may be
verified formally. Furthermore, Ada SPARK can also guarantee the absence of
runtime errors, e.g. illegal assignments to ranged types.

## Building
gprbuild sudoku_solver.gpr

## Running
./obj/main < examples/world_hardest_sudoku.csv 

## High-Level Requirements
The Sudoku_Solver shall load an (incomplete) 9x9 sudoku instance from STDIN,
solve the sudoku problem, and finally emit the solved instance to STDOUT.
When there is no infeasible solution available, the program shall terminate
with an error code.

## Software Design
Sudoku_Solver operates on a CSV file with 9 rows and 9 columns, where each cell
is separated by the comma character, and each row is separated by a linebreak.
No spaces, comments, or headers are allowed in the CSV file. Each cell must
contain a single digit between zero and nine, where zero represents incomplete
sudoku values. Consequently, each CSV file is exactly 162 characters long (18*9).
Internally, the content of a CSV file is refered to as a sudoku instance, and is
represented as a 9x9 integer matrix in the Instance_Solver component.

The Main component loads a sudoku instance from a file identified by the first
command line argument, then sends its content to the Instance_Solver component
via the CSV_Decoding components. When a solution is discovered, the
Instance_Solver components send back the completed sudoku instance to the Main
component via the CSV_Encoding component.

![Software Design](img/sw_design.png)

## Low-Level Requirements
TBD

## Verification Procedure
TBD

## Reporting Bugs
If you encounter problems with Sudoku_Solver, please
[file a github issue](https://github.com/john-tornblom/Sudoku_Solver/issues/new).
If you plan on sending pull requests which affect more than a few lines of code,
please file an issue before you start to work on you changes. This will allow us
to discuss the solution properly before you commit time and effort.

## License
Sudoku_Solver is licensed under the GPLv3, see LICENSE for more information.
