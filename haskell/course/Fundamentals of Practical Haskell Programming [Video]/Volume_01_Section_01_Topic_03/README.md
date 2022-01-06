# Fundamentals of Practical Haskell Programming

## 1.1.3 "The Haskell Way"

### Compiling the Haskell code samples

The samples in this directory will compile with the GHC 8.0.1 compiler installed using the Stack build tool and the LTS 7.8 resolver. The steps required to do this are described in detail in the course's installation and setup guide.

You can compile an individual source file to an executable as follows:

```bash
stack ghc -- --make -o AddBrackets.out AddBrackets.hs
```
