module Raindrops exposing (..)


raindrops : Int -> String
raindrops int =
    case toRaindropsString int of
        "" ->
            toString int

        string ->
            string


toRaindropsString : Int -> String
toRaindropsString int =
    [ (doPling int), (doPlang int), (doPlong int) ]
        |> List.filterMap identity
        |> String.concat


doPling : Int -> Maybe String
doPling int =
    if int % 3 == 0 then
        Just "Pling"
    else
        Nothing


doPlang : Int -> Maybe String
doPlang int =
    if int % 5 == 0 then
        Just "Plang"
    else
        Nothing


doPlong : Int -> Maybe String
doPlong int =
    if int % 7 == 0 then
        Just "Plong"
    else
        Nothing
