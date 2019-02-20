package Sudoku_Types with SPARK_Mode => On is
   
   Board_Dimension : constant Positive := 9;
   Box_Dimension   : constant Positive := 3;
   
   type Digit_Type    is range 0 .. Board_Dimension;
   type Index_Type    is range 0 .. (Board_Dimension * Board_Dimension) - 1;
   type Instance_Type is array (Index_Type) of Digit_Type;
   
end Sudoku_Types;
