--------------------------------------------------------------------------
--                                                                      --
--                     Parallel Programming                             --
--         Laboratory work #2. Process in Ada                           --
--                                                                      --
--  File: lab2.ada                                                      --
--  Task: F1: MC = MIN(A) * (MD * MB)                                   --
--        F2: MN = MAX(ML) * (MK * MO)                                  --
--        F3: Z = SORT(R) * SORT(MW * MV)                               --
--                                                                      --
--  Author: Stepanov Alexander, group IP - 31                           --
--  Date: 29.09.2015                                                    --
--                                                                      --
--------------------------------------------------------------------------

-- with Data, Ada.Text_IO, Ada.Integer_Text_IO, System.Multiprocessors;
-- use Ada.Text_IO, Ada.Integer_Text_IO, System.Multiprocessors;
with Data, Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
  
procedure Lab2 is 
    Size : Natural;
    Value : Integer;
begin 

    Put ("Input size: ");
    Get (Item => Size);
    Put ("Input value: ");
    Get (Item => Value);

    declare
        package mainData is new Data(Size, Value);
        use mainData; 
        --Processor numbers:
        -- CPU_1 :  CPU_Range := 0;
        -- CPU_2 :  CPU_Range := 1; 
        -- CPU_3 :  CPU_Range := 2;   
    begin

        declare
            -----------------------------------
            --            Task 1             --
            --  F1: MC = MIN(A) * (MD * MB)  --
            -----------------------------------
            task T1 is
                pragma Priority(15);
                pragma Task_Name ("T1");
                pragma Storage_Size(100000000);
                -- pragma CPU (CPU_3);
            end T1;

            task body T1 is
                A : Vector;
                MD, MB, MC : Matrix;
            begin
                delay 0.0;
                Put_line("Task T1 started");
                Input (A);
                Input (MD);
                Input (MB);
                F1 (A, MD, MB, MC);
                Output (MC);
                Put_line ("Task T1 finished");
            end T1;

            -----------------------------------
            --            Task 2             --
            --  F2: MN = MAX(ML) * (MK * MO) --
            -----------------------------------
            task T2 is 
                pragma Priority(15);
                pragma Task_Name ("T2");
                pragma Storage_Size(100000000);
                -- pragma CPU (CPU_1);
            end T2;

            task body T2 is
                ML, MK, MO, MN : Matrix;
            begin
                delay 0.1;
                Put_line ("Task T2 started");
                Input (ML);
                Input (MK);
                Input (MO);
                F2 (ML, MK, MO, MN);
                Output (MN);  
                Put_line ("Task T2 finished");
            end T2;

            --------------------------------------
            --            Task 3                --
            --  F3: Z = SORT(R) * SORT(MW * MV) --
            --------------------------------------
            task T3 is 
                pragma Priority(15);
                pragma Task_Name ("T3");
                pragma Storage_Size(100000000);
                -- pragma CPU (CPU_1);
            end T3;

            task body T3 is
                R, Z : Vector;
                MW, MV : Matrix; 
            begin 
                delay 0.2;
                Put_line ("Task T3 started");
                Input (R);
                Input (MW);
                Input (MV);
                F3 (R, MW, MV, Z);
                Output (Z);
                Put_line ("Task T3 finished");
            end T3;
        begin
            null;
        end;

        null;
    end;    

end Lab2;