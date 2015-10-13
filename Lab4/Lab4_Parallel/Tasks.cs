using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

/**
 * * * * * * * * * * * * * * * * * * * * * * * *
 *                                             *
 *     Laboratory work #4. Threads in C#       *
 *                                             *
 * File: Tasks.cs						       *
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
    class Tasks : Data
    {

        public Tasks(int n, int value) : base(n, value)
        {
        }

//-----------------------------------------------------------------
        public void F1()
        {
            System.Console.WriteLine("Task F1 started");
            Vector a;
            Matrix mc, md, mb;
            a = inputVector();
            md = inputMatrix();
            mb = inputMatrix();
            mc = (md * mb) * min(a);
            Console.WriteLine("Task F1 result: ");
            output(mc);
            System.Console.WriteLine("Task F1 finished");
        }

//----------------------------------------------------------------
        public void F2()
        {
            System.Console.WriteLine("Task F2 started");
            Matrix mn, ml, mk, mo;
            ml = inputMatrix();
            mk = inputMatrix();
            mo = inputMatrix();
            mn = (mk * mo) * max(ml);
            Console.WriteLine("Task F2 result: ");
            output(mn);
            System.Console.WriteLine("Task F2 finished");
        }

//-----------------------------------------------------------------
        public void F3()
        {
            System.Console.WriteLine("Task F3 started");
            Vector z, r;
            Matrix mw, mv;
            r = inputVector();
            mw = inputMatrix();
            mv = inputMatrix();
            z = sort(r) * sort(mw * mv);
            Console.WriteLine("Task F3 result: ");
            output(z);
            System.Console.WriteLine("Task F3 finished");
        }
    }
}
