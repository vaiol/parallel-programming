package com.stepanov;

/**
 * * * * * * * * * * * * * * * * * * * * * * * *
 *                                             *
 *     Laboratory work #3. Threads in Java     *
 *                                             *
 * File: T2.java 							   *
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
public class T2 extends Data implements Runnable {

	public T2(int n, int value) {
		super(n, value);
	}

	public void run() {
		System.out.println("Task F2 started");
		Matrix ml, mk, mo, mn;
		ml = inputMatrix();
		mk = inputMatrix();
		mo = inputMatrix();
		mn = f2(ml, mk, mo);
		output(mn);
		System.out.println("Task F2 finished");
	}

	/**
	 * F2: MN = MAX(ML) * (MK * MO)
	 */
	private Matrix f2(Matrix ml, Matrix mk, Matrix mo) {
		return multiplication(max(ml), multiplication(mk, mo));
	}
}
