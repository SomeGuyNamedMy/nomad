{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

import Dhall

data Package = Package
  { version :: Natural
  , package :: Maybe Package
  }
  deriving (Generic, Show)

instance FromDhall Package


data Enviornment = Enviornment { buildInputs :: Natural }
  deriving (Generic, Show)

instance FromDhall Enviornment

data BuildExpression = BuildExpression
  { package :: Package
  , enviornment :: Enviornment
  }
  deriving (Generic, Show)

instance FromDhall BuildExpression

main :: IO ()
main = do
    x <- input auto "./config.dhall"
    print (x :: BuildExpression)
