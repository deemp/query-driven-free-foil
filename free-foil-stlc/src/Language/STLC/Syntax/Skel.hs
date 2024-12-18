-- File generated by the BNF Converter (bnfc 2.9.5).

-- Templates for pattern matching on abstract syntax

{-# OPTIONS_GHC -fno-warn-unused-matches #-}

module Language.STLC.Syntax.Skel where

import Prelude (($), Either(..), String, (++), Show, show)
import qualified Language.STLC.Syntax.Abs

type Err = Either String
type Result = Err String

failure :: Show a => a -> Result
failure x = Left $ "Undefined case: " ++ show x

transVar :: Language.STLC.Syntax.Abs.Var -> Result
transVar x = case x of
  Language.STLC.Syntax.Abs.Var string -> failure x

transExp :: Language.STLC.Syntax.Abs.Exp -> Result
transExp x = case x of
  Language.STLC.Syntax.Abs.ExpAbs var exp -> failure x
  Language.STLC.Syntax.Abs.ExpApp exp1 exp2 -> failure x
  Language.STLC.Syntax.Abs.ExpUnit -> failure x
  Language.STLC.Syntax.Abs.ExpVar var -> failure x

transType :: Language.STLC.Syntax.Abs.Type -> Result
transType x = case x of
  Language.STLC.Syntax.Abs.TypeFunc type_1 type_2 -> failure x
  Language.STLC.Syntax.Abs.TypeUnit -> failure x

transCtxVar :: Language.STLC.Syntax.Abs.CtxVar -> Result
transCtxVar x = case x of
  Language.STLC.Syntax.Abs.CtxVar var type_ -> failure x

transCtx :: Language.STLC.Syntax.Abs.Ctx -> Result
transCtx x = case x of
  Language.STLC.Syntax.Abs.Ctx ctxvars -> failure x

transExpUnderCtx :: Language.STLC.Syntax.Abs.ExpUnderCtx -> Result
transExpUnderCtx x = case x of
  Language.STLC.Syntax.Abs.ExpUnderCtx ctx exp -> failure x

transCommand :: Language.STLC.Syntax.Abs.Command -> Result
transCommand x = case x of
  Language.STLC.Syntax.Abs.CommandTypeCheck expunderctx type_ -> failure x
  Language.STLC.Syntax.Abs.CommandTypeSynth expunderctx -> failure x
