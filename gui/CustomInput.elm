-- Thin wrappers around standard Element.Input but with default styling


module CustomInput exposing (button, text)

import Element as E
import Element.Border as EBorder
import Element.Input as EInput


button attributes params =
    EInput.button
        ([ E.padding 5
         , EBorder.width 3
         , EBorder.rounded 7
         ]
            ++ attributes
        )
        params


text attributes params =
    EInput.text
        ([ E.padding 5
         , EBorder.width 3
         , EBorder.rounded 7
         ]
            ++ attributes
        )
        params
