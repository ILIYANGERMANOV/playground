////////////////////////////////////////////////////////////
//
// Composition.cpp
// Code sample accompanying topic 1.1.2 "The FP Way"
// See README.md for details
//
// Fundamentals of Practical Haskell Programming
// By Richard Cook
//
////////////////////////////////////////////////////////////

#include <iostream>
#include <vector>
using namespace std;

int f(int x) { return x + 10; }

int g(int x) { return x * x; }

int main() {
    vector<int> xs{ 1, 2, 3 };
    vector<int> ys;
    for (auto x : xs) {
        ys.emplace_back(g(f(x)));
    }

    for (auto y : ys) {
        cout << y << endl;
    }
}
