#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Send ONC alert (send-onc-alert)
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🚨
# @raycast.argument1 { "type": "text", "placeholder": "Priority (default: P1)", "optional": true }

# Documentation:
# @raycast.description Use this command to send an ONC alert via the HTTP alert source.
# @raycast.author Charlie Revett (@revcd)
# @raycast.authorURL https://revcd.com

# Load the environment variables, so that we have the auth token.
source ~/projects/github.com/incident-io/core/server/config/.env

# Static variables.
possibleColors=(
  "Red" "Green" "Blue" "Yellow" "Purple" "Pink" "Black" "White" "Orange"
  "Cyan" "Magenta" "Brown" "Lime" "Olive" "Maroon" "Turquoise" "Silver"
  "Gold" "Bronze" "Violet" "Indigo" "Teal" "Navy" "Azure" "Lavender"
  "Peach" "Mint" "Burgundy" "Coral" "Chartreuse" "Beige"
)
possibleAnimals=(
  "Dog" "Cat" "Bird" "Fish" "Lion" "Tiger" "Elephant" "Bear" "Shark"
  "Eagle" "Frog" "Snake" "Bison" "Bee" "Butterfly" "Camel" "Dolphin"
  "Horse" "Kangaroo" "Llama" "Otter" "Penguin" "Rabbit" "Leopard"
  "Squirrel" "Turtle" "Wolf" "Zebra" "Giraffe" "Hippo" "Monkey" "Panda"
  "Koala" "Ostrich" "Seal" "Walrus" "Whale" "Moose" "Deer" "Raccoon"
  "Fox" "Alligator" "Crocodile" "Parrot" "Peacock" "Hedgehog" "Iguana"
  "Goose" "Hawk" "Octopus" "Crab" "Lobster" "Starfish" "Jellyfish"
  "Owl" "Porcupine"
)
possibleTeams=("RESP" "PINC" "CAT" "ONCX" "ONCP")
possibleServices=("API" "Auth" "SAML" "Engine" "Workflows" "Insights" "Actions" "Notifications")

# Pick a random element from an array.
pick_random() {
  local array=("$@")
  local index=$((RANDOM % ${#array[@]}))
  echo "${array[$index]}"
}

# Generate a random GUID.
generate_guid() {
  uuidgen
}

# Generate the alert title.
color=$(pick_random "${possibleColors[@]}")
animal=$(pick_random "${possibleAnimals[@]}")
day=$(date +'%d')
month=$(date +'%m')
randomAlertTitle="$color $animal #$day$month"

# Generate other random variables.
guid=$(generate_guid)
team=$(pick_random possibleTeams[@])
service=$(pick_random possibleServices[@])

# Generate the date string.
dateString=$(date +'%a, %d %b %Y, %I:%M %p')

# Determine priority from the user input or default to "p1".
priority=${1:-"p1"}

# Replace variables in JSON payload.
payload=$(cat <<EOF
{
  "title": "$randomAlertTitle",
  "description": "This is a test alert created via the HTTP alert source at $dateString.",
  "deduplication_key": "$guid",
  "status": "firing",
  "metadata": {
    "team": "$team",
    "service": "$service",
    "priority": "$priority"
  }
}
EOF
)

# Send the HTTP POST request using curl
curl --location 'https://incident-io-charlie.eu.ngrok.io/api/public/v2/alert_events/http/01HS95NT29H58ZJCXV7BNK690X' \
--header "Authorization: Bearer $LOCAL_HTTP_ALERT_SOURCE_TOKEN" \
--header 'Content-Type: application/json' \
--data "$payload"

echo "Alert sent: $randomAlertTitle"
