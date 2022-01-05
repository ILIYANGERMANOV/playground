{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_hello_world (
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

bindir     = "/home/iliyan/learning/repo/playground/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/150ff6a3522aace5e4c4e8c155d0d1003d08b742cba099b2e9dd0d2105fabc60/8.0.1/bin"
libdir     = "/home/iliyan/learning/repo/playground/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/150ff6a3522aace5e4c4e8c155d0d1003d08b742cba099b2e9dd0d2105fabc60/8.0.1/lib/x86_64-linux-ghc-8.0.1/hello-world-0.1.0.0"
datadir    = "/home/iliyan/learning/repo/playground/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/150ff6a3522aace5e4c4e8c155d0d1003d08b742cba099b2e9dd0d2105fabc60/8.0.1/share/x86_64-linux-ghc-8.0.1/hello-world-0.1.0.0"
libexecdir = "/home/iliyan/learning/repo/playground/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/150ff6a3522aace5e4c4e8c155d0d1003d08b742cba099b2e9dd0d2105fabc60/8.0.1/libexec"
sysconfdir = "/home/iliyan/learning/repo/playground/haskell/hello-world/.stack-work/install/x86_64-linux-tinfo6/150ff6a3522aace5e4c4e8c155d0d1003d08b742cba099b2e9dd0d2105fabc60/8.0.1/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hello_world_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hello_world_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "hello_world_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hello_world_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hello_world_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
