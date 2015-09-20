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

generic

    N : in Integer;
    
package Data is
      
    type Vector is private;
    type Matrix is private;
       
    -- F1: MC = MIN(A) * (MD * MB)
    procedure F1(A : in Vector; MD, MB: in Matrix; MC: out Matrix);
    -- F2: MN = MAX(ML) * (MK * MO)     
    procedure F2(ML, MK, MO: in Matrix; MN: out Matrix); 
    -- F3: Z = SORT(R) * SORT(MW * MV)
    procedure F3(R: in Vector; MW, MV: in Matrix; Z: out Vector); 

    -- input values for vectors
    procedure Input_Vector(V : out Vector);
    -- input values for matrices
    procedure Input_Matrix(MA : out Matrix);
    -- output values of vectors
    procedure Output_Vector(V : in Vector);
    -- output values of matricescr
    procedure Output_Matrix(MA : in Matrix);

    private
        subtype Index is Integer range 1..N;
        type Vector is array (Index) of Integer;
        type Matrix is array (Index) of Vector;

end Data;
