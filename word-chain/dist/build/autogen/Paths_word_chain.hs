module Paths_word_chain (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jchae/.cabal/bin"
libdir     = "/Users/jchae/.cabal/lib/x86_64-osx-ghc-7.10.3/word-chain-0.1.0.0-6kG3BpNGaQHCEewlzAhz9L"
datadir    = "/Users/jchae/.cabal/share/x86_64-osx-ghc-7.10.3/word-chain-0.1.0.0"
libexecdir = "/Users/jchae/.cabal/libexec"
sysconfdir = "/Users/jchae/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "word_chain_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "word_chain_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "word_chain_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "word_chain_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "word_chain_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
