////////////////////////////////////////////////////////////
//
// Inheritance.cpp
// Code sample accompanying topic 1.3.2 "Types and type signatures"
// See README.md for details
//
// Fundamentals of Practical Haskell Programming
// By Richard Cook
//
////////////////////////////////////////////////////////////

class BaseClass {
public:
    virtual void method() = 0;
};

class DerivedClass : public BaseClass {
public:
    void method() override { }
};

void f0(BaseClass& obj) {
    obj.method();
}

void f1() {
    DerivedClass obj;
    f0(obj);
}
