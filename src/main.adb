with Ada.Text_IO;
with Ada.Command_Line;

With Sudoku_CSV;
with Sudoku_Types;
with Sudoku_Solver;

procedure Main is
   Instance    : Sudoku_Types.Instance_Type;
   Is_Solved   : Boolean                := False;
   Text_Length : constant Positive      := 2*(Sudoku_Types.Board_Dimension**2);
   Text        : String(1..Text_Length) := (others => ' ');

begin
   begin
      Ada.Text_IO.Get(Text);
   exception
      when Ada.Text_IO.End_Error => null;
   end;

   Instance := Sudoku_CSV.Decode(Text);

   Sudoku_Solver.Solve(Instance, Is_Solved);

   if Is_Solved then
     Text := Sudoku_CSV.Encode(Instance);
      Ada.Text_IO.Put(Text);
   else
      Ada.Text_IO.Put_Line(Ada.Text_IO.Standard_Error, "Unable to solve puzzle");
      Ada.Command_Line.Set_Exit_Status(1);
   end if;
end Main;
