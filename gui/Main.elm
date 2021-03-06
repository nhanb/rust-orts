module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import CustomInput as CInput
import Element as E
import Element.Background as EBackground
import Element.Input as EInput
import Html exposing (Html)
import Player


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { matchDescription : String
    , player1 : Player.Model
    , player2 : Player.Model
    }


init : Model
init =
    { matchDescription = "SFV Grand Finals"
    , player1 = Player.init
    , player2 =
        { name = "P2"
        , country = "JP"
        , score = 15
        }
    }



-- UPDATE


type Msg
    = ChangeMatchDescription String
    | UpdatePlayer1 Player.Msg
    | UpdatePlayer2 Player.Msg
    | SwapPlayers
    | ResetScores


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeMatchDescription val ->
            { model | matchDescription = val }

        UpdatePlayer1 playerMsg ->
            { model | player1 = Player.update playerMsg model.player1 }

        UpdatePlayer2 playerMsg ->
            { model | player2 = Player.update playerMsg model.player2 }

        SwapPlayers ->
            { model
                | player1 = model.player2
                , player2 = model.player1
            }

        ResetScores ->
            { model
                | player1 = Player.update Player.ResetScore model.player1
                , player2 = Player.update Player.ResetScore model.player2
            }



-- VIEW


view : Model -> Html Msg
view model =
    E.layout [ E.padding 5, EBackground.color (E.rgb 0.9 0.9 0.9) ]
        (E.column [ E.width E.fill, E.height E.fill, E.spacing 5 ]
            [ matchDescription model.matchDescription
            , Player.view "P1" model.player1 UpdatePlayer1
            , Player.view "P2" model.player2 UpdatePlayer2
            , buttonsRow model
            ]
        )


matchDescription : String -> E.Element Msg
matchDescription description =
    E.row [ E.width E.fill, E.spacing 5 ]
        [ CInput.text []
            { label = CInput.labelLeft [] (E.text "Match")
            , text = description
            , onChange = ChangeMatchDescription
            , placeholder = Nothing
            }
        ]


buttonsRow model =
    E.row
        [ E.width E.fill, E.alignBottom, E.spacing 5 ]
        [ CInput.primaryButton
            { label = E.text "Apply"
            , onPress = Nothing
            }
        , CInput.dangerButton
            { label = E.text "Discard"
            , onPress = Nothing
            }
        , CInput.button []
            { label = E.text "Swap players"
            , onPress = Just SwapPlayers
            }
        , CInput.button []
            { label = E.text "Reset scores"
            , onPress = Just ResetScores
            }
        ]
