
#!/bin/bash

# Function to take a screenshot of the entire screen
take_full_screenshot() {
    ffmpeg -f x11grab -s $(xdpyinfo | grep dimensions | awk '{print $2}') -i :0.0 -frames 1 ~/Pictures/screenshots/all"$(date +%F\ %T)".png > /dev/null 2>&1
}

# Function to take a screenshot of the selected window
take_window_screenshot() {
    ffcast -q -# "$(xdotool getactivewindow)" png ~/Pictures/screenshots/active"$(date +%F\ %T)".png > /dev/null 2>&1
}

# Function to take a screenshot of a selected rectangle
take_select_screenshot() {
    ffcast -fw png /home/m/Pictures/screenshots/select"$(date +%F\ %T)".png > /dev/null 2>&1
}

# Function to take a screenshot of a selected area
take_area_screenshot() {
    ffcast -s trim png /home/m/Pictures/screenshots/area"$(date +%F\ %T)".png > /dev/null 2>&1
}

# Check the argument passed to the script
case "$1" in
    "full")
        take_full_screenshot
        ;;
    "window")
        take_window_screenshot
        ;;
    "select")
        take_select_screenshot
        ;;
    "area")
        take_area_screenshot
        ;;
    *)
        echo "Invalid argument. Please use 'full', 'window', 'rectangle', or 'area'."
        exit 1
        ;;
esac

