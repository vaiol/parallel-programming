package com.stepanov;

/**
 * * * * * * * * * * * * * * * * * * * * * * * *
 *                                             *
 *     Laboratory work #3. Threads in Java     *
 *                                             *
 * File: T1.java 							   *
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
public class T1 extends Data implements Runnable {

	public T1(int n, int value) {
		super(n, value);
	}

	public void run() {
		System.out.println("Task F1 started");
		Vector a;
		Matrix md, mb, mc;
        a = inputVector();
        md = inputMatrix();
        mb = inputMatrix();
        mc = f1(a, mb, md);
		output(mc);
		System.out.println("Task F1 finished");
	}
	
	/**
	 * F1: MC = MIN(A) * (MD * MB)
	 */
	private Matrix f1(Vector a, Matrix md, Matrix mb) {
		return multiplication(min(a), multiplication(md, mb));
		
	}

}
