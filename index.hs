{-# LANGUAGE RecursiveDo, TemplateHaskell #-}

import Reflex
import Reflex.Dom
import qualified Data.Map as Map
import Safe (readMay)
import Control.Applicative ((<*>), (<$>))

import Data.FileEmbed
import Data.Monoid
import Control.Monad
import Data.Map (Map)
import Debug.Trace

main = mainWidgetWithCss $(embedFile "style.css") $ do

  let links = [ ("hackage", "https://hackage.haskell.org/package/reflex")
              , ("twitter", "http://twitter.com")
              , ("github", "http://github.com/reflex-frp")
              , ("reddit", "http://reddit.com/r/reflexfrp")
              , ("irc.freenode.net #reflex-frp", "http://webchat.freenode.net/?channels=%23reflex-frp&uio=d4")
              ]

  elClass "div" "header" $ do
    elClass "h1" "logo" $ text "Reflex-FRP"

  elClass "div" "main" $ do
    elClass "h3" "title" $ text "Practical Functional Reactive Programming"
    elClass "p" "class" $ text "Reflex is an fully-deterministic, higher-order Functional Reactive Programming (FRP) interface and an engine that efficiently implements that interface."


  -- Create a list of links from a list of tuples
  forM_ links $ \pair -> do
    elAttr "a" ("href" =: (snd pair)) $ text (fst pair)
    el "br" $ return ()

  return ()