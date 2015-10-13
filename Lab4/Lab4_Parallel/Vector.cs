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
 * File: Vector.cs						       *
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
    class Vector
    {
        private int[] array;

        public Vector(int n)
        {
            array = new int[n];
        }

        public void set(int index, int value)
        {
            array[index] = value;
        }

        public int get(int index)
        {
            return array[index];
        }

        public int size()
        {
            return array.Length;
        }

        public String toString()
        {
            String res = "";
            for (int i = 0; i < array.Length; i++)
            {
                res += "   " + array[i];
            }
            return res;
        }

        // Overloading '*' operator:
        public static Vector operator *(Vector left, Matrix right)
        {
            Vector result = new Vector(left.size());
            for (int i = 0; i < left.size(); i++)
            {
                result.set(i, 0);
                for (int j = 0; j < left.size(); j++)
                {
                    result.set(i, result.get(i) + left.get(j) * right.get(j, i));
                }
            }
            return result;
        }

    }
}
