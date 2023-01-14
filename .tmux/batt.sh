#!/bin/bash

# Return the battery percentage with a custom icon and color
# the color is green if the battery is above 75%, yellow if it's between 50% and 75% and red if it's below 50%
# the icon is a battery icon if the battery is above 75%, a battery icon with a yellow exclamation mark if it's between 50% and 75% and a battery icon with a red exclamation mark if it's below 50%
# Requires: acpi, sed, awk, bc

BATTERY=$(acpi -b | sed 's/.* \([0-9]\+\)%.*/\1/')
ICON="  "
COLOR="#[fg=colour2]"

if [ $BATTERY -lt 75 ]; then
  ICON="  "
elif [ $BATTERY -lt 50 ]; then
  ICON="  "
elif [ $BATTERY -lt 30 ]; then
  COLOR="#[fg=colour130]"
elif [ $BATTERY -lt 25 ]; then
  ICON="  "
elif [ $BATTERY -lt 15 ]; then
  COLOR="#[fg=colour1]"
elif [ $BATTERY -lt 10 ]; then
  ICON="  "
fi

STATUS=$(acpi -b | awk '{print $3}' | sed 's/,//')

# Set the icon
if [ $STATUS = "Charging" ]; then
    ICON=""
fi

# Print the battery percentage
echo -e "$COLOR$ICON #[fg=white]$BATTERY%"

