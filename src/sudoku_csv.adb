with Sudoku_Types; use Sudoku_Types;

package body Sudoku_CSV with SPARK_Mode is
   
   function Decode(Text : in String) return Instance_Type is
      Instance : Instance_Type := (others => Digit_Type'First);
      Index    : Index_Type    := Index_Type'First;
      Is_Digit : Boolean;
   begin
      for Pos in Text'Range loop
         Is_Digit := True;
         case Text(Pos) is
            when '0' => Instance(Index) := 0;
            when '1' => Instance(Index) := 1;
            when '2' => Instance(Index) := 2;
            when '3' => Instance(Index) := 3;
            when '4' => Instance(Index) := 4;
            when '5' => Instance(Index) := 5;
            when '6' => Instance(Index) := 6;
            when '7' => Instance(Index) := 7;
            when '8' => Instance(Index) := 8;
            when '9' => Instance(Index) := 9;
            when others => Is_Digit := False;
         end case;
         
         if Index /= Index_Type'Last and Is_Digit then
            Index := Index + 1;
         end if;
      end loop;
      
      return Instance;
   end Decode;
   
   function Encode(Instance : in Instance_Type) return String is
      Pos         : Positive               := Positive'First;
      Text_Length : constant               := 2 * (Board_Dimension**2);
      New_Line    : constant String(1..1)  := "" & Character'Val(10);
      End_Of_Line : constant String(1..1)  := "" & Character'Val(0);
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
      for Index in Instance_Type'Range loop
         case Instance(Index) is
            when 0 => Text(Pos) := '0';
            when 1 => Text(Pos) := '1';
            when 2 => Text(Pos) := '2';
            when 3 => Text(Pos) := '3';
            when 4 => Text(Pos) := '4';
            when 5 => Text(Pos) := '5';
            when 6 => Text(Pos) := '6';
            when 7 => Text(Pos) := '7';
            when 8 => Text(Pos) := '8';
            when 9 => Text(Pos) := '9';
         end case;

         if Pos < Text'Last - 2 then
            Pos := Pos + 2;
         end if;
         pragma Loop_Invariant(Pos <= Text_Length);
      end loop;
      
      return Text;
   end Encode;
   
end Sudoku_CSV;
