-- |
-- Module      : Main
-- Copyright   : (c) 2014 Andreas Meingast <ameingast@gmail.com>
--               (c) 2016 Timo von Holtz <tvh@tvholtz.de>
--
-- License     : BSD-style
-- Maintainer  : tvh@tvholtz.de
-- Stability   : experimental
-- Portability : GHC
--
-- The test entry-point for postgresql-simple-migration.

{-# LANGUAGE OverloadedStrings #-}

module Main
    ( main
    ) where

import Hasql.Connection
import Hasql.MigrationTest
import           Test.Hspec                               (hspec)

main :: IO ()
main = do
    con <- acquire "dbname=test"
    case con of
      Right con -> hspec (migrationSpec con)
      Left err -> putStrLn $ show err
