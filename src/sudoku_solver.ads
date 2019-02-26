with Sudoku_Types; use Sudoku_Types;

package Sudoku_Solver with SPARK_Mode is
   
   function Same_Row(I, J : Index_Type) return Boolean;
   function Same_Col(I, J : Index_Type) return Boolean;
   function Same_Box(I, J : Index_Type) return Boolean;
   
   function Valid_Row(Instance: in Instance_Type; Row_Id : Group_Type) return Boolean with
     Post => 
       (if (for all Digit in Digit_Type'Range => 
              (for some I in Group_Type'Range =>
                 Digit = Instance((Row_Id * Board_Dimension) + I)))
        then Valid_Row'Result = True
        else Valid_Row'Result = False);

   function Valid_Col(Instance: in Instance_Type; Col_Id : Group_Type) return Boolean with
     Post => 
       (if (for all Digit in Digit_Type'Range => 
              (for some I in Group_Type'Range =>
                 Digit = Instance(Col_Id + (Board_Dimension * I))))
        then Valid_Col'Result = True
        else Valid_Col'Result = False);
                                                                                      
   function Valid_Box(Instance: in Instance_Type; Box_Id : Group_Type) return Boolean;
   
   function Is_Valid(Instance: in Instance_Type) return Boolean with
     Post => 
       (if (for all I in Group_Type'Range => Valid_Row(Instance, I) 
            and Valid_Col(Instance, I) 
            and Valid_Box(Instance, I))
        then Is_Valid'Result = True
        else Is_Valid'Result = False);

   function Is_Complete(Instance: in Instance_Type) return Boolean with
     Post => 
       (if (for all I in Instance_Type'Range => Instance(I) /= 0)
        then Is_Complete'Result = True
        else Is_Complete'Result = False);
   
   procedure Solve(Instance: in out Instance_Type; Is_Solved: in out Boolean);
   
end Sudoku_Solver;
