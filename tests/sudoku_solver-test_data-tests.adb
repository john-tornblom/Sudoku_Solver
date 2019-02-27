--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Sudoku_Solver.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

--  begin read only
--  end read only
package body Sudoku_Solver.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Same_Row (Gnattest_T : in out Test);
   procedure Test_Same_Row_00231b (Gnattest_T : in out Test) renames Test_Same_Row;
--  id:2.2/00231b1f52c5ee7f/Same_Row/1/0/
   procedure Test_Same_Row (Gnattest_T : in out Test) is
   --  sudoku_solver.ads:6:4:Same_Row
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      Assert(Same_Row(0, 0), "Same cell");
      Assert(Same_Row(0, 8), "Same row");
      Assert(not Same_Row(0, 9), "Not same row");
      
--  begin read only
   end Test_Same_Row;
--  end read only


--  begin read only
   procedure Test_Same_Col (Gnattest_T : in out Test);
   procedure Test_Same_Col_dd8fc9 (Gnattest_T : in out Test) renames Test_Same_Col;
--  id:2.2/dd8fc94e02ccc432/Same_Col/1/0/
   procedure Test_Same_Col (Gnattest_T : in out Test) is
   --  sudoku_solver.ads:9:4:Same_Col
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      Assert(Same_Col(0, 0), "Same cell");
      Assert(Same_Col(0, 9), "Same col");
      Assert(not Same_Col(0, 8), "Not same col");

--  begin read only
   end Test_Same_Col;
--  end read only


--  begin read only
   procedure Test_Same_Box (Gnattest_T : in out Test);
   procedure Test_Same_Box_f08e60 (Gnattest_T : in out Test) renames Test_Same_Box;
--  id:2.2/f08e60723f1e9027/Same_Box/1/0/
   procedure Test_Same_Box (Gnattest_T : in out Test) is
   --  sudoku_solver.ads:12:4:Same_Box
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      Assert(Same_Box(0, 0), "Same cell");
      Assert(Same_Box(0, 2), "Same box");
      Assert(not Same_Box(0, 3), "Not same box");

--  begin read only
   end Test_Same_Box;
--  end read only


--  begin read only
   procedure Test_Valid_Row (Gnattest_T : in out Test);
   procedure Test_Valid_Row_6261d7 (Gnattest_T : in out Test) renames Test_Valid_Row;
--  id:2.2/6261d77559ef206d/Valid_Row/1/0/
   procedure Test_Valid_Row (Gnattest_T : in out Test) is
   --  sudoku_solver.ads:15:4:Valid_Row
--  end read only

      pragma Unreferenced (Gnattest_T);

      Instance : Instance_Type := (8,1,2,7,5,3,6,4,9,
				   9,4,3,6,8,2,1,7,5,
				   6,7,5,4,9,1,2,8,3,
				   1,5,4,2,3,7,8,9,6,
				   3,6,9,8,4,5,7,2,1,
				   2,8,7,1,6,9,5,3,4,
				   5,2,1,9,7,4,3,6,8,
				   4,3,8,5,2,6,9,1,7,
				   7,9,6,3,1,8,4,5,2);
   begin
      
      for Row_Id in Group_Type'Range loop
	 Assert(Valid_Row(Instance, Row_Id), "Valid row in complete solution");
      end loop;
      
--  begin read only
   end Test_Valid_Row;
--  end read only


--  begin read only
   procedure Test_Valid_Col (Gnattest_T : in out Test);
   procedure Test_Valid_Col_9cce8a (Gnattest_T : in out Test) renames Test_Valid_Col;
--  id:2.2/9cce8a0d8f4f5f6a/Valid_Col/1/0/
   procedure Test_Valid_Col (Gnattest_T : in out Test) is
   --  sudoku_solver.ads:24:4:Valid_Col
--  end read only

      pragma Unreferenced (Gnattest_T);

      Instance : Instance_Type := (8,1,2,7,5,3,6,4,9,
				   9,4,3,6,8,2,1,7,5,
				   6,7,5,4,9,1,2,8,3,
				   1,5,4,2,3,7,8,9,6,
				   3,6,9,8,4,5,7,2,1,
				   2,8,7,1,6,9,5,3,4,
				   5,2,1,9,7,4,3,6,8,
				   4,3,8,5,2,6,9,1,7,
				   7,9,6,3,1,8,4,5,2);
   begin
      
      for Col_Id in Group_Type'Range loop
	 Assert(Valid_Col(Instance, Col_Id), "Valid col in complete solution");
      end loop;

--  begin read only
   end Test_Valid_Col;
--  end read only


--  begin read only
   procedure Test_Valid_Box (Gnattest_T : in out Test);
   procedure Test_Valid_Box_3fe927 (Gnattest_T : in out Test) renames Test_Valid_Box;
--  id:2.2/3fe927bb281589a8/Valid_Box/1/0/
   procedure Test_Valid_Box (Gnattest_T : in out Test) is
   --  sudoku_solver.ads:33:4:Valid_Box
--  end read only

      pragma Unreferenced (Gnattest_T);

      Instance : Instance_Type := (8,1,2,7,5,3,6,4,9,
				   9,4,3,6,8,2,1,7,5,
				   6,7,5,4,9,1,2,8,3,
				   1,5,4,2,3,7,8,9,6,
				   3,6,9,8,4,5,7,2,1,
				   2,8,7,1,6,9,5,3,4,
				   5,2,1,9,7,4,3,6,8,
				   4,3,8,5,2,6,9,1,7,
				   7,9,6,3,1,8,4,5,2);
   begin

      for Box_Id in Group_Type'Range loop
	 Assert(Valid_Box(Instance, Box_Id), "Valid box in complete solution");
      end loop;

--  begin read only
   end Test_Valid_Box;
--  end read only


--  begin read only
   procedure Test_Is_Valid (Gnattest_T : in out Test);
   procedure Test_Is_Valid_23a9c7 (Gnattest_T : in out Test) renames Test_Is_Valid;
--  id:2.2/23a9c7b4117dbc00/Is_Valid/1/0/
   procedure Test_Is_Valid (Gnattest_T : in out Test) is
   --  sudoku_solver.ads:36:4:Is_Valid
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      null; -- Proved Using SPARK

--  begin read only
   end Test_Is_Valid;
--  end read only


--  begin read only
   procedure Test_Is_Complete (Gnattest_T : in out Test);
   procedure Test_Is_Complete_aef9ba (Gnattest_T : in out Test) renames Test_Is_Complete;
--  id:2.2/aef9ba287120ecd9/Is_Complete/1/0/
   procedure Test_Is_Complete (Gnattest_T : in out Test) is
   --  sudoku_solver.ads:45:4:Is_Complete
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      null; -- Proved Using SPARK

--  begin read only
   end Test_Is_Complete;
--  end read only


--  begin read only
   procedure Test_Solve (Gnattest_T : in out Test);
   procedure Test_Solve_b76763 (Gnattest_T : in out Test) renames Test_Solve;
--  id:2.2/b76763b05bb6132d/Solve/1/0/
   procedure Test_Solve (Gnattest_T : in out Test) is
   --  sudoku_solver.ads:52:4:Solve
--  end read only

      pragma Unreferenced (Gnattest_T);
      
      Instance: Instance_Type := (8,0,0,0,0,0,0,0,0,
				  0,0,3,6,0,0,0,0,0,
				  0,7,0,0,9,0,2,0,0,
				  0,5,0,0,0,7,0,0,0,
				  0,0,0,0,4,5,7,0,0,
				  0,0,0,1,0,0,0,3,0,
				  0,0,1,0,0,0,0,6,8,
				  0,0,8,5,0,0,0,1,0,
				  0,9,0,0,0,0,4,0,0);
      
      Expected : Instance_Type := (8,1,2,7,5,3,6,4,9,
				   9,4,3,6,8,2,1,7,5,
				   6,7,5,4,9,1,2,8,3,
				   1,5,4,2,3,7,8,9,6,
				   3,6,9,8,4,5,7,2,1,
				   2,8,7,1,6,9,5,3,4,
				   5,2,1,9,7,4,3,6,8,
				   4,3,8,5,2,6,9,1,7,
				   7,9,6,3,1,8,4,5,2);
      
      Is_Solved : Boolean := False;
   begin
      Solve(Instance, Is_Solved);
      Assert(Expected = Instance and Is_Solved, 
	     "Unable to solve the world's hardest sudoku");
      
      Instance(Instance_Type'First)     := 8;
      Instance(Instance_Type'First + 1) := 8;
      Instance(Instance_Type'Last)      := 0;
      Solve(Instance, Is_Solved);
      Assert(not Is_Solved, 
	     "Solved an inpossible Sudoku problem");
      
--  begin read only
   end Test_Solve;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
   null;
--  begin read only
--  end read only
end Sudoku_Solver.Test_Data.Tests;
