#!/bin/bash

BLANK='#00000000'
CLEAR='#ffffff88'
DEFAULT='#fff8f788'
TEXT='#fff8f7dd'
WRONG='#fff8f7ee'
VERIFYING='#fff8f7ee'

i3lock                                                        \
    --insidever-color=$CLEAR                                  \
    --ringver-color=$VERIFYING                                \
    \
    --insidewrong-color=$CLEAR                                \
    --ringwrong-color=$WRONG                                  \
    \
    --inside-color=$BLANK                                     \
    --ring-color=$DEFAULT                                     \
    --line-color=$BLANK                                       \
    --separator-color=$DEFAULT                                \
    \
    --layout-color=$TEXT                                      \
    --keyhl-color=$WRONG                                      \
    --bshl-color=$WRONG                                       \
    \
    --blur 8                                                  \
    --greeter-text 'Hello Zoé! Type your password to unlock'  \
    --greeter-font='Liberation Mono'                          \
    --greeter-size=28                                         \
    --greeter-pos='1160:850'                                  \
    --greeter-color=$TEXT                                     \
    --verif-text='...'                                        \
    --verif-font='Liberation Mono'                            \
    --verif-color=$TEXT                                       \
    --wrong-text='<3'                                         \
    --wrong-font='Liberation Mono'                            \
    --wrong-color=$TEXT                                       \
    --noinput-text=' '                                        \
    --ring-width 10                                           \
    --indicator                                               \
    --clock                                                   \
    --time-str='%H:%M'                                        \
    --time-color=$TEXT                                        \
    --time-font='Liberation Mono'                             \
    --time-size=42                                            \
    --date-str='%Y-%m-%d'                                     \
    --date-color=$TEXT                                        \
    --date-font='Liberation Mono'                             \
    --date-size=22
