# Fundamentals of Practical Haskell Programming

## 1.1.2 "The FP Way"

### Compiling the C++ code samples

#### Windows

To use the supplied `build.cmd` script, you'll need the Visual Studio `cl` command-line C++ compiler. Running this script from a Visual Studio developer command prompt will build all the C++ and Haskell code samples.

You can compile an individual C++ source file to an executable as follows:

```cmd
cl /nologo /EHsc /FeTraversal_cpp.exe Traversal.cpp
```

Alternatively, if you prefer to use a Cygwin, MSYS or MinGW terminal, you can use the supplied `g++` compiler and `make` tool.

#### macOS

To use the supplied `Makefile`, you will need to have a `g++` C++ compiler as well a `make` tool. Xcode installations will typically install a usable version of `make` and install a `g++` alias or symlink linking to the Clang C++ compiler. You can build all the C++ and Haskell code samples by running `make` from within this directory.

You can compile an individual C++ source file to an executable as follows:

```bash
g++ -std=c++11 -o Traversal_cpp.out Traversal.cpp
```

#### Linux

To use the supplied `Makefile`, you will need to have the `g++` C++ compiler installed. Any recent version should work. You'll also need `make` which is available on most systems. You can build all the C++ and Haskell code samples by running `make` from within this directory.

You can compile an individual C++ source file to an executable as follows:

```bash
g++ -std=c++11 -o Traversal_cpp.out Traversal.cpp
```

#### Other platforms

The C++ code should compile with any reasonably modern C++ compiler.

### Compiling the Haskell code samples

The samples in this directory will compile with the GHC 8.0.1 compiler installed using the Stack build tool and the LTS 7.8 resolver. The steps required to do this are described in detail in the course's installation and setup guide.

You can compile an individual source file to an executable as follows:

```bash
stack ghc -- --make -o Traversal.out Traversal.hs
```
