// Laba5Parallel.cpp : Defines the entry point for the console application.
/**
* * * * * * * * * * * * * * * * * * * * * * * *
*                                             *
*    Laboratory work #5. Threads in Win32     *
*                                             *
* Task: F1: MC = MIN(A) * (MD * MB)		      *
*       F2: MN = MAX(ML) * (MK * MO)          *
*       F3: Z = SORT(R) * SORT(MW * MV)       *
* 											  *
* @author Stepanov Alexander				  *
* @group IP-31								  *
* @date 24.11.15                              *
*                                             *
* * * * * * * * * * * * * * * * * * * * * * * *
*/
#include "stdafx.h"

DWORD WINAPI F1(LPVOID);
DWORD WINAPI F2(LPVOID);
DWORD WINAPI F3(LPVOID);
std::vector<int> createVector(int, int);
std::vector<std::vector<int>> createMatrix(int, int);
void outputVector(std::vector<int>);
void outputMatrix(std::vector<std::vector<int>>);
std::vector<std::vector<int>> multiplication(std::vector<std::vector<int>>, std::vector<std::vector<int>>);
std::vector<int> multiplication(std::vector<int>, std::vector<std::vector<int>>);
std::vector<std::vector<int>> multiplication(int, std::vector<std::vector<int>>);
std::vector<int> sorting(std::vector<int>);
std::vector<std::vector<int>> sorting(std::vector<std::vector<int>>);
int minimum(std::vector<int>);
int maximum(std::vector<std::vector<int>>);

int _tmain(int argc, _TCHAR* argv[])
{
	std::cout << "Lab5 started" << std::endl;

	int n;
	std::cout << "Enter size: ";
	std::cin >> n;
	if (n > 3000)
	{
		n = 3000;
	}
	HANDLE t1, t2, t3;
	DWORD IDf1, IDf2, IDf3;

	t1 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) F1, (void*)n, 0, &IDf1);
	if (t1 == NULL)
		return GetLastError();
	t2 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) F2, (void*)n, 0, &IDf2);
	if (t2 == NULL)
		return GetLastError();
	t3 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) F3, (void*)n, 0, &IDf3);
	if (t3 == NULL)
		return GetLastError();

	SetThreadPriority(t1, 3);
	SetThreadPriority(t2, 3);
	SetThreadPriority(t3, 3);

	//ResumeThread(t1);
	//ResumeThread(t2);
	//ResumeThread(t3);

	WaitForSingleObject(t1, INFINITE);
	WaitForSingleObject(t2, INFINITE);
	WaitForSingleObject(t3, INFINITE);

	CloseHandle(t1);
	CloseHandle(t2);
	CloseHandle(t3);

	std::cout << "Lab5 finished" << std::endl;
	system("pause");
	return 0;
}

DWORD WINAPI F1(LPVOID iNum)
{	      
	std::cout << "Task F1 started" << std::endl;
	std::vector<int> a;
	std::vector<std::vector<int>> mc, md, mb;
	int value = 1;
	a = createVector(value, (int)iNum);
	md = createMatrix(value, (int)iNum);
	mb = createMatrix(value, (int)iNum);
	//F1: MC = MIN(A) * (MD * MB)
	mc = multiplication(minimum(a), multiplication(md, mb));
	outputMatrix(mc);
	std::cout << "Task F1 finished" << std::endl;
	return 0;
}

DWORD WINAPI F2(LPVOID iNum)
{ 
	std::cout << "Task F2 started" << std::endl;
	std::vector<std::vector<int>> mn, ml, mk, mo;
	int value = 1;
	ml = createMatrix(value, (int)iNum);
	mk = createMatrix(value, (int)iNum);
	mo = createMatrix(value, (int)iNum);
	//F2 : MN = MAX(ML) * (MK * MO)
	mn = multiplication(maximum(ml), multiplication(mk, mo));
	outputMatrix(mn);
	std::cout << "Task F2 finished" << std::endl;
	return 0;
}

DWORD WINAPI F3(LPVOID iNum)
{
	std::cout << "Task F3 started" << std::endl;
	std::vector<int> z, r;
	std::vector<std::vector<int>> mv, mw;
	int value = 1;
	r = createVector(value, (int)iNum);
	mw = createMatrix(value, (int)iNum);
	mv = createMatrix(value, (int)iNum);
	//F3 : Z = SORT(R) * SORT(MW * MV)
	z = multiplication(sorting(r), sorting(multiplication(mw, mv)));
	outputVector(z);
	std::cout << "Task F3 finished" << std::endl;
	return 0;
}

std::vector<int> createVector(int value, int size)
{
	std::vector<int> array;
	array.resize(size);
	for (int i = 0; i < array.size(); i++)
	{
		array[i] = value;
	}
	return array;
}
std::vector<std::vector<int>> createMatrix(int value, int size)
{
	std::vector<std::vector<int>> matrix;
	matrix.resize(size);
	for (int i = 0; i < matrix.size(); i++)
	{
		matrix[i].resize(size);
		for (int j = 0; j < matrix[i].size(); j++)
		{
			matrix[i][j] = value;
		}
	}
	return matrix;
}
void outputVector(std::vector<int> v)
{
	if (v.size() <= 10)
	{
		for (int i = 0; i < v.size(); i++)
		{
			std::cout << v[i] << " ";
		}
		std::cout << std::endl;
	}
}
void outputMatrix(std::vector<std::vector<int>> m)
{
	if (m.size() <= 10)
	{
		for (int i = 0; i < m.size(); i++)
		{
			for (int j = 0; j < m[i].size(); j++)
			{
				std::cout << m[i][j] << " ";
			}
			std::cout << std::endl;
		}
	}
}
std::vector<int> multiplication(std::vector<int> left, std::vector<std::vector<int>> right)
{
	std::vector<int> result;
	result.resize(left.size());
	for (int i = 0; i < result.size(); i++) {
		result[i] = 0;
		for (int j = 0; j < left.size(); j++) {
			result[i] = result[i] + left[j] * right[j][i];
		}
	}
	return result;
}
std::vector<std::vector<int>> multiplication(int left, std::vector<std::vector<int>> right)
{
	std::vector<std::vector<int>> result;
	result.resize(right.size());
	for (int i = 0; i < right.size(); i++) {
		result[i].resize(right[i].size());
		for (int j = 0; j < right[i].size(); j++) {
			result[i][j] = left * right[i][j];
		}
	}
	return result;
}
std::vector<std::vector<int>> multiplication(std::vector<std::vector<int>> left, std::vector<std::vector<int>> right) 
{
	std::vector<std::vector<int>> result;
	result.resize(left.size());
	for (int i = 0; i < left.size(); i++) {
		result[i].resize(left[i].size());
		for (int j = 0; j < left[i].size(); j++) {
			result[i][j] = 0;
			for (int y = 0; y < left.size(); y++) {
				result[i][j] = result[i][j] + left[i][y];
					right[y][j];
			}
		}
	}
	return result;
}
std::vector<int> sorting(std::vector<int> array)
{
	sort(array.begin(), array.end());
	return array;
}
std::vector<std::vector<int>> sorting(std::vector<std::vector<int>> matrix)
{
	for (int i = 0; i < matrix.size(); i++)
	{
		matrix[i] = sorting(matrix[i]);
	}
	return matrix;
}
int minimum(std::vector<int> array)
{
	int result = array[0];
	for (int i = 0; i < array.size(); i++) {
		if (array[i] < result) {
			result = array[i];
		}
	}
	return result;
}
int maximum(std::vector<std::vector<int>> matrix)
{
	int result = matrix[0][0];
	for (int i = 0; i < matrix.size(); i++) {
		for (int j = 0; j < matrix[i].size(); j++) {
			if (matrix[i][j] > result) {
				result = matrix[i][j];
			}
		}
	}
	return result;
}