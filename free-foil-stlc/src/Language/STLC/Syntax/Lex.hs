{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_GHC -fno-warn-tabs #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# LANGUAGE CPP #-}
{-# LINE 4 "Lex.x" #-}
{-# OPTIONS -fno-warn-incomplete-patterns #-}
{-# OPTIONS_GHC -w #-}

{-# LANGUAGE PatternSynonyms #-}

module Language.STLC.Syntax.Lex where

import Prelude

import qualified Data.Bits
import Data.Char     (ord)
import Data.Function (on)
import Data.Word     (Word8)
#include "ghcconfig.h"
import qualified Data.Array
alex_tab_size :: Int
alex_tab_size = 8
alex_base :: Data.Array.Array Int Int
alex_base = Data.Array.listArray (0 :: Int, 36)
  [ -8
  , 60
  , -153
  , -74
  , 316
  , 444
  , -55
  , -108
  , -112
  , -102
  , -90
  , -87
  , -107
  , -97
  , -101
  , -88
  , 0
  , 8
  , 0
  , -85
  , -76
  , -75
  , -79
  , -32
  , -15
  , -10
  , 650
  , 445
  , 645
  , 828
  , 892
  , -132
  , 1020
  , 1084
  , 1197
  , 0
  , 0
  ]

alex_table :: Data.Array.Array Int Int
alex_table = Data.Array.listArray (0 :: Int, 1452)
  [ 0
  , 17
  , 17
  , 17
  , 17
  , 17
  , 31
  , 16
  , 8
  , 9
  , 10
  , 11
  , 22
  , 14
  , 13
  , 15
  , 16
  , 17
  , 17
  , 17
  , 17
  , 17
  , 16
  , 19
  , 17
  , 21
  , 20
  , 7
  , 12
  , 16
  , 16
  , 16
  , 25
  , 16
  , -1
  , -1
  , 16
  , 6
  , 16
  , 0
  , 17
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 16
  , 16
  , 23
  , 0
  , 0
  , 0
  , 0
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 0
  , 16
  , 0
  , 0
  , 0
  , 0
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 0
  , 24
  , 30
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 0
  , 0
  , 0
  , 0
  , 0
  , 28
  , 33
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 0
  , 0
  , 29
  , 29
  , 0
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 29
  , 0
  , 0
  , 29
  , 29
  , 29
  , 29
  , 29
  , 26
  , 0
  , 0
  , 29
  , 29
  , 0
  , 29
  , 0
  , 29
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 0
  , 0
  , 29
  , 29
  , 29
  , 0
  , 29
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 0
  , 29
  , 0
  , 29
  , 5
  , 29
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 0
  , 0
  , 0
  , 29
  , 29
  , 0
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 0
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 0
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 0
  , 4
  , 32
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 30
  , 33
  , 35
  , 2
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 3
  , 1
  , 36
  , 36
  , 36
  , 34
  , 26
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 0
  , 0
  , 0
  , 0
  , 26
  , 0
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 0
  , 26
  , 26
  , 26
  , 26
  , 26
  , 26
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 0
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , -1
  , -1
  , 0
  , 0
  , -1
  , 0
  , 0
  , 0
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , -1
  , -1
  , 0
  , 0
  , 0
  , 0
  , 0
  , -1
  , -1
  , -1
  , 0
  , 0
  , -1
  , 0
  , -1
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , -1
  , -1
  , 0
  , 0
  , 0
  , -1
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , -1
  , 0
  , -1
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , -1
  , -1
  , -1
  , 0
  , 0
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 4
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 30
  , 33
  , 35
  , 2
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 35
  , 3
  , 1
  , 36
  , 36
  , 36
  , 34
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 0
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 0
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 5
  , 4
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 18
  , 3
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  ]

alex_check :: Data.Array.Array Int Int
alex_check = Data.Array.listArray (0 :: Int, 1452)
  [ -1
  , 9
  , 10
  , 11
  , 12
  , 13
  , 159
  , 62
  , 116
  , 121
  , 112
  , 101
  , 99
  , 110
  , 121
  , 116
  , 104
  , 9
  , 10
  , 11
  , 12
  , 13
  , 107
  , 99
  , 32
  , 104
  , 101
  , 35
  , 115
  , 61
  , 45
  , 41
  , 40
  , 41
  , 166
  , 167
  , 44
  , 45
  , 46
  , -1
  , 32
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 58
  , 59
  , 60
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , 92
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , -1
  , 124
  , 191
  , 192
  , 193
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 245
  , 246
  , 247
  , 248
  , 249
  , 250
  , 251
  , 252
  , 253
  , 254
  , 255
  , -1
  , -1
  , -1
  , -1
  , -1
  , 195
  , 128
  , 129
  , 130
  , 131
  , 132
  , 133
  , 134
  , 135
  , 136
  , 137
  , 138
  , 139
  , 140
  , 141
  , 142
  , 143
  , 144
  , 145
  , 146
  , 147
  , 148
  , 149
  , 150
  , 151
  , 152
  , 153
  , 154
  , 155
  , 156
  , 157
  , 158
  , 159
  , 160
  , 161
  , 162
  , 163
  , 164
  , 165
  , 166
  , 167
  , 168
  , 169
  , 170
  , 171
  , 172
  , 173
  , 174
  , 175
  , 176
  , 177
  , 178
  , 179
  , 180
  , 181
  , 182
  , 183
  , 184
  , 185
  , 186
  , 187
  , 188
  , 189
  , 190
  , 191
  , 192
  , 193
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 245
  , 246
  , 247
  , 248
  , 249
  , 250
  , 251
  , 252
  , 253
  , 254
  , 255
  , 0
  , 1
  , 2
  , 3
  , 4
  , 5
  , 6
  , 7
  , 8
  , 9
  , 10
  , 11
  , 12
  , 13
  , 14
  , 15
  , 16
  , 17
  , 18
  , 19
  , 20
  , 21
  , 22
  , 23
  , 24
  , 25
  , 26
  , 27
  , 28
  , 29
  , 30
  , 31
  , 32
  , 33
  , 34
  , 35
  , 36
  , 37
  , 38
  , 39
  , 40
  , 41
  , 42
  , 43
  , 44
  , 45
  , 46
  , 47
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , 58
  , 59
  , 60
  , 61
  , 62
  , 63
  , 64
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , 91
  , 92
  , 93
  , 94
  , 95
  , 96
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 123
  , 124
  , 125
  , 126
  , 127
  , 0
  , 1
  , 2
  , 3
  , 4
  , 5
  , 6
  , 7
  , 8
  , -1
  , -1
  , 11
  , 12
  , -1
  , 14
  , 15
  , 16
  , 17
  , 18
  , 19
  , 20
  , 21
  , 22
  , 23
  , 24
  , 25
  , 26
  , 27
  , 28
  , 29
  , 30
  , 31
  , -1
  , -1
  , 34
  , 35
  , 36
  , 37
  , 38
  , 39
  , -1
  , -1
  , 42
  , 43
  , -1
  , 45
  , -1
  , 47
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , 60
  , 61
  , 62
  , -1
  , 64
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , 92
  , -1
  , 94
  , 95
  , 96
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , -1
  , -1
  , -1
  , 126
  , 127
  , -1
  , 128
  , 129
  , 130
  , 131
  , 132
  , 133
  , 134
  , 135
  , 136
  , 137
  , 138
  , 139
  , 140
  , 141
  , 142
  , 143
  , 144
  , 145
  , 146
  , 147
  , 148
  , 149
  , 150
  , -1
  , 152
  , 153
  , 154
  , 155
  , 156
  , 157
  , 158
  , 159
  , 160
  , 161
  , 162
  , 163
  , 164
  , 165
  , 166
  , 167
  , 168
  , 169
  , 170
  , 171
  , 172
  , 173
  , 174
  , 175
  , 176
  , 177
  , 178
  , 179
  , 180
  , 181
  , 182
  , -1
  , 184
  , 185
  , 186
  , 187
  , 188
  , 189
  , 190
  , 191
  , -1
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 39
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , 95
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 128
  , 129
  , 130
  , 131
  , 132
  , 133
  , 134
  , 135
  , 136
  , 137
  , 138
  , 139
  , 140
  , 141
  , 142
  , 143
  , 144
  , 145
  , 146
  , 147
  , 148
  , 149
  , 150
  , -1
  , 152
  , 153
  , 154
  , 155
  , 156
  , 157
  , 158
  , 159
  , 160
  , 161
  , 162
  , 163
  , 164
  , 165
  , 166
  , 167
  , 168
  , 169
  , 170
  , 171
  , 172
  , 173
  , 174
  , 175
  , 176
  , 177
  , 178
  , 179
  , 180
  , 181
  , 182
  , -1
  , 184
  , 185
  , 186
  , 187
  , 188
  , 189
  , 190
  , 191
  , 9
  , 10
  , -1
  , -1
  , 13
  , -1
  , -1
  , -1
  , 195
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 32
  , 33
  , -1
  , -1
  , -1
  , -1
  , -1
  , 39
  , 40
  , 41
  , -1
  , -1
  , 44
  , -1
  , 46
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 58
  , 59
  , -1
  , -1
  , -1
  , 63
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 91
  , -1
  , 93
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 123
  , 124
  , 125
  , -1
  , -1
  , 128
  , 129
  , 130
  , 131
  , 132
  , 133
  , 134
  , 135
  , 136
  , 137
  , 138
  , 139
  , 140
  , 141
  , 142
  , 143
  , 144
  , 145
  , 146
  , 147
  , 148
  , 149
  , 150
  , 151
  , 152
  , 153
  , 154
  , 155
  , 156
  , 157
  , 158
  , 159
  , 160
  , 161
  , 162
  , 163
  , 164
  , 165
  , 166
  , 167
  , 168
  , 169
  , 170
  , 171
  , 172
  , 173
  , 174
  , 175
  , 176
  , 177
  , 178
  , 179
  , 180
  , 181
  , 182
  , 183
  , 184
  , 185
  , 186
  , 187
  , 188
  , 189
  , 190
  , 191
  , 192
  , 193
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 245
  , 246
  , 247
  , 248
  , 249
  , 250
  , 251
  , 252
  , 253
  , 254
  , 255
  , 192
  , 193
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 245
  , 246
  , 247
  , 248
  , 249
  , 250
  , 251
  , 252
  , 253
  , 254
  , 255
  , 128
  , 129
  , 130
  , 131
  , 132
  , 133
  , 134
  , 135
  , 136
  , 137
  , 138
  , 139
  , 140
  , 141
  , 142
  , 143
  , 144
  , 145
  , 146
  , 147
  , 148
  , 149
  , 150
  , -1
  , 152
  , 153
  , 154
  , 155
  , 156
  , 157
  , 158
  , 159
  , 160
  , 161
  , 162
  , 163
  , 164
  , 165
  , 166
  , 167
  , 168
  , 169
  , 170
  , 171
  , 172
  , 173
  , 174
  , 175
  , 176
  , 177
  , 178
  , 179
  , 180
  , 181
  , 182
  , -1
  , 184
  , 185
  , 186
  , 187
  , 188
  , 189
  , 190
  , 191
  , 128
  , 129
  , 130
  , 131
  , 132
  , 133
  , 134
  , 135
  , 136
  , 137
  , 138
  , 139
  , 140
  , 141
  , 142
  , 143
  , 144
  , 145
  , 146
  , 147
  , 148
  , 149
  , 150
  , 151
  , 152
  , 153
  , 154
  , 155
  , 156
  , 157
  , 158
  , 159
  , 160
  , 161
  , 162
  , 163
  , 164
  , 165
  , 166
  , 167
  , 168
  , 169
  , 170
  , 171
  , 172
  , 173
  , 174
  , 175
  , 176
  , 177
  , 178
  , 179
  , 180
  , 181
  , 182
  , 183
  , 184
  , 185
  , 186
  , 187
  , 188
  , 189
  , 190
  , 191
  , 192
  , 193
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 245
  , 246
  , 247
  , 248
  , 249
  , 250
  , 251
  , 252
  , 253
  , 254
  , 255
  , 143
  , 144
  , 145
  , 146
  , 147
  , 148
  , 149
  , 150
  , 151
  , 152
  , 153
  , 154
  , 155
  , 156
  , 157
  , 158
  , 159
  , 160
  , 161
  , 162
  , 163
  , 164
  , 165
  , 166
  , 167
  , 168
  , 169
  , 170
  , 171
  , 172
  , 173
  , 174
  , 175
  , 176
  , 177
  , 178
  , 179
  , 180
  , 181
  , 182
  , 183
  , 184
  , 185
  , 186
  , 187
  , 188
  , 189
  , 190
  , 191
  , 192
  , 193
  , 194
  , 195
  , 196
  , 197
  , 198
  , 199
  , 200
  , 201
  , 202
  , 203
  , 204
  , 205
  , 206
  , 207
  , 208
  , 209
  , 210
  , 211
  , 212
  , 213
  , 214
  , 215
  , 216
  , 217
  , 218
  , 219
  , 220
  , 221
  , 222
  , 223
  , 224
  , 225
  , 226
  , 227
  , 228
  , 229
  , 230
  , 231
  , 232
  , 233
  , 234
  , 235
  , 236
  , 237
  , 238
  , 239
  , 240
  , 241
  , 242
  , 243
  , 244
  , 245
  , 246
  , 247
  , 248
  , 249
  , 250
  , 251
  , 252
  , 253
  , 254
  , 255
  ]

alex_deflt :: Data.Array.Array Int Int
alex_deflt = Data.Array.listArray (0 :: Int, 36)
  [ -1
  , -1
  , 18
  , 18
  , 29
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 29
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 29
  , 29
  , 29
  , 29
  , -1
  , 35
  , 18
  , 35
  ]

alex_accept = Data.Array.listArray (0 :: Int, 36)
  [ AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAcc 4
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAcc 3
  , AlexAccSkip
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAcc 2
  , AlexAcc 1
  , AlexAccNone
  , AlexAccNone
  , AlexAcc 0
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  ]

alex_actions = Data.Array.array (0 :: Int, 5)
  [ (4,alex_action_2)
  , (3,alex_action_1)
  , (2,alex_action_1)
  , (1,alex_action_3)
  , (0,alex_action_2)
  ]

alex_action_1 = tok (eitherResIdent TV)
alex_action_2 = tok (eitherResIdent T_Var)
alex_action_3 = tok (eitherResIdent TV)

#define ALEX_NOPRED 1
-- -----------------------------------------------------------------------------
-- ALEX TEMPLATE
--
-- This code is in the PUBLIC DOMAIN; you may copy it freely and use
-- it for any purpose whatsoever.

-- -----------------------------------------------------------------------------
-- INTERNALS and main scanner engine

#ifdef ALEX_GHC
#  define ILIT(n) n#
#  define IBOX(n) (I# (n))
#  define FAST_INT Int#
-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#  if __GLASGOW_HASKELL__ > 706
#    define GTE(n,m) (GHC.Exts.tagToEnum# (n >=# m))
#    define EQ(n,m) (GHC.Exts.tagToEnum# (n ==# m))
#  else
#    define GTE(n,m) (n >=# m)
#    define EQ(n,m) (n ==# m)
#  endif
#  define PLUS(n,m) (n +# m)
#  define MINUS(n,m) (n -# m)
#  define TIMES(n,m) (n *# m)
#  define NEGATE(n) (negateInt# (n))
#  define IF_GHC(x) (x)
#else
#  define ILIT(n) (n)
#  define IBOX(n) (n)
#  define FAST_INT Int
#  define GTE(n,m) (n >= m)
#  define EQ(n,m) (n == m)
#  define PLUS(n,m) (n + m)
#  define MINUS(n,m) (n - m)
#  define TIMES(n,m) (n * m)
#  define NEGATE(n) (negate (n))
#  define IF_GHC(x)
#endif

#ifdef ALEX_GHC
data AlexAddr = AlexA# Addr#
-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.

{-# INLINE alexIndexInt16OffAddr #-}
alexIndexInt16OffAddr :: AlexAddr -> Int# -> Int#
alexIndexInt16OffAddr (AlexA# arr) off =
#if __GLASGOW_HASKELL__ >= 901
  GHC.Exts.int16ToInt# -- qualified import because it doesn't exist on older GHC's
#endif
#ifdef WORDS_BIGENDIAN
  (GHC.Exts.word16ToInt16# (GHC.Exts.wordToWord16# (GHC.Exts.byteSwap16# (GHC.Exts.word16ToWord# (GHC.Exts.int16ToWord16#
#endif
  (indexInt16OffAddr# arr off)
#ifdef WORDS_BIGENDIAN
  )))))
#endif
#else
alexIndexInt16OffAddr = (Data.Array.!)
#endif

#ifdef ALEX_GHC
{-# INLINE alexIndexInt32OffAddr #-}
alexIndexInt32OffAddr :: AlexAddr -> Int# -> Int#
alexIndexInt32OffAddr (AlexA# arr) off =
#if __GLASGOW_HASKELL__ >= 901
  GHC.Exts.int32ToInt# -- qualified import because it doesn't exist on older GHC's
#endif
#ifdef WORDS_BIGENDIAN
  (GHC.Exts.word32ToInt32# (GHC.Exts.wordToWord32# (GHC.Exts.byteSwap32# (GHC.Exts.word32ToWord# (GHC.Exts.int32ToWord32#
#endif
  (indexInt32OffAddr# arr off)
#ifdef WORDS_BIGENDIAN
  )))))
#endif
#else
alexIndexInt32OffAddr = (Data.Array.!)
#endif

#ifdef ALEX_GHC
-- GHC >= 503, unsafeAt is available from Data.Array.Base.
quickIndex = unsafeAt
#else
quickIndex = (Data.Array.!)
#endif

-- -----------------------------------------------------------------------------
-- Main lexing routines

data AlexReturn a
  = AlexEOF
  | AlexError  !AlexInput
  | AlexSkip   !AlexInput !Int
  | AlexToken  !AlexInput !Int a

-- alexScan :: AlexInput -> StartCode -> AlexReturn a
alexScan input__ IBOX(sc)
  = alexScanUser (error "alex rule requiring context was invoked by alexScan; use alexScanUser instead?") input__ IBOX(sc)

-- If the generated alexScan/alexScanUser functions are called multiple times
-- in the same file, alexScanUser gets broken out into a separate function and
-- increases memory usage. Make sure GHC inlines this function and optimizes it.
{-# INLINE alexScanUser #-}

alexScanUser user__ input__ IBOX(sc)
  = case alex_scan_tkn user__ input__ ILIT(0) input__ sc AlexNone of
  (AlexNone, input__') ->
    case alexGetByte input__ of
      Nothing ->
#ifdef ALEX_DEBUG
                                   Debug.Trace.trace ("End of input.") $
#endif
                                   AlexEOF
      Just _ ->
#ifdef ALEX_DEBUG
                                   Debug.Trace.trace ("Error.") $
#endif
                                   AlexError input__'

  (AlexLastSkip input__'' len, _) ->
#ifdef ALEX_DEBUG
    Debug.Trace.trace ("Skipping.") $
#endif
    AlexSkip input__'' len

  (AlexLastAcc k input__''' len, _) ->
#ifdef ALEX_DEBUG
    Debug.Trace.trace ("Accept.") $
#endif
    AlexToken input__''' len ((Data.Array.!) alex_actions k)


-- Push the input through the DFA, remembering the most recent accepting
-- state it encountered.

alex_scan_tkn user__ orig_input len input__ s last_acc =
  input__ `seq` -- strict in the input
  let
  new_acc = (check_accs (alex_accept `quickIndex` IBOX(s)))
  in
  new_acc `seq`
  case alexGetByte input__ of
     Nothing -> (new_acc, input__)
     Just (c, new_input) ->
#ifdef ALEX_DEBUG
      Debug.Trace.trace ("State: " ++ show IBOX(s) ++ ", char: " ++ show c ++ " " ++ (show . chr . fromIntegral) c) $
#endif
      case fromIntegral c of { IBOX(ord_c) ->
        let
                base   = alexIndexInt32OffAddr alex_base s
                offset = PLUS(base,ord_c)

                new_s = if GTE(offset,ILIT(0))
                          && let check  = alexIndexInt16OffAddr alex_check offset
                             in  EQ(check,ord_c)
                          then alexIndexInt16OffAddr alex_table offset
                          else alexIndexInt16OffAddr alex_deflt s
        in
        case new_s of
            ILIT(-1) -> (new_acc, input__)
                -- on an error, we want to keep the input *before* the
                -- character that failed, not after.
            _ -> alex_scan_tkn user__ orig_input
#ifdef ALEX_LATIN1
                   PLUS(len,ILIT(1))
                   -- issue 119: in the latin1 encoding, *each* byte is one character
#else
                   (if c < 0x80 || c >= 0xC0 then PLUS(len,ILIT(1)) else len)
                   -- note that the length is increased ONLY if this is the 1st byte in a char encoding)
#endif
                   new_input new_s new_acc
      }
  where
        check_accs (AlexAccNone) = last_acc
        check_accs (AlexAcc a  ) = AlexLastAcc a input__ IBOX(len)
        check_accs (AlexAccSkip) = AlexLastSkip  input__ IBOX(len)
#ifndef ALEX_NOPRED
        check_accs (AlexAccPred a predx rest)
           | predx user__ orig_input IBOX(len) input__
           = AlexLastAcc a input__ IBOX(len)
           | otherwise
           = check_accs rest
        check_accs (AlexAccSkipPred predx rest)
           | predx user__ orig_input IBOX(len) input__
           = AlexLastSkip input__ IBOX(len)
           | otherwise
           = check_accs rest
#endif

data AlexLastAcc
  = AlexNone
  | AlexLastAcc !Int !AlexInput !Int
  | AlexLastSkip     !AlexInput !Int

data AlexAcc user
  = AlexAccNone
  | AlexAcc Int
  | AlexAccSkip
#ifndef ALEX_NOPRED
  | AlexAccPred Int (AlexAccPred user) (AlexAcc user)
  | AlexAccSkipPred (AlexAccPred user) (AlexAcc user)

type AlexAccPred user = user -> AlexInput -> Int -> AlexInput -> Bool

-- -----------------------------------------------------------------------------
-- Predicates on a rule

alexAndPred p1 p2 user__ in1 len in2
  = p1 user__ in1 len in2 && p2 user__ in1 len in2

--alexPrevCharIsPred :: Char -> AlexAccPred _
alexPrevCharIs c _ input__ _ _ = c == alexInputPrevChar input__

alexPrevCharMatches f _ input__ _ _ = f (alexInputPrevChar input__)

--alexPrevCharIsOneOfPred :: Array Char Bool -> AlexAccPred _
alexPrevCharIsOneOf arr _ input__ _ _ = arr Data.Array.! alexInputPrevChar input__

--alexRightContext :: Int -> AlexAccPred _
alexRightContext IBOX(sc) user__ _ _ input__ =
     case alex_scan_tkn user__ input__ ILIT(0) input__ sc AlexNone of
          (AlexNone, _) -> False
          _ -> True
        -- TODO: there's no need to find the longest
        -- match when checking the right context, just
        -- the first match will do.
#endif
{-# LINE 50 "Lex.x" #-}
-- | Create a token with position.
tok :: (String -> Tok) -> (Posn -> String -> Token)
tok f p = PT p . f

-- | Token without position.
data Tok
  = TK {-# UNPACK #-} !TokSymbol  -- ^ Reserved word or symbol.
  | TL !String                    -- ^ String literal.
  | TI !String                    -- ^ Integer literal.
  | TV !String                    -- ^ Identifier.
  | TD !String                    -- ^ Float literal.
  | TC !String                    -- ^ Character literal.
  | T_Var !String
  deriving (Eq, Show, Ord)

-- | Smart constructor for 'Tok' for the sake of backwards compatibility.
pattern TS :: String -> Int -> Tok
pattern TS t i = TK (TokSymbol t i)

-- | Keyword or symbol tokens have a unique ID.
data TokSymbol = TokSymbol
  { tsText :: String
      -- ^ Keyword or symbol text.
  , tsID   :: !Int
      -- ^ Unique ID.
  } deriving (Show)

-- | Keyword/symbol equality is determined by the unique ID.
instance Eq  TokSymbol where (==)    = (==)    `on` tsID

-- | Keyword/symbol ordering is determined by the unique ID.
instance Ord TokSymbol where compare = compare `on` tsID

-- | Token with position.
data Token
  = PT  Posn Tok
  | Err Posn
  deriving (Eq, Show, Ord)

-- | Pretty print a position.
printPosn :: Posn -> String
printPosn (Pn _ l c) = "line " ++ show l ++ ", column " ++ show c

-- | Pretty print the position of the first token in the list.
tokenPos :: [Token] -> String
tokenPos (t:_) = printPosn (tokenPosn t)
tokenPos []    = "end of file"

-- | Get the position of a token.
tokenPosn :: Token -> Posn
tokenPosn (PT p _) = p
tokenPosn (Err p)  = p

-- | Get line and column of a token.
tokenLineCol :: Token -> (Int, Int)
tokenLineCol = posLineCol . tokenPosn

-- | Get line and column of a position.
posLineCol :: Posn -> (Int, Int)
posLineCol (Pn _ l c) = (l,c)

-- | Convert a token into "position token" form.
mkPosToken :: Token -> ((Int, Int), String)
mkPosToken t = (tokenLineCol t, tokenText t)

-- | Convert a token to its text.
tokenText :: Token -> String
tokenText t = case t of
  PT _ (TS s _) -> s
  PT _ (TL s)   -> show s
  PT _ (TI s)   -> s
  PT _ (TV s)   -> s
  PT _ (TD s)   -> s
  PT _ (TC s)   -> s
  Err _         -> "#error"
  PT _ (T_Var s) -> s

-- | Convert a token to a string.
prToken :: Token -> String
prToken t = tokenText t

-- | Finite map from text to token organized as binary search tree.
data BTree
  = N -- ^ Nil (leaf).
  | B String Tok BTree BTree
      -- ^ Binary node.
  deriving (Show)

-- | Convert potential keyword into token or use fallback conversion.
eitherResIdent :: (String -> Tok) -> String -> Tok
eitherResIdent tv s = treeFind resWords
  where
  treeFind N = tv s
  treeFind (B a t left right) =
    case compare s a of
      LT -> treeFind left
      GT -> treeFind right
      EQ -> t

-- | The keywords and symbols of the language organized as binary search tree.
resWords :: BTree
resWords =
  b "." 8
    (b "()" 4
       (b "#typesynth" 2 (b "#typecheck" 1 N N) (b "(" 3 N N))
       (b "," 6 (b ")" 5 N N) (b "->" 7 N N)))
    (b "\\" 12
       (b ";" 10 (b ":" 9 N N) (b "<=" 11 N N))
       (b "|-" 14 (b "unit" 13 N N) N))
  where
  b s n = B bs (TS bs n)
    where
    bs = s

-- | Unquote string literal.
unescapeInitTail :: String -> String
unescapeInitTail = id . unesc . tail . id
  where
  unesc s = case s of
    '\\':c:cs | elem c ['\"', '\\', '\''] -> c : unesc cs
    '\\':'n':cs  -> '\n' : unesc cs
    '\\':'t':cs  -> '\t' : unesc cs
    '\\':'r':cs  -> '\r' : unesc cs
    '\\':'f':cs  -> '\f' : unesc cs
    '"':[]       -> []
    c:cs         -> c : unesc cs
    _            -> []

-------------------------------------------------------------------
-- Alex wrapper code.
-- A modified "posn" wrapper.
-------------------------------------------------------------------

data Posn = Pn !Int !Int !Int
  deriving (Eq, Show, Ord)

alexStartPos :: Posn
alexStartPos = Pn 0 1 1

alexMove :: Posn -> Char -> Posn
alexMove (Pn a l c) '\t' = Pn (a+1)  l     (((c+7) `div` 8)*8+1)
alexMove (Pn a l c) '\n' = Pn (a+1) (l+1)   1
alexMove (Pn a l c) _    = Pn (a+1)  l     (c+1)

type Byte = Word8

type AlexInput = (Posn,     -- current position,
                  Char,     -- previous char
                  [Byte],   -- pending bytes on the current char
                  String)   -- current input string

tokens :: String -> [Token]
tokens str = go (alexStartPos, '\n', [], str)
    where
      go :: AlexInput -> [Token]
      go inp@(pos, _, _, str) =
               case alexScan inp 0 of
                AlexEOF                   -> []
                AlexError (pos, _, _, _)  -> [Err pos]
                AlexSkip  inp' len        -> go inp'
                AlexToken inp' len act    -> act pos (take len str) : (go inp')

alexGetByte :: AlexInput -> Maybe (Byte,AlexInput)
alexGetByte (p, c, (b:bs), s) = Just (b, (p, c, bs, s))
alexGetByte (p, _, [], s) =
  case s of
    []  -> Nothing
    (c:s) ->
             let p'     = alexMove p c
                 (b:bs) = utf8Encode c
              in p' `seq` Just (b, (p', c, bs, s))

alexInputPrevChar :: AlexInput -> Char
alexInputPrevChar (p, c, bs, s) = c

-- | Encode a Haskell String to a list of Word8 values, in UTF8 format.
utf8Encode :: Char -> [Word8]
utf8Encode = map fromIntegral . go . ord
  where
  go oc
   | oc <= 0x7f       = [oc]

   | oc <= 0x7ff      = [ 0xc0 + (oc `Data.Bits.shiftR` 6)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ]

   | oc <= 0xffff     = [ 0xe0 + (oc `Data.Bits.shiftR` 12)
                        , 0x80 + ((oc `Data.Bits.shiftR` 6) Data.Bits..&. 0x3f)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ]
   | otherwise        = [ 0xf0 + (oc `Data.Bits.shiftR` 18)
                        , 0x80 + ((oc `Data.Bits.shiftR` 12) Data.Bits..&. 0x3f)
                        , 0x80 + ((oc `Data.Bits.shiftR` 6) Data.Bits..&. 0x3f)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ]
