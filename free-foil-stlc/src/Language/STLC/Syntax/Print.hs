-- File generated by the BNF Converter (bnfc 2.9.6).

{-# LANGUAGE CPP #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
#if __GLASGOW_HASKELL__ <= 708
{-# LANGUAGE OverlappingInstances #-}
#endif

-- | Pretty-printer for Language.

module Language.STLC.Syntax.Print where

import Prelude
  ( ($), (.)
  , Bool(..), (==), (<)
  , Int, Integer, Double, (+), (-), (*)
  , String, (++)
  , ShowS, showChar, showString
  , all, elem, foldr, id, map, null, replicate, shows, span
  )
import Data.Char ( Char, isSpace )
import qualified Language.STLC.Syntax.Abs
import qualified Data.Text

-- | The top-level printing method.

printTree :: Print a => a -> String
printTree = render . prt 0

type Doc = [ShowS] -> [ShowS]

doc :: ShowS -> Doc
doc = (:)

render :: Doc -> String
render d = rend 0 False (map ($ "") $ d []) ""
  where
  rend
    :: Int        -- ^ Indentation level.
    -> Bool       -- ^ Pending indentation to be output before next character?
    -> [String]
    -> ShowS
  rend i p = \case
      "["      :ts -> char '[' . rend i False ts
      "("      :ts -> char '(' . rend i False ts
      "{"      :ts -> onNewLine i     p . showChar   '{'  . new (i+1) ts
      "}" : ";":ts -> onNewLine (i-1) p . showString "};" . new (i-1) ts
      "}"      :ts -> onNewLine (i-1) p . showChar   '}'  . new (i-1) ts
      [";"]        -> char ';'
      ";"      :ts -> char ';' . new i ts
      t  : ts@(s:_) | closingOrPunctuation s
                   -> pending . showString t . rend i False ts
      t        :ts -> pending . space t      . rend i False ts
      []           -> id
    where
    -- Output character after pending indentation.
    char :: Char -> ShowS
    char c = pending . showChar c

    -- Output pending indentation.
    pending :: ShowS
    pending = if p then indent i else id

  -- Indentation (spaces) for given indentation level.
  indent :: Int -> ShowS
  indent i = replicateS (2*i) (showChar ' ')

  -- Continue rendering in new line with new indentation.
  new :: Int -> [String] -> ShowS
  new j ts = showChar '\n' . rend j True ts

  -- Make sure we are on a fresh line.
  onNewLine :: Int -> Bool -> ShowS
  onNewLine i p = (if p then id else showChar '\n') . indent i

  -- Separate given string from following text by a space (if needed).
  space :: String -> ShowS
  space t s =
    case (all isSpace t, null spc, null rest) of
      (True , _   , True ) -> []             -- remove trailing space
      (False, _   , True ) -> t              -- remove trailing space
      (False, True, False) -> t ++ ' ' : s   -- add space if none
      _                    -> t ++ s
    where
      (spc, rest) = span isSpace s

  closingOrPunctuation :: String -> Bool
  closingOrPunctuation [c] = c `elem` closerOrPunct
  closingOrPunctuation _   = False

  closerOrPunct :: String
  closerOrPunct = ")],;"

parenth :: Doc -> Doc
parenth ss = doc (showChar '(') . ss . doc (showChar ')')

concatS :: [ShowS] -> ShowS
concatS = foldr (.) id

concatD :: [Doc] -> Doc
concatD = foldr (.) id

replicateS :: Int -> ShowS -> ShowS
replicateS n f = concatS (replicate n f)

-- | The printer class does the job.

class Print a where
  prt :: Int -> a -> Doc

instance {-# OVERLAPPABLE #-} Print a => Print [a] where
  prt i = concatD . map (prt i)

instance Print Char where
  prt _ c = doc (showChar '\'' . mkEsc '\'' c . showChar '\'')

instance Print String where
  prt _ = printString

printString :: String -> Doc
printString s = doc (showChar '"' . concatS (map (mkEsc '"') s) . showChar '"')

mkEsc :: Char -> Char -> ShowS
mkEsc q = \case
  s | s == q -> showChar '\\' . showChar s
  '\\' -> showString "\\\\"
  '\n' -> showString "\\n"
  '\t' -> showString "\\t"
  s -> showChar s

prPrec :: Int -> Int -> Doc -> Doc
prPrec i j = if j < i then parenth else id

instance Print Integer where
  prt _ x = doc (shows x)

instance Print Double where
  prt _ x = doc (shows x)

instance Print Language.STLC.Syntax.Abs.NameLowerCase where
  prt _ (Language.STLC.Syntax.Abs.NameLowerCase i) = doc $ showString (Data.Text.unpack i)
instance Print Language.STLC.Syntax.Abs.NameUpperCase where
  prt _ (Language.STLC.Syntax.Abs.NameUpperCase i) = doc $ showString (Data.Text.unpack i)
instance Print (Language.STLC.Syntax.Abs.Program' a) where
  prt i = \case
    Language.STLC.Syntax.Abs.Program _ exp -> prPrec i 0 (concatD [prt 0 exp])

instance Print (Language.STLC.Syntax.Abs.Var' a) where
  prt i = \case
    Language.STLC.Syntax.Abs.Var _ namelowercase -> prPrec i 0 (concatD [prt 0 namelowercase])

instance Print (Language.STLC.Syntax.Abs.Exp' a) where
  prt i = \case
    Language.STLC.Syntax.Abs.ExpVar _ var -> prPrec i 1 (concatD [prt 0 var])
    Language.STLC.Syntax.Abs.ExpInt _ n -> prPrec i 2 (concatD [prt 0 n])
    Language.STLC.Syntax.Abs.ExpAbs _ var exp -> prPrec i 3 (concatD [doc (showString "\\"), prt 0 var, doc (showString "."), prt 0 exp])
    Language.STLC.Syntax.Abs.ExpAbsAnno _ var type_ exp -> prPrec i 4 (concatD [doc (showString "\\"), prt 0 var, doc (showString "::"), prt 0 type_, doc (showString "."), prt 0 exp])
    Language.STLC.Syntax.Abs.ExpApp _ exp1 exp2 -> prPrec i 5 (concatD [prt 11 exp1, prt 10 exp2])
    Language.STLC.Syntax.Abs.ExpLet _ var exp1 exp2 -> prPrec i 6 (concatD [doc (showString "let"), prt 0 var, doc (showString "="), prt 0 exp1, doc (showString "in"), prt 0 exp2])
    Language.STLC.Syntax.Abs.ExpAnno _ exp type_ -> prPrec i 7 (concatD [prt 0 exp, doc (showString "::"), prt 0 type_])

instance Print (Language.STLC.Syntax.Abs.Type' a) where
  prt i = \case
    Language.STLC.Syntax.Abs.TypeConcrete _ nameuppercase -> prPrec i 1 (concatD [prt 0 nameuppercase])
    Language.STLC.Syntax.Abs.TypeVariable _ namelowercase -> prPrec i 2 (concatD [prt 0 namelowercase])
    Language.STLC.Syntax.Abs.TypeFunc _ type_1 type_2 -> prPrec i 3 (concatD [prt 4 type_1, doc (showString "->"), prt 3 type_2])
    Language.STLC.Syntax.Abs.TypeForall _ namelowercases type_ -> prPrec i 4 (concatD [doc (showString "forall"), prt 0 namelowercases, doc (showString "."), prt 3 type_])

instance Print [Language.STLC.Syntax.Abs.NameLowerCase] where
  prt _ [] = concatD []
  prt _ (x:xs) = concatD [prt 0 x, doc (showString " "), prt 0 xs]

instance Print (Language.STLC.Syntax.Abs.CtxVar' a) where
  prt i = \case
    Language.STLC.Syntax.Abs.CtxVar _ var type_ -> prPrec i 0 (concatD [prt 0 var, doc (showString ":"), prt 0 type_])

instance Print [Language.STLC.Syntax.Abs.CtxVar' a] where
  prt _ [] = concatD []
  prt _ [x] = concatD [prt 0 x]
  prt _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print (Language.STLC.Syntax.Abs.Ctx' a) where
  prt i = \case
    Language.STLC.Syntax.Abs.Ctx _ ctxvars -> prPrec i 0 (concatD [prt 0 ctxvars])

instance Print (Language.STLC.Syntax.Abs.ExpUnderCtx' a) where
  prt i = \case
    Language.STLC.Syntax.Abs.ExpUnderCtx _ ctx exp -> prPrec i 0 (concatD [prt 0 ctx, doc (showString "|-"), prt 0 exp])
