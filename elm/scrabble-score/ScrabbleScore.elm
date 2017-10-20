module ScrabbleScore exposing (..)


type CharScore
    = OnePointChar
    | TwoPointsChar
    | ThreePointsChar
    | FourPointsChar
    | FivePointsChar
    | EightPointsChar
    | TenPointsChar


type alias CharScoreMap =
    ( String, CharScore )


scoreBoard : List CharScoreMap
scoreBoard =
    [ ( "aeioulnrst", OnePointChar )
    , ( "dg", TwoPointsChar )
    , ( "bcmp", ThreePointsChar )
    , ( "fhvwy", FourPointsChar )
    , ( "k", FivePointsChar )
    , ( "jx", EightPointsChar )
    , ( "qz", TenPointsChar )
    ]


scoreWord : String -> Int
scoreWord word =
    String.toLower word
        |> String.toList
        |> List.map scoreChar
        |> List.map charScoreToInt
        |> List.sum


scoreChar : Char -> Maybe CharScore
scoreChar char =
    scoreBoard
        |> List.filterMap (charToScore char)
        |> List.head


charToScore : Char -> CharScoreMap -> Maybe CharScore
charToScore char ( lookupChar, score ) =
    if String.contains (String.fromChar char) lookupChar then
        Just score
    else
        Nothing


charScoreToInt : Maybe CharScore -> Int
charScoreToInt score =
    case score of
        Just OnePointChar ->
            1

        Just TwoPointsChar ->
            2

        Just ThreePointsChar ->
            3

        Just FourPointsChar ->
            4

        Just FivePointsChar ->
            5

        Just EightPointsChar ->
            8

        Just TenPointsChar ->
            10

        Nothing ->
            0
