if [[ $(cat /sys/class/power_supply/BAT1/status) == "Charging" ]]; then
    echo "  "
fi
