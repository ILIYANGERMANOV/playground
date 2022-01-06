////////////////////////////////////////////////////////////
//
// Filter.cpp
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
    vector<int> xs{ 1, 2, 3, 4, 5, 6 };
    vector<int> ys;
    for (auto x : xs) {
        if (x > 3) {
            ys.emplace_back(x);
        }
    }

    for (auto y : ys) {
        cout << y << endl;
    }
}
