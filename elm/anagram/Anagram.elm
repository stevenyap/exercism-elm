module Anagram exposing (..)


detect : String -> List String -> List String
detect word candidates =
    List.filter (not << insensitiveCaseEqual word) candidates
        |> List.filter (isAnagram word)


insensitiveCaseEqual : String -> String -> Bool
insensitiveCaseEqual a b =
    String.toLower a == String.toLower b


isAnagram : String -> String -> Bool
isAnagram a b =
    sortedChars a == sortedChars b


sortedChars : String -> String
sortedChars word =
    String.toLower word
        |> String.toList
        |> List.sort
        |> String.fromList
