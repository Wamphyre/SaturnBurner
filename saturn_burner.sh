#!/bin/bash
clear
echo "================="
echo "SATURN BURNER 1.0 for FreeBSD"
echo "================="
echo ""
echo "- Insert disc"
cdcontrol eject
echo ""
read -rp "- Press 'F' after inserting the disc " KEY
if [ "$KEY" = "F" ]; then
    cdcontrol close
else
    echo "Key not recognized"
fi
echo ""
# Read the path of the directory containing the .cue files
echo "- Showing list of directories"
echo ""
ls "PUT YOUR BACKUP DIRECTORY PATH HERE" | sort
echo ""
read -rp "- Specify the directory with the .cue file: " DIR
echo ""
cd "PUT YOUR BACKUP DIRECTORY PATH HERE""$DIR"

# Search for the .cue file
CUE=$(ls | grep .cue)

# Show the user the found .cue file and confirm if they want to burn it
read -rp "Do you want to burn the file $CUE (S/N)?: " SN
echo ""
if [ "$SN" = "S" ]; then
    echo "- Burning disc..."
    echo ""
    # Invoke cdrdao
    cdrdao write --device /dev/cd0 --swap --speed 16 *.cue
    cdcontrol eject
    echo ""
    echo "Burn completed"
else
    echo "Burn not performed."
fi
