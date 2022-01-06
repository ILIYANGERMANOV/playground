////////////////////////////////////////////////////////////
//
// Templates.cpp
// Code sample accompanying topic 1.3.2 "Types and type signatures"
// See README.md for details
//
// Fundamentals of Practical Haskell Programming
// By Richard Cook
//
////////////////////////////////////////////////////////////

#include <iostream>
using namespace std;

class C { };
bool operator>(const C& c0, const C& c1) { return false; }
ostream& operator<<(ostream& os, const C& c) { return os; }

template <typename T> T myMax(T a, T b) {
    return a > b ? a : b;
}

template <> const char* myMax(const char* a, const char* b) {
    return strcmp(a, b) > 0 ? a : b;
}

void f() {
    cout << myMax(9, 5) << endl;
    cout << myMax(9.0, 5.0) << endl;
    cout << myMax(C{ }, C{ }) << endl;
    cout << myMax("foo", "bar") << endl;
}
