package com.stepanov;

import java.util.Scanner;

/**
 * * * * * * * * * * * * * * * * * * * * * * * *
 *                                             * 
 *     Laboratory work #3. Threads in Java     *
 *                                             *
 * File: Main.java 							   *
 * Task: F1: MC = MIN(A) * (MD * MB)           *
 *       F2: MN = MAX(ML) * (MK * MO)          *
 *       F3: Z = SORT(R) * SORT(MW * MV)       *
 * 											   *
 * @author Stepanov Alexander				   *
 * @group IP-31								   *
 * @date 06.10.15                              *
 *                                             *
 * * * * * * * * * * * * * * * * * * * * * * * *  
 */
public class Main {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter N: ");
	    int n = sc.nextInt();
		System.out.print("Enter value: ");
		int value = sc.nextInt();
		System.out.println();
		System.out.println("all is good");
		Thread t1 = new Thread(new T1(n, value));
		t1.setPriority(Thread.NORM_PRIORITY);
		Thread t2 = new Thread(new T2(n, value));
		t2.setPriority(Thread.NORM_PRIORITY);
		Thread t3 = new Thread(new T3(n, value));
		t3.setPriority(Thread.NORM_PRIORITY);
		
		t1.start();
		t2.start();
		t3.start();

        try {
            t1.join();
            t2.join();
            t3.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("All threads are dead, exiting main thread");
	}
}
