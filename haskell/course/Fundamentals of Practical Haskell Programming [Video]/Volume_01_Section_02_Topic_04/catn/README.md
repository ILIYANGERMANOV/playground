# `catn`

Simple command-line tool for displaying source files with line numbers in terminal

## Overview

This program is provided as a service to developers on Windows who do not have access to a Posix-style `cat -n` command. Linux and macOS users can continue to use their built-in `cat -n` command as they see fit.

## Building and copying to search path

```cmd
stack install
```

This will both build and copy the `catn` binary into a location on your system search path.

## Creating GHCi `:catn` command

Add the following line to your `ghci.conf` configuration file (located at `%APPDATA%\ghc\ghci.conf` on Windows or `~/.ghc/ghci.conf` on Linux/macOS) after installing `catn` to a location on your search path:

```ghci
:def catn \p -> return $ ":! catn \"" ++ p ++ "\""
```

## More information

A more sophisticated version of this tool is available on [GitHub][catnplus] which features paging and coloured output.

[catnplus]: https://github.com/rcook/catnplus
