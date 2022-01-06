////////////////////////////////////////////////////////////
//
// ColourTaggedUnion.cpp
// Code sample accompanying topic 1.3.3 "Algebraic data types"
// See README.md for details
//
// Fundamentals of Practical Haskell Programming
// By Richard Cook
//
////////////////////////////////////////////////////////////

#include <cassert>
using namespace std;

struct RGB { int red; int green; int blue; };

struct CMYK { float cyan; float magenta; float yellow; float key; };

class Colour {
public:
    Colour(int r, int g, int b) : type(Type::RGB) { value.rgb = RGB{ r, g, b }; }
    Colour(float c, float m, float y, float k) : type(Type::CMYK) { value.cmyk = CMYK{ c, m, y, k }; }

    const enum class Type { RGB, CMYK } type;
    const RGB& rgb() const { assert(type == Type::RGB); return value.rgb; }
    const CMYK& cmyk() const { assert(type == Type::CMYK); return value.cmyk; }

private:
    union { RGB rgb; CMYK cmyk; } value;
};
