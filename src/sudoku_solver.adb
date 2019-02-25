with Sudoku_Types; use Sudoku_Types;

package body Sudoku_Solver with SPARK_Mode is
         
   function Same_Row(I, J : Index_Type) return Boolean is
   begin
      return (I/Board_Dimension = J/Board_Dimension);
   end Same_Row;
      
   function Same_Col(I, J : Index_Type) return Boolean is
   begin
      return ((I-J) mod Board_Dimension) = 0;
   end Same_Col;
   
   function Same_Box(I, J : Index_Type) return Boolean is
   begin
      return ((I/(Board_Dimension*Box_Dimension) = 
               J/(Board_Dimension*Box_Dimension)) 
              and 
                ((I mod Board_Dimension)/Box_Dimension =
                 (J mod Board_Dimension)/Box_Dimension)
             );
   end Same_Box;
   
   function Valid_Row(Instance: in Instance_Type; Row_Id : Group_Type) return Boolean is
      Digit_Map : array(Digit_Type'Range) of Boolean := (others => False);
      Offset    : constant Index_Type := Row_Id * Board_Dimension;
      Digit     : Digit_Type;
   begin
      for Index in Group_Type'Range loop
         Digit := Instance(Offset + Index);
         if Digit_Map(Digit) then
            return False;
         end if;
         if Digit /= 0 then
            Digit_Map(Digit) := True;
         end if;
      end loop;
      return True;
   end Valid_Row;
   
   function Valid_Col(Instance: in Instance_Type; Col_Id : Group_Type) return Boolean is
      Digit_Map : array(Digit_Type'Range) of Boolean := (others => False);
      Index     : constant Index_Type := Col_Id * Board_Dimension;
      Digit     : Digit_Type;
   begin
      for Offset in Group_Type'Range loop
         Digit := Instance(Offset + Index);
         if Digit_Map(Digit) then
            return False;
         end if;
         if Digit /= 0 then
            Digit_Map(Digit) := True;
         end if;
      end loop;
      return True;
   end Valid_Col;

   function Valid_Box(Instance: in Instance_Type; Box_Id : Group_Type) return Boolean is
   begin
      return True;
   end Valid_Box;

   function Is_Valid(Instance: in Instance_Type) return Boolean is
   begin
      for Id in Group_Type'Range loop
         if not Valid_Row(Instance, Id) then
            return False;
         end if;
         if not Valid_Col(Instance, Id) then
            return False;
         end if;
         if not Valid_Box(Instance, Id) then
            return False;
         end if;
      end loop;
      return True;
   end Is_Valid;
   
   function Is_Complete(Instance: in Instance_Type) return Boolean is
   begin
      for I in Instance'Range loop
         if Instance(I) = 0 then
            return False;
         end if;
      end loop;
      return True;
   end Is_Complete;
   
   procedure Solve(Instance: in out Instance_Type; Is_Solved: in out Boolean) is
      Digit_Map : array(Digit_Type'Range) of Boolean := (others => False);
      I         : Index_Type                         := Index_Type'First;
      Candidate : Instance_Type;
   begin

      if Is_Complete(Instance) then
         Is_Solved := Is_Valid(Instance);
         return;
      end if;
      
      while Instance(I) /= 0 and I < Index_Type'Last loop
         I := I + 1;
      end loop;

      for J in Index_Type'Range loop
         if Same_Row(I, J) or Same_Col(I, J) or Same_Box(I, J) then
            Digit_Map(Instance(J)) := True;
         end if;
      end loop;
            
      for J in Digit_Type'Range loop
         if not Digit_Map(J) then
            Candidate := Instance;
            Candidate(I) := J;
            Solve(Candidate, Is_Solved);
            if Is_Complete(Candidate) then
               Instance := Candidate;
               return;
            end if;
         end if;
      end loop;
   end Solve;
   
end Sudoku_Solver;
