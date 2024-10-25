
#!/bin/bash

# Check Mullvad VPN connection status and get location if connected
vpn_status=$(mullvad status -v)

if [[ $vpn_status == *"Connected"* ]]; then
    # Extract location from the status output
    location=$(echo "$vpn_status" | awk '/Visible location/ {print $3 $4}')
    echo "  $location"
else
    echo ""
fi

