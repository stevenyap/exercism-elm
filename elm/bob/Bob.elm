module Bob exposing (..)

import Regex


type Message
    = WHATEVER String
    | SHOUTING String
    | QUESTION String
    | SILENCE String


containsChar : String -> Bool
containsChar =
    Regex.contains (Regex.regex "[a-zA-Z]")


isAllUpperString : String -> Bool
isAllUpperString s =
    String.toUpper s
        == s
        && String.toLower s
        /= s


isEmptyString : String -> Bool
isEmptyString =
    String.trim >> String.isEmpty


getMessageType : String -> Message
getMessageType message =
    if isEmptyString message then
        SILENCE message
    else if isAllUpperString message then
        SHOUTING message
    else if String.endsWith "?" message then
        QUESTION message
    else
        WHATEVER message


hey : String -> String
hey message =
    case getMessageType message of
        SHOUTING _ ->
            "Whoa, chill out!"

        QUESTION _ ->
            "Sure."

        SILENCE _ ->
            "Fine. Be that way!"

        WHATEVER _ ->
            "Whatever."
