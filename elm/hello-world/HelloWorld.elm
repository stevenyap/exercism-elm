module HelloWorld exposing (..)


helloWorld : Maybe String -> String
helloWorld name =
    String.append "Hello, " <|
        String.append (Maybe.withDefault "World" name) <|
            "!"
