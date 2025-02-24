-- -*- haskell -*- File generated by the BNF Converter (bnfc 2.9.6).

-- Parser definition for use with Happy
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
{-# LANGUAGE PatternSynonyms #-}

module Language.STLC.Syntax.Par
  ( happyError
  , myLexer
  , pExp1
  , pExp2
  , pExp3
  , pExp4
  , pExp
  , pType1
  , pType2
  , pType
  , pCtxVar
  , pListCtxVar
  , pCtx
  , pExpUnderCtx
  , pCommand
  , pListCommand
  ) where

import Prelude

import qualified Language.STLC.Syntax.Abs
import Language.STLC.Syntax.Lex

}

%name pExp1 Exp1
%name pExp2 Exp2
%name pExp3 Exp3
%name pExp4 Exp4
%name pExp Exp
%name pType1 Type1
%name pType2 Type2
%name pType Type
%name pCtxVar CtxVar
%name pListCtxVar ListCtxVar
%name pCtx Ctx
%name pExpUnderCtx ExpUnderCtx
%name pCommand Command
%name pListCommand ListCommand
-- no lexer declaration
%monad { Err } { (>>=) } { return }
%tokentype {Token}
%token
  '#typecheck' { PT _ (TS _ 1)   }
  '#typesynth' { PT _ (TS _ 2)   }
  '('          { PT _ (TS _ 3)   }
  '()'         { PT _ (TS _ 4)   }
  ')'          { PT _ (TS _ 5)   }
  ','          { PT _ (TS _ 6)   }
  '->'         { PT _ (TS _ 7)   }
  '.'          { PT _ (TS _ 8)   }
  ':'          { PT _ (TS _ 9)   }
  ';'          { PT _ (TS _ 10)  }
  '<='         { PT _ (TS _ 11)  }
  '\\'         { PT _ (TS _ 12)  }
  'unit'       { PT _ (TS _ 13)  }
  '|-'         { PT _ (TS _ 14)  }
  L_Var        { PT _ (T_Var $$) }

%%

Var :: { Language.STLC.Syntax.Abs.Var }
Var  : L_Var { Language.STLC.Syntax.Abs.Var $1 }

Exp1 :: { Language.STLC.Syntax.Abs.Exp }
Exp1
  : '\\' Var '.' Exp { Language.STLC.Syntax.Abs.ExpAbs $2 $4 }
  | Exp2 { $1 }

Exp2 :: { Language.STLC.Syntax.Abs.Exp }
Exp2
  : Exp2 Exp3 { Language.STLC.Syntax.Abs.ExpApp $1 $2 } | Exp3 { $1 }

Exp3 :: { Language.STLC.Syntax.Abs.Exp }
Exp3 : '()' { Language.STLC.Syntax.Abs.ExpUnit } | Exp4 { $1 }

Exp4 :: { Language.STLC.Syntax.Abs.Exp }
Exp4
  : Var { Language.STLC.Syntax.Abs.ExpVar $1 } | '(' Exp ')' { $2 }

Exp :: { Language.STLC.Syntax.Abs.Exp }
Exp : Exp1 { $1 }

Type1 :: { Language.STLC.Syntax.Abs.Type }
Type1
  : Type1 '->' Type2 { Language.STLC.Syntax.Abs.TypeFunc $1 $3 }
  | Type2 { $1 }

Type2 :: { Language.STLC.Syntax.Abs.Type }
Type2
  : 'unit' { Language.STLC.Syntax.Abs.TypeUnit }
  | '(' Type ')' { $2 }

Type :: { Language.STLC.Syntax.Abs.Type }
Type : Type1 { $1 }

CtxVar :: { Language.STLC.Syntax.Abs.CtxVar }
CtxVar : Var ':' Type { Language.STLC.Syntax.Abs.CtxVar $1 $3 }

ListCtxVar :: { [Language.STLC.Syntax.Abs.CtxVar] }
ListCtxVar
  : {- empty -} { [] }
  | CtxVar { (:[]) $1 }
  | CtxVar ',' ListCtxVar { (:) $1 $3 }

Ctx :: { Language.STLC.Syntax.Abs.Ctx }
Ctx : ListCtxVar { Language.STLC.Syntax.Abs.Ctx $1 }

ExpUnderCtx :: { Language.STLC.Syntax.Abs.ExpUnderCtx }
ExpUnderCtx
  : Ctx '|-' Exp { Language.STLC.Syntax.Abs.ExpUnderCtx $1 $3 }

Command :: { Language.STLC.Syntax.Abs.Command }
Command
  : '#typecheck' ExpUnderCtx '<=' Type { Language.STLC.Syntax.Abs.CommandTypeCheck $2 $4 }
  | '#typesynth' ExpUnderCtx { Language.STLC.Syntax.Abs.CommandTypeSynth $2 }

ListCommand :: { [Language.STLC.Syntax.Abs.Command] }
ListCommand
  : {- empty -} { [] } | Command ';' ListCommand { (:) $1 $3 }

{

type Err = Either String

happyError :: [Token] -> Err a
happyError ts = Left $
  "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ (prToken t) ++ "'"

myLexer :: String -> [Token]
myLexer = tokens

}

