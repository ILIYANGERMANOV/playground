# Fundamentals of Practical Haskell Programming

## 1.2.2 "Whitespace, layout and scoping"

### Compiling the Haskell code samples

The samples in this directory will compile with the GHC 8.0.1 compiler installed using the Stack build tool and the LTS 7.8 resolver. The steps required to do this are described in detail in the course's installation and setup guide.

You can compile an individual source file to an executable as follows:

```bash
stack ghc -- -o Program1.out Program1.hs
```

You can also compile without generating output files as follows:

```bash
stack ghc -- -fno-code -o Program1.out Program1.hs
```

Note that `Program3.hs` and `Program4.hs` are both examples of source files that will not compile since they contain invalid indentation.
