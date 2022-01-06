# Fundamentals of Practical Haskell Programming

## 1.2.4 "Debugging with GHCi"

### Build the `catn` tool

`catn` is a regular Stack-based project. You'll need to build it and install it to somewhere on your search path:

```bash
cd catn
stack install
```

The command `stack install` will build and copy the binaries to your search path. See the `README.md` in the `catn` for more information.

### Compiling the Haskell code samples

The samples in this directory will compile with the GHC 8.0.1 compiler installed using the Stack build tool and the LTS 7.8 resolver. The steps required to do this are described in detail in the course's installation and setup guide.

You can compile an individual source file to an executable as follows:

```bash
stack ghc -- -o Program4_exe Program4.hs
```

Please follows course video for instructions on how to debug this sample in GHCi.
