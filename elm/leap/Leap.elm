module Leap exposing (isLeapYear)


isDivisible : Int -> Int -> Bool
isDivisible num divider =
    num % divider == 0


isLeapYear : Int -> Bool
isLeapYear year =
    let
        yearIsDivisibleBy =
            isDivisible year
    in
        (yearIsDivisibleBy 4 && not (yearIsDivisibleBy 100))
            || (yearIsDivisibleBy 100 && yearIsDivisibleBy 400)
