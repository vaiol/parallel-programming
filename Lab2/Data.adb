--------------------------------------------------------------------------
--                                                                      --
--                     Parallel Programming                             --
--         Laboratory work #2. Process in Ada                           --
--                                                                      --
--  File: lab1.ada                                                      --
--  Task: F1: MC = MIN(A) * (MD * MB)                                   --
--        F2: MN = MAX(ML) * (MK * MO)                                  --
--        F3: Z = SORT(R) * SORT(MW * MV)                               --
--                                                                      --
--  Author: Stepanov Alexander, group IP - 31                           --
--  Date: 29.09.2015                                                    --
--                                                                      --
--------------------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings, Ada.Strings.Fixed;
use Ada.Text_IO, Ada.Integer_Text_IO;
    
package body Data is

    ---------------------------------------------------------------------
    --        additional functions for calculation (prototypes)        --
    ---------------------------------------------------------------------      
    -- Matrix * Matrix
    function "*" (Left  : Matrix; Right : Matrix) return Matrix; 
    -- Vector * Matrix
    function "*" (Left  : Vector; Right : Matrix) return Vector;
    -- Integer * Matrix 
    function "*" (Left  : Integer; Right : Matrix) return Matrix; 
    -- maximum value of the matrix
    function Max (A : Matrix) return Integer;
    -- minimum value of the vector
    function Min (A : Vector) return Integer;
    -- vector sorting
    function Sort (A : Vector) return Vector;
    -- matrix sorting
    function Sort (MA : Matrix) return Matrix;

    ---------------------------------------------------------------------
    --                        main procedures                          --
    ---------------------------------------------------------------------
    --  F1: MC = MIN(A) * (MD * MB)
    procedure F1 (A : in Vector; MD, MB: in Matrix; MC: out Matrix) is
    begin
        MC := MIN(A) * (MD * MB);      
    end F1;

    -- F2: MN = MAX(ML) * (MK * MO)
    procedure F2 (ML, MK, MO: in Matrix; MN: out Matrix) is
    begin
        MN := MAX(ML) * (MK * MO);
    end F2;

    -- F3: Z = SORT(R) * SORT(MW * MV)  
    procedure F3 (R: in Vector; MW, MV: in Matrix; Z: out Vector) is
    begin
        Z := SORT(R) * SORT(MW * MV);
    end F3;

    ----------------------------------------------------------------------
    --        additional functions for calculation (realization)        --
    ---------------------------------------------------------------------- 
    -- Matrix * Matrix
    function "*" (Left  :  Matrix; Right :  Matrix) return Matrix is
        Result : Matrix;
    begin
        for i in Index loop
            for J in Index loop
                Result(I)(J) := 0;
                    for K in Index loop
                        Result(I)(J) := Result(I)(J) + Left(I)(K) * Right(K)(J);
                    end loop;
                end loop;
        end loop;
        return Result;
    end  "*";

    -- Vector * Matrix
    function "*" (Left : Vector; Right : Matrix) return Vector is
        R : Vector;
    begin
        for J in Index loop
            R(j) := 0;
            begin
                for K in Index loop
                    R(J) := R(J) + Left(K) * Right(K)(J);
                end loop;
            end;
        end loop;
        return R;
    end "*";

    -- Integer * Matrix
    function "*" (Left : Integer; Right : Matrix) return Matrix is
        Result : Matrix;
    begin
        for i in Index loop
            for j in Index loop
                Result(i)(j) := Left * Right(i)(j);
            end loop;
        end loop;
        return Result;
    end "*";

    -- Maximum value of the matrix
    function Max (A : Matrix) return Integer is
        Var : Integer := A(1)(1);
    begin
        for i in Index loop
            for j in Index loop
                if A(i)(j) > Var then
                    Var := A(i)(j);
                end if;
            end loop;
        end loop;
        return Var;
    end Max;   

    -- Minimum value of the vector
    function Min (A : Vector) return Integer is
        Var : Integer := A(1);
    begin
        for i in Index loop          
            if A(i) < Var then
                Var := A(i);
            end if;
        end loop;           
        return Var;
    end Min;        
      
    -- vector sorting
    function Sort (A : Vector) return Vector is
        M : Vector := A;
        Buf : Integer;
        K : Integer;
    begin
        for i in 1..(Size - 1) loop
            K := i;
            for j in (i + 1)..Size loop
                if M(k) > M(j) then
                    K := j;
                end if;
            end loop;
            Buf := M(k);
            M(k) := M(i);
            M(i) := buf;
        end loop;
        return M;
    end Sort;

    -- matrix sorting
    function Sort (MA : Matrix) return Matrix is
        MT : Matrix;
    begin
        for i in Index loop
            MT(i) := Sort(MA(i));
        end loop;
        return MT;
    end Sort;

    ---------------------------------------------------------------------
    --                     input\output functions:                     --
    ---------------------------------------------------------------------
    -- input values for vectors
    procedure Input (V : out Vector) is
    begin
        for I in Index loop
            V(I) := Value;
        end loop;
    end Input;

    -- input values for matrices
    procedure Input (MA : out Matrix) is
    begin
        for I in Index loop
            for J in Index loop
                MA(I)(J) := Value;
            end loop;
        end loop;
    end Input;

    -- output values of vectors
    procedure Output (V : in Vector) is
    begin
        if (Size < 10) then
            New_Line;
            for I in Index loop
                Put(Item => V(I), Width => 5);
            end loop;
            New_Line;
        end if;
    end Output;

    -- output values for matrices
    procedure Output (MA : in Matrix) is
    begin
        if (Size < 10) then
            New_Line;
            for I in Index loop
                for J in Index loop
                    Put(Item => MA(i)(j), Width => 5);
                end loop;
                New_line;
            end loop;
        end if;
    end Output;  

end Data;