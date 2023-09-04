port module Button exposing (main)

import Browser
import Html exposing (Html)
import Html.Events


port sendAlert : String -> Cmd msg


init : () -> ( (), Cmd msg )
init _ =
    ( (), Cmd.none )


view : () -> Html Msg
view _ =
    Html.button
        [ Html.Events.onClick (ButtonClicked "message from elm")
        ]
        [ Html.text "Click me" ]


type Msg
    = ButtonClicked String


update : Msg -> () -> ( (), Cmd Msg )
update msg _ =
    case msg of
        ButtonClicked text ->
            ( (), sendAlert text )


subscriptions : model -> Sub msg
subscriptions _ =
    Sub.none


main : Program () () Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
