#!/bin/bash

declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

# Update this path to your actual sound file (wav recommended if using aplay)
if [[ -n "${BASH_SOURCE[0]}" ]]; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
else
    SCRIPT_DIR="$(cd "$(dirname "${(%):-%N}")" && pwd)"  # for zsh
fi

SOUND_FILE="$SCRIPT_DIR/alert.wav"

play_sound() {
    if command -v afplay &>/dev/null; then
        afplay "$SOUND_FILE" &>/dev/null
        sleep 0.5
    elif command -v aplay &>/dev/null; then 
        aplay "$SOUND_FILE" &>/dev/null; 
        sleep 0.5
    else
        echo "sound player not found, cannot play sound."
    fi
}

pomodoro () {
    if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
        val=$1
        duration=${2:-${pomo_options["$val"]}}  # Use second arg if provided
        echo "$val for $duration minutes 🍅" | lolcat
        timer "${duration}m"
        play_sound
        echo "🔔 $val session done!" | lolcat
    fi
}
