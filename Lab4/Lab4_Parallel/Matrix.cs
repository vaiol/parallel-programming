﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


/**
 * * * * * * * * * * * * * * * * * * * * * * * *
 *                                             *
 *     Laboratory work #4. Threads in C#       *
 *                                             *
 * File: Matrix.cs						       *
 * Task: F1: MC = MIN(A) * (MD * MB)           *
 *       F2: MN = MAX(ML) * (MK * MO)          *
 *       F3: Z = SORT(R) * SORT(MW * MV)       *
 * 											   *
 * @author Stepanov Alexander				   *
 * @group IP-31								   *
 * @date 20.10.15                              *
 *                                             *
 * * * * * * * * * * * * * * * * * * * * * * * *
 */
namespace pro_lab4
{
    class Matrix
    {
        private Vector[] vector;

        public Matrix(int n)
        {
            vector = new Vector[n];
            for (int i = 0; i < vector.Length; i++)
            {
                vector[i] = new Vector(n);
            }
        }

        public Matrix(Vector[] vectors)
        {
            vector = vectors;
        }

        public void set(int n, int m, int val)
        {
            vector[n].set(m, val);
        }

        public int get(int n, int m)
        {
            return vector[n].get(m);
        }

        public Vector get(int index)
        {
            return vector[index];
        }

        public int size()
        {
            return vector.Length;
        }

        public String toString()
        {
            String res = "";
            for (int i = 0; i < vector.Length; i++)
            {
                res += vector[i].toString();
                if (i != vector.Length - 1)
                {
                    res += "\n";
                }
            }
            return res;
        }

        // Overloading '*' operator:
        public static Matrix operator*(Matrix left, Matrix right)
        {
		    Matrix result = new Matrix(left.size());
		    for (int i = 0; i < left.size(); i++)
            {
    			for (int j = 0; j < left.size(); j++)
                {
				    result.set(i, j, 0);
				    for (int y = 0; y < left.size(); y++)
                    {
    					result.set(i, j, result.get(i, j) + left.get(i, y)
	    						* right.get(y, j));
				    }
			    }
		    }
		    return result;
	    }


        public static Matrix operator*(Matrix left, int right)
        {
            Matrix result = new Matrix(left.size());
            for (int i = 0; i < left.size(); i++)
            {
                Vector vector = left.get(i);
                for (int j = 0; j < vector.size(); j++)
                {
                    result.set(i, j, right * left.get(i, j));
                }
            }
            return result;
        }
    }
}
