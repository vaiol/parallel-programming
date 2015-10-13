package com.stepanov;

import java.util.Arrays;

/**
 * * * * * * * * * * * * * * * * * * * * * * * *
 *                                             *
 *     Laboratory work #3. Threads in Java     *
 *                                             *
 * File: Data.java 							   *
 * Task: F1: MC = MIN(A) * (MD * MB)           *
 *       F2: MN = MAX(ML) * (MK * MO)          *
 *       F3: Z = SORT(R) * SORT(MW * MV)       *
 * 											   *
 * @author Stepanov Alexander				   *
 * @group IP-31								   *
 * @date 13.10.15                              *
 *                                             *
 * * * * * * * * * * * * * * * * * * * * * * * *
 */
public class Data {
	
	private final int n;
	private final int value;
	
	protected Data (int n, int value) {
		this.n = n ;
		this.value = value;
	}
	
	protected Vector inputVector() {
		Vector vector = new Vector(n); 
		for(int i = 0; i < vector.size(); i++) {
			vector.set(i, value);
		}
		return vector;
	}
	
	protected Matrix inputMatrix() {
		Matrix matrix = new Matrix(n);
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++) {
				matrix.set(i, j, value);	
			}
		}
		return matrix;
	}

	protected void output(Vector vector) {
		if(vector.size() < 10) {
			System.out.print(vector.toString());

            System.out.println();
        }
	}

	protected void output(Matrix matrix) {
		if(matrix.size() < 10) {
			System.out.print(matrix.toString());
            System.out.println();
		}
	}

    protected Matrix multiplication(int left, Matrix right) {
        Matrix result = new Matrix(right.size());
        for (int i = 0; i < right.size(); i++) {
            Vector vector = right.get(i);
            for (int j = 0; j < vector.size(); j++) {
                result.set(i, j, left * right.get(i, j));
            }
        }
        return result;
    }
	
	protected Vector multiplication(Vector left, Matrix right) {
		Vector result = new Vector(left.size());
		for (int i = 0; i < left.size(); i++) {
			result.set(i, 0);
			for (int j = 0; j < left.size(); j++) {
				result.set(i, result.get(i) + left.get(j) * right.get(j, i));
			}
		}
		return result;
	}
	
	protected Matrix multiplication(Matrix left, Matrix right) {
		Matrix result = new Matrix(left.size());
		for (int i = 0; i < left.size(); i++) {
			for (int j = 0; j < left.size(); j++) {
				result.set(i, j, 0);
				for (int y = 0; y < left.size(); y++) {
					result.set(i, j, result.get(i, j) + left.get(i, y)
							* right.get(y, j));
				}
			}
		}
		return result;
	}
    protected int min(Vector vector){
        int min = vector.get(0);

        for (int i = 0; i < vector.size(); i++) {
            if(min > vector.get(i)){
                min = vector.get(i);
            }
        }
        return min;
    }

    protected int max(Matrix matrix) {
        int max = matrix.get(0).get(0);

        for (int i = 0; i < matrix.size(); i++) {
            Vector vector = matrix.get(i);
            for (int j = 0; j < vector.size(); j++) {
                if (max < vector.get(i)) {
                    max = vector.get(i);
                }
            }
        }
        return max;
    }

	protected Vector sort(Vector vector) {
		int[] res = new int[vector.size()];
		for(int i = 0; i < res.length; i++) {
			res[i] = vector.get(i);
		}
		Arrays.sort(res);
		Vector sortedVector = new Vector(res.length);
		for(int j = 0; j < sortedVector.size(); j++) {
			sortedVector.set(j, res[j]);
		}
		return sortedVector;
	}

    protected Matrix sort(Matrix matrix) {
        Vector[] vectors = new Vector[matrix.size()];
        for (int i = 0; i < matrix.size(); i++) {
            vectors[i] = sort(matrix.get(i));
        }
        return new Matrix(vectors);
    }

}
