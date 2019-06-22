-- Thin wrappers around standard Element.Input but with default styling


module CustomInput exposing (button, dangerButton, labelLeft, primaryButton, text)

import Element as E
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input


button attributes params =
    Input.button
        (commonAttrs
            ++ [ E.paddingEach { top = 8, bottom = 10, right = 12, left = 12 }
               , Background.color (E.rgb 0.9 0.9 0.9)
               , Border.rounded 4
               , E.mouseOver
                    [ Background.color (E.rgb 1 1 1)
                    ]
               , E.mouseDown
                    [ E.scale 0.95 ]
               ]
            ++ attributes
        )
        params


primaryButton params =
    button
        [ Background.color (E.rgb255 3 140 215)
        , Font.color (E.rgb 1 1 1)
        , Font.semiBold
        , E.mouseOver
            [ Background.color (E.rgb255 0 160 246)
            ]
        ]
        params


dangerButton params =
    let
        red =
            E.rgb255 200 0 0
    in
    button
        [ Background.color red
        , Font.color (E.rgb 1 1 1)
        , Font.semiBold
        , E.mouseOver
            [ Background.color (E.rgb255 251 0 0)
            ]
        ]
        params


text attributes params =
    Input.text
        (commonAttrs ++ [ Border.width 1, Border.rounded 3 ] ++ attributes)
        params


labelLeft attributes params =
    Input.labelLeft
        [ E.centerY ]
        params


commonAttrs =
    [ E.padding 5
    , Border.width 2
    , Border.color (E.rgb 0 0 0)
    , Font.family
        [ Font.typeface "Open Sans"
        , Font.sansSerif
        ]
    , Font.size 16
    ]
