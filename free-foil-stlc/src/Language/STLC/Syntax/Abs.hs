-- File generated by the BNF Converter (bnfc 2.9.5).

{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- | The abstract syntax of language Syntax.

module Language.STLC.Syntax.Abs where

import Prelude (String)
import qualified Prelude as C (Eq, Ord, Show, Read)
import qualified Data.String

import qualified Data.Data    as C (Data, Typeable)
import qualified GHC.Generics as C (Generic)

data Exp = ExpAbs Var Exp | ExpApp Exp Exp | ExpUnit | ExpVar Var
  deriving (C.Eq, C.Ord, C.Show, C.Read, C.Data, C.Typeable, C.Generic)

data Type = TypeFunc Type Type | TypeUnit
  deriving (C.Eq, C.Ord, C.Show, C.Read, C.Data, C.Typeable, C.Generic)

data CtxVar = CtxVar Var Type
  deriving (C.Eq, C.Ord, C.Show, C.Read, C.Data, C.Typeable, C.Generic)

data Ctx = Ctx [CtxVar]
  deriving (C.Eq, C.Ord, C.Show, C.Read, C.Data, C.Typeable, C.Generic)

data ExpUnderCtx = ExpUnderCtx Ctx Exp
  deriving (C.Eq, C.Ord, C.Show, C.Read, C.Data, C.Typeable, C.Generic)

data Command
    = CommandTypeCheck ExpUnderCtx Type | CommandTypeSynth ExpUnderCtx
  deriving (C.Eq, C.Ord, C.Show, C.Read, C.Data, C.Typeable, C.Generic)

newtype Var = Var String
  deriving (C.Eq, C.Ord, C.Show, C.Read, C.Data, C.Typeable, C.Generic, Data.String.IsString)
