module Triangle exposing (..)

import Result exposing (andThen)


version : Int
version =
    2


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


type alias TriangleSides number =
    ( number, number, number )


triangleKind : number -> number -> number -> Result String Triangle
triangleKind a b c =
    let
        sides =
            ( a, b, c )
    in
        isValidTriangle sides
            |> andThen getTriangleType


getTriangleType : TriangleSides number -> Result String Triangle
getTriangleType sides =
    if allEqual sides then
        Ok Equilateral
    else if anyTwoEqual sides then
        Ok Isosceles
    else
        Ok Scalene


allEqual : TriangleSides number -> Bool
allEqual ( a, b, c ) =
    a == b && a == c


anyTwoEqual : TriangleSides number -> Bool
anyTwoEqual ( a, b, c ) =
    a == b || a == c || b == c


isValidTriangle : TriangleSides number -> Result String (TriangleSides number)
isValidTriangle ( a, b, c ) =
    if (0 >= a || 0 >= b || 0 >= c) then
        Err "Invalid lengths"
    else if ((a + b) < c) || ((a + c) < b) || ((b + c) < a) then
        Err "Violates inequality"
    else
        Ok ( a, b, c )
