{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ImplicitParams #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuantifiedConstraints #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeSynonymInstances #-}

module BluefinImplicit where

import Bluefin.Internal
import Control.Monad (forever, when)
import Data.Kind (Constraint)
import GHC.Base (IP)
import Prelude hiding (break)

-- ~~~~~~~~~~~~
-- Library code
-- ~~~~~~~~~~~~

type family (::>) (es1 :: [Effects]) (es2 :: Effects) :: Constraint where
  (x : xs) ::> ys = (x :> ys, xs ::> ys)
  '[] ::> ys = ()

-- State

type StateI h s e es = (IP h (State s e), e :> es)

-- evalState :: forall s (es :: Effects) a. s -> (forall (e :: Effects). State s e -> Eff (e :& es) a) -> Eff es a
type EvalStateI h = forall s (es :: Effects) a. s -> (forall (e :: Effects). (StateI h s e (e :& es)) => Eff (e :& es) a) -> Eff es a

-- get :: forall (e :: Effects) (es :: Effects) s. (e :> es) => State s e -> Eff es s
type GetI h = forall (e :: Effects) (es :: Effects) s. (e :> es) => (StateI h s e es) => Eff es s

-- modify :: forall (e :: Effects) (es :: Effects) s. (e :> es) => State s e -> (s -> s) -> Eff es ()
type ModifyI h = forall (e :: Effects) (es :: Effects) s. (e :> es) => (StateI h s e es) => (s -> s) -> Eff es ()

-- Reader

type ReaderI h r e es = (IP h (Reader r e), e :> es)

-- runReader :: forall r (es :: Effects) a. r -> (forall (e :: Effects). Reader r e -> Eff (e :& es) a) -> Eff es a
type RunReaderI h = forall r (es :: Effects) a. r -> (forall (e :: Effects). (ReaderI h r e (e :& es)) => Eff (e :& es) a) -> Eff es a

-- ask :: forall (e :: Effects) (es :: Effects) r. (e :> es) => Reader r e -> Eff es r
type AskI h = forall (e :: Effects) (es :: Effects) r. (e :> es) => (ReaderI h r e es) => Eff es r

-- IO

type IOEI h e es = (IP h (IOE e), e :> es)

-- runEff :: forall a. (forall (e :: Effects) (es :: Effects). IOE e -> Eff (e :& es) a) -> IO a
type RunEffI h = forall r. (forall (e :: Effects) (es :: Effects). (IOEI h e (e :& es)) => Eff (e :& es) r) -> IO r

-- effIO :: forall (e :: Effects) (es :: Effects) a. (e :> es) => IOE e -> IO a -> Eff es a
type EffIOI h = forall (e :: Effects) (es :: Effects) a. (e :> es) => (IOEI h e es) => IO a -> Eff es a

-- ~~~~~~~~~
-- User code
-- ~~~~~~~~~

-- Reader

runReaderI :: RunReaderI "r"
runReaderI r f = runReader r (\x -> let ?r = x in f)

askI :: AskI "r"
askI = ask ?r

-- State

evalStateI :: EvalStateI "st"
evalStateI s f = evalState s (\x -> let ?st = x in f)

evalStateI1 :: EvalStateI "st1"
evalStateI1 s f = evalState s (\x -> let ?st1 = x in f)

getI :: GetI "st"
getI = get ?st

getI1 :: GetI "st1"
getI1 = get ?st1

modifyI :: ModifyI "st"
modifyI = modify ?st

modifyI1 :: ModifyI "st1"
modifyI1 = modify ?st1

-- IO

runEffI :: RunEffI "io"
runEffI f = runEff (\io -> let ?io = io in f)

effIOI :: EffIOI "io"
effIOI = effIO ?io

-- Example

countExampleI :: IO ()
countExampleI =
  runEffI do
    runReaderI @Int 2 do
      r <- askI
      evalStateI1 @Double 0 do
        evalStateI @Int r do
          withJump $ \break ->
            forever (actionI1 break)

actionI1 ::
  ( IOEI "io" e1 es
  , StateI "st" Int e2 es
  , StateI "st1" Double e3 es
  , e4 :> es
  ) =>
  Jump e4 -> Eff es ()
actionI1 break = do
  int' <- getI
  when (int' >= 10) (jumpTo break)
  double' <- getI1
  effIOI (print ((fromIntegral int') + double'))
  modifyI (+ 1)
  modifyI1 (+ 0.1)
