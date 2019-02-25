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
      Excluded_Digits : array(Digit_Type'Range) of Boolean := (others => False);
      I               : Index_Type                         := Index_Type'First;
      Candidate       : Instance_Type;
   begin

      if Is_Complete(Instance) then
         Is_Solved := True;
         return;
      end if;
      
      while Instance(I) /= 0 and I < Index_Type'Last loop
         I := I + 1;
      end loop;

      for J in Index_Type'Range loop
         if Same_Row(I, J) or Same_Col(I, J) or Same_Box(I, J) then
            Excluded_Digits(Instance(J)) := True;
         end if;
      end loop;
            
      for J in Digit_Type'Range loop
         if not Excluded_Digits(J) then
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
