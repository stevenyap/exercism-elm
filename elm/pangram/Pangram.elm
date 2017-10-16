module Pangram exposing (..)

import Set


letters : Set.Set Char
letters =
    Set.fromList <|
        String.toList "abcdefghijklmnopqrstuvwxyz"


isPangram : String -> Bool
isPangram sentence =
    String.toLower sentence
        |> String.toList
        |> Set.fromList
        |> Set.intersect letters
        |> Set.size
        |> (==) 26
