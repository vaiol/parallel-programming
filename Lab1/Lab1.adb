--------------------------------------------------------------------------
--                                                                      --
--                     Parallel Programming                             --
--         Laboratory work #1. Ada. Subprograms and packages            --
--                                                                      --
--  File: lab1.ada                                                      --
--  Task: F1: MC = MIN(A) * (MD * MB)                                   --
--        F2: MN = MAX(ML) * (MK * MO)                                  --
--        F3: Z = SORT(R) * SORT(MW * MV)                               --
--                                                                      --
--  Author: Stepanov Alexander, group IP - 31                           --
--  Date: 14.09.2015                                                    --
--                                                                      --
--------------------------------------------------------------------------

with Data, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
  
procedure Lab1 is 
    N : Integer := 3; 
    package mainData is new Data(n);
   	use mainData;     
	A, R, Z : Vector;
   	MB, MC, MD, MK, ML, MN, MO, MV, MW : Matrix;       
begin

    ------------------------------
    --        Input data        --
    ------------------------------
    Put("All vectors had ");
    Put(N);
    Put(" items");
    New_Line;

	----------- input F1 ----------
    Put_Line(" -- Arguments for F1");
    
    Put("Enter vector A: ");
    New_Line;
    Input_Vector(A);

    New_Line;
    Put("Enter MD: ");
    New_Line;
    Input_Matrix(MD);

    New_Line;
    Put("Enter MB: ");
    New_Line;
    Input_Matrix(MB);
 
    ----------- input F2 ----------
    Put_Line(" -- Arguments for F2");
    
    New_Line;
    Put("Enter ML: ");
    New_Line;
    Input_Matrix(ML);      

    New_Line;
    Put("Enter MK: ");
    New_Line;
    Input_Matrix(MK);

    New_Line;
    Put("Enter MO: ");
    New_Line;
    Input_Matrix(MO);
    
    ----------- input F3 ----------
    Put_Line(" -- Arguments for F3");   

    Put("Enter vector R: ");
    New_Line;
    Input_Vector(R);

    New_Line;
    Put("Enter MW: ");
    New_Line;
    Input_Matrix(MW);

    New_Line;
    Put("Enter MV: ");
    New_Line;
    Input_Matrix(MV); 

    -------------------------------
    --        Calculation        --
    -------------------------------
    F1(A, MD, MB, MC);
    F2(ML, MK, MO, MN);
	F3(R, MW, MV, Z);   

    -------------------------------
    --        Output data        --
    -------------------------------
    Put_Line(" -- Arguments for F3");

    New_Line;
    Put("F1 = ");   	  
    Output_Matrix(MC);

    New_Line;
    Put("F2 = ");       
    Output_Matrix(MN);

    New_Line;
    Put("F3 = ");    
    Output_Vector(Z);

end Lab1;
