with Ada.Text_IO; use Ada.Text_IO;
with Sudoku_Types; use Sudoku_Types;

package body Sudoku_Rendering is
   
   procedure Render(Instance : in Instance_Type) is
   begin
      for I in Instance'Range loop
         Put(Instance(I)'Image);
         if (I mod 9) = 8 then
            New_Line;
         end if;
      end loop;
   end Render;
   
end Sudoku_Rendering;
