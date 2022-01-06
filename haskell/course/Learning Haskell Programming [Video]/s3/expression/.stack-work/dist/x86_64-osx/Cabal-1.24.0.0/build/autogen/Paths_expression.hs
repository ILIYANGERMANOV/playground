{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_expression (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/hakim/OneDrive/packt-haskell/Videos/src/s3/expression/.stack-work/install/x86_64-osx/lts-7.7/8.0.1/bin"
libdir     = "/Users/hakim/OneDrive/packt-haskell/Videos/src/s3/expression/.stack-work/install/x86_64-osx/lts-7.7/8.0.1/lib/x86_64-osx-ghc-8.0.1/expression-0.1.0.0-LLH3ZZG0tgVL93rajMeVXb"
datadir    = "/Users/hakim/OneDrive/packt-haskell/Videos/src/s3/expression/.stack-work/install/x86_64-osx/lts-7.7/8.0.1/share/x86_64-osx-ghc-8.0.1/expression-0.1.0.0"
libexecdir = "/Users/hakim/OneDrive/packt-haskell/Videos/src/s3/expression/.stack-work/install/x86_64-osx/lts-7.7/8.0.1/libexec"
sysconfdir = "/Users/hakim/OneDrive/packt-haskell/Videos/src/s3/expression/.stack-work/install/x86_64-osx/lts-7.7/8.0.1/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "expression_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "expression_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "expression_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "expression_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "expression_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
