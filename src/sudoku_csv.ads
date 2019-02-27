with Sudoku_Types; use Sudoku_Types;

package Sudoku_CSV with SPARK_Mode is
   
   -- Decode CSV-encoded text into a Sudoku instance
   function Decode(Text : in String) return Instance_Type;
   
   -- Encode a Sudoku instance into CSV text
   function Encode(Instance : in Instance_Type) return String;
   
end Sudoku_CSV;
