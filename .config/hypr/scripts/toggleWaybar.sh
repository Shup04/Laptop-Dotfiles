# Check if Waybar is running
if pgrep -x "waybar" > /dev/null; then
    echo "Waybar is running. Stopping it..."
    # Kill the Waybar process
    pkill -x waybar
else
    echo "Waybar is not running. Starting it..."
    # Start Waybar
    waybar &
fi