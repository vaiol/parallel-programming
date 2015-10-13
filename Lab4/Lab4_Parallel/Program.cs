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
 * File: Program.cs						       *
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
    class Program
    {

        static void Main(string[] args)
        {
            int n;
            Console.WriteLine("Enter N: ");
            String line = Console.ReadLine();
            int.TryParse(line, out n);

            int value;
            Console.WriteLine("Enter value: ");
            line = Console.ReadLine();
            int.TryParse(line, out value);
            Console.WriteLine();

            Tasks tasks = new Tasks(n, value);
            
            //creating additional threads
            Thread t1 = new Thread(tasks.F1);
            Thread t2 = new Thread(tasks.F2);
            Thread t3 = new Thread(tasks.F3);

            //setting additional threads
            t1.Name = "TF1";
            t1.Priority = ThreadPriority.Highest;
            t2.Name = "TF2";
            t2.Priority = ThreadPriority.BelowNormal;
            t3.Name = "TF3";
            t3.Priority = ThreadPriority.Lowest;

            //starting additional threads
            t1.Start();
            t2.Start();
            t3.Start();

            //waiting additional threads
            t1.Join();
            t2.Join();
            t3.Join();

            Console.WriteLine("All threads are dead, exiting main thread");

            Console.Read();
        }
    }
 }
