package com.stepanov;

/**
 * * * * * * * * * * * * * * * * * * * * * * * *
 *                                             *
 *     Laboratory work #3. Threads in Java     *
 *                                             *
 * File: T3.java 							   *
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
public class T3 extends Data implements Runnable {

	public T3(int n, int value) {
		super(n, value);
	}

	public void run() {
		System.out.println("Task F3 started");
		Vector r, z;
		Matrix mw, mv;
		r = inputVector();
		mw = inputMatrix();
		mv = inputMatrix();
		z = f3(r, mw, mv);
		output(z);
		System.out.println("Task F3 finished");
	}
	
	/**
	 * F3: Z = SORT(R) * SORT(MW * MV)
	 */
	private Vector f3(Vector r, Matrix mw, Matrix mv) {
		return multiplication(sort(r), sort(multiplication(mw, mv)));
	}
}
