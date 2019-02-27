--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Sudoku_CSV.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

with Sudoku_CSV; use Sudoku_CSV;
with Sudoku_Types; use Sudoku_Types;

--  begin read only
--  end read only
package body Sudoku_CSV.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Decode (Gnattest_T : in out Test);
   procedure Test_Decode_e3f1fd (Gnattest_T : in out Test) renames Test_Decode;
--  id:2.2/e3f1fd872dcdf410/Decode/1/0/
   procedure Test_Decode (Gnattest_T : in out Test) is
   --  sudoku_csv.ads:6:4:Decode
--  end read only

      pragma Unreferenced (Gnattest_T);

      Instance    : Instance_Type          := (others => 0);
      Text_Length : constant               := 2 * (Board_Dimension**2);
      New_Line    : constant String(1..1)  := "" & Character'Val(10);
      Text        : String(1..Text_Length) := "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line;
   begin

      for Digit in Digit_Type'Range loop
	 for Index in Instance_Type'Range loop
	    Instance(Index) := Digit;
	    Text(1 + Integer(Index) * 2) := Character'Val(Digit + 48);
	    Assert(Decode(Text) = Instance, "CSV Decoding Failed: " & Text);
	 end loop;
      end loop;

--  begin read only
   end Test_Decode;
--  end read only


--  begin read only
   procedure Test_Encode (Gnattest_T : in out Test);
   procedure Test_Encode_78c993 (Gnattest_T : in out Test) renames Test_Encode;
--  id:2.2/78c9937af283a4d3/Encode/1/0/
   procedure Test_Encode (Gnattest_T : in out Test) is
   --  sudoku_csv.ads:9:4:Encode
--  end read only

      pragma Unreferenced (Gnattest_T);

      Instance    : Instance_Type          := (others => 0);
      Text_Length : constant               := 2 * (Board_Dimension**2);
      New_Line    : constant String(1..1)  := "" & Character'Val(10);
      Text        : String(1..Text_Length) := "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line &
                                              "0,0,0,0,0,0,0,0,0" & New_Line;
   begin
      for Digit in Digit_Type'Range loop
	 for Index in Instance_Type'Range loop
	    Instance(Index) := Digit;
	    Text(1 + Integer(Index) * 2) := Character'Val(Digit + 48);
	    Assert(Encode(Instance) = Text, "CSV Encoding Failed: " & Text);
	 end loop;
      end loop;


--  begin read only
   end Test_Encode;
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
end Sudoku_CSV.Test_Data.Tests;
