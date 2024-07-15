# SaturnBurner
Sega Saturn backup burning utility for FreeBSD

# Sega Saturn Disc Image Burner Script

This script utilizes 'cdrdao' to burn Sega Saturn disc image files on FreeBSD at a low level, using the appropriate drive and writing method.

**IMPORTANT:** Install the following packages as dependencies before running the script:

`cdrdao cdrkit cdrtools`

You need to **read and customize** the script to specify the path where your directories containing Sega Saturn `.bin` and `.cue` files are located.
