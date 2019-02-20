with Sudoku_Types; use Sudoku_Types;

package Sudoku_CSV with SPARK_Mode is
   
   function Decode(Text     : in String)        return Instance_Type;
   function Encode(Instance : in Instance_Type) return String;
   
end Sudoku_CSV;
