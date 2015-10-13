using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/**
 * * * * * * * * * * * * * * * * * * * * * * * *
 *                                             *
 *     Laboratory work #4. Threads in C#       *
 *                                             *
 * File: Data.cs						       *
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
    class Data
    {
        private int n;
        private int value;

        protected Data (int n, int value)
        {
            this.n = n;
            this.value = value;
        }

        protected Vector inputVector()
        {
            Vector vector = new Vector(n);
            for (int i = 0; i < n; i++)
            {
                vector.set(i, value);
            }
            return vector;
        }

        protected Matrix inputMatrix()
        {
            Matrix matrix = new Matrix(n);
            for (int i = 0; i < n; i++)
            {
                for (int j = 0; j < n; j++)
                {
                    matrix.set(i, j, value);
                }
            }
            return matrix;
        }

        protected void output(Vector vector) {
            if (vector.size() < 10)
            {
                Console.WriteLine(vector.toString());
            }

        }

        protected void output(Matrix matrix) {
		    if(matrix.size() < 10)
            {
			    Console.WriteLine(matrix.toString());
		    }
        }

        

        protected int min(Vector vector)
        {
            int min = vector.get(0);

            for (int i = 0; i < vector.size(); i++)
            {
                if (min > vector.get(i))
                {
                    min = vector.get(i);
                }
            }
            return min;
        }

        protected int max(Matrix matrix)
        {
            int max = matrix.get(0).get(0);

            for (int i = 0; i < matrix.size(); i++)
            {
                Vector vector = matrix.get(i);
                for (int j = 0; j < vector.size(); j++)
                {
                    if (max < vector.get(i))
                    {
                        max = vector.get(i);
                    }
                }
            }
            return max;
        }

        protected Vector sort(Vector vector)
        {
            int[] res = new int[vector.size()];
            for (int i = 0; i < res.Length; i++)
            {
                res[i] = vector.get(i);
            }
            Array.Sort(res);
            Vector sortedVector = new Vector(res.Length);
            for (int j = 0; j < sortedVector.size(); j++)
            {
                sortedVector.set(j, res[j]);
            }
            return sortedVector;
        }

        protected Matrix sort(Matrix matrix)
        {
            Vector[] vectors = new Vector[matrix.size()];
            for (int i = 0; i < matrix.size(); i++)
            {
                vectors[i] = sort(matrix.get(i));
            }
            return new Matrix(vectors);
        }
    }
}
