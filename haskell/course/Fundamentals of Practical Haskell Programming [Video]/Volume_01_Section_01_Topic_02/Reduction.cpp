////////////////////////////////////////////////////////////
//
// Reduction.cpp
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

int main() {
    vector<int> xs{ 1, 2, 3 };
    int total = 0;
    for (auto x : xs) {
        total += x;
    }

    cout << total << endl;
}
