module Player exposing (Model, Msg(..), init, update, view)

import Element exposing (Element, column, el, fill, row, text, width)
import Element.Input as Input



-- MODELS


type alias Model =
    { name : String
    , country : String
    , score : Int
    }


init : Model
init =
    { name = "Dummy"
    , country = "VN"
    , score = 0
    }



-- UPDATES


type Msg
    = ChangePlayerName String
    | ChangePlayerCountry String
    | ChangePlayerScore String
    | PlayerWins
    | ResetScore


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangePlayerName val ->
            { model | name = val }

        ChangePlayerCountry val ->
            { model | country = val }

        ChangePlayerScore val ->
            case val of
                "" ->
                    { model | score = 0 }

                _ ->
                    case String.toInt val of
                        Just intVal ->
                            { model | score = intVal }

                        Nothing ->
                            model

        PlayerWins ->
            { model | score = model.score + 1 }

        ResetScore ->
            { model | score = 0 }



-- VIEWS


view : String -> Model -> (Msg -> msg) -> Element msg
view label model toMsg =
    row [ width fill ]
        [ Input.text []
            { label = Input.labelLeft [] (text label)
            , text = model.name
            , onChange = toMsg << ChangePlayerName
            , placeholder = Nothing
            }
        , Input.text []
            { label = Input.labelHidden (label ++ " country")
            , text = model.country
            , onChange = toMsg << ChangePlayerCountry
            , placeholder = Nothing
            }
        , Input.text []
            { label = Input.labelHidden (label ++ " score")
            , text = String.fromInt model.score
            , onChange = toMsg << ChangePlayerScore
            , placeholder = Nothing
            }
        ]
