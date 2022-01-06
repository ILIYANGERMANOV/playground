////////////////////////////////////////////////////////////
//
// Overloading.cpp
// Code sample accompanying topic 1.3.2 "Types and type signatures"
// See README.md for details
//
// Fundamentals of Practical Haskell Programming
// By Richard Cook
//
////////////////////////////////////////////////////////////

#include <string>
using namespace std;

void func(int x) { }

void func(const string& x) { }

void func(double x) { }

void func(int x, int y, int z) { }

void example()
{
    func(5);
    func("hello");
    func(5.0);
    func(5, 6, 7);
}
