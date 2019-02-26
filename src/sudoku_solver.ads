with Sudoku_Types; use Sudoku_Types;

package Sudoku_Solver with SPARK_Mode is
   
   function Same_Row(I, J : Index_Type) return Boolean;
   function Same_Col(I, J : Index_Type) return Boolean;
   function Same_Box(I, J : Index_Type) return Boolean;
   
   function Valid_Row(Instance: in Instance_Type; Row_Id : Group_Type) return Boolean;
   function Valid_Col(Instance: in Instance_Type; Col_Id : Group_Type) return Boolean;
   function Valid_Box(Instance: in Instance_Type; Box_Id : Group_Type) return Boolean;
   
   function Is_Valid(Instance: in Instance_Type) return Boolean with
     Contract_Cases => 
       ((for all I in Group_Type'Range => (Valid_Row(Instance, I) and 
                                           Valid_Col(Instance, I) and 
                                             Valid_Box(Instance, I))) => 
          Is_Valid'Result = True,
        (for some I in Group_Type'Range => (not Valid_Row(Instance, I) or 
                                            not Valid_Col(Instance, I) or 
                                              not Valid_Box(Instance, I))) => 
          Is_Valid'Result = False);
   
   function Is_Complete(Instance: in Instance_Type) return Boolean with
     Post => (if(for all I in Instance'Range => Instance(I) /= 0)
                then Is_Complete'Result = True);
   
   procedure Solve(Instance: in out Instance_Type; Is_Solved: in out Boolean) with
     Post => (if(Is_Solved) then Is_Complete(Instance));
   
end Sudoku_Solver;
