#!/bin/bash

WINDOW_TITLE="scratchpad"
WINDOW_ID=$(yabai -m query --windows | jq -e ".[] | select(.app==\"WezTerm\") | .id") || true

if [[ -z "$WINDOW_ID" ]]; then
  open -a "WezTerm"
else
  WINDOW_QUERY=$(yabai -m query --windows --window "$WINDOW_ID")
  IS_HIDDEN=$(echo "$WINDOW_QUERY" | jq '."is-hidden"')
  HAS_FOCUS=$(echo "$WINDOW_QUERY" | jq '."has-focus"')

  if [[ "${HAS_FOCUS}" != "true" ]]; then
    yabai -m window "$WINDOW_ID" --space mouse --move abs:0:0 --grid "10:1:0:0:1:8" --layer above --focus
  fi
  if [[ "${IS_HIDDEN}" != "true" ]]; then
    skhd -k "cmd - h"
  fi
fi
