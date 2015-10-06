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
public class T2 extends Thread {

	private final int n;
	private final int value;
	private final int sleep;
	private Data data;

	public T2(int n, int value, int sleep) {
		this.n = n ;
		this.value = value;
		this.sleep = sleep;
		this.data = new Data(n, value);
	}

	public void run() {
		try {
			Thread.sleep(sleep);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Task F2 started");
		Matrix ml, mk, mo, mn;
		ml = data.inputMatrix();
		mk = data.inputMatrix();
		mo = data.inputMatrix();
		mn = f2(ml, mk, mo);
		data.output(mn);
		System.out.println("Task F2 finished");
	}
	
	/**
	 * F2: MN = MAX(ML) * (MK * MO)
	 */
	private Matrix f2(Matrix ml, Matrix mk, Matrix mo) {
		return data.multiplication(data.max(ml), data.multiplication(mk, mo));
	}
	


}
