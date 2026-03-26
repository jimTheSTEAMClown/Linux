#!/bin/bash

# =============================================================
# cd-picker.sh — Quick Directory Navigation Menu
#
# HOW TO USE:
#   1. Edit the PATHS and LABELS arrays below with your own paths
#   2. Save the file
#   3. Make it executable:  chmod +x cd-picker.sh
#   4. Source it (don't just run it — sourcing makes the cd stick):
#        source cd-picker.sh
#      or the shorthand:
#        . cd-picker.sh
#
# TIP: Add this alias to your ~/.bashrc or ~/.bash_profile so you
#      can call it from anywhere by just typing: goto
#        alias cd-picker ='. /path/to/cd-picker.sh'
# =============================================================

# =============================================================
# EDIT THESE — your project paths and their display labels
# =============================================================

LABELS=(
    "Desktop"
    "Documents"
    "Downloads"
    "FromPi Dir on Mechatronics drive"
    "GitHub Classroom Repos"
    "Starship Security Repo"
    "Python Projects"
    "Mechatronics Class"
    "Coding Templates"
    "Home directory"
)

PATHS=(
    "$HOME/Desktop"
    "$HOME/Documents"
    "$HOME/Downloads"
    "/d/Mechatronics-Engineering/Units/Unit-8-Programming-Python-IoT/Python/code/fromPi"
    "/d/Mechatronics-Engineering/Units/workshops/GitHub"
    "/d/Mechatronics-Engineering/Units/workshops/GitHub"
    "$HOME/Documents/python-projects"
    "$HOME/Documents/mechatronics"
    "$HOME/Documents/templates"
    "$HOME"
)

# =============================================================
# SCRIPT — no need to edit below this line
# =============================================================

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
NC='\033[0m'

# Check arrays are same length
if [ "${#LABELS[@]}" -ne "${#PATHS[@]}" ]; then
    echo -e "${RED}ERROR: LABELS and PATHS arrays must have the same number of entries.${NC}"
    return 1 2>/dev/null || exit 1
fi

TOTAL="${#LABELS[@]}"

# -----------------------------------------------
# Print the menu
# -----------------------------------------------
echo ""
echo -e "${BLUE}  ========================================${NC}"
echo -e "${BLUE}    Quick Navigation — Choose a Location  ${NC}"
echo -e "${BLUE}  ========================================${NC}"
echo ""

for i in "${!LABELS[@]}"; do
    num=$((i + 1))
    label="${LABELS[$i]}"
    path="${PATHS[$i]}"

    # Show a checkmark if the directory actually exists
    if [ -d "$path" ]; then
        marker="${GREEN}✓${NC}"
    else
        marker="${RED}✗${NC}"
    fi

    # Pad number for alignment
    printf "  ${CYAN}%2d)${NC}  %b  %-28s ${GRAY}%s${NC}\n" \
        "$num" "$marker" "$label" "$path"
done

echo ""
echo -e "  ${CYAN} 0)${NC}     Cancel — stay where I am"
echo ""
echo -e "${BLUE}  ========================================${NC}"
echo -e "  ${GRAY}Green ✓ = folder exists  |  Red ✗ = not found${NC}"
echo ""

# -----------------------------------------------
# Read user input
# -----------------------------------------------
read -rp "  Enter number: " choice

# Handle cancel
if [[ "$choice" == "0" ]] || [[ -z "$choice" ]]; then
    echo -e "\n  ${YELLOW}Cancelled — staying in: $(pwd)${NC}\n"
    return 0 2>/dev/null || exit 0
fi

# Validate input is a number
if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
    echo -e "\n  ${RED}Invalid input. Please enter a number.${NC}\n"
    return 1 2>/dev/null || exit 1
fi

# Check in range
if [ "$choice" -lt 1 ] || [ "$choice" -gt "$TOTAL" ]; then
    echo -e "\n  ${RED}Number out of range. Pick 0–${TOTAL}.${NC}\n"
    return 1 2>/dev/null || exit 1
fi

# Get the selected path
INDEX=$((choice - 1))
SELECTED_PATH="${PATHS[$INDEX]}"
SELECTED_LABEL="${LABELS[$INDEX]}"

# -----------------------------------------------
# Navigate
# -----------------------------------------------
if [ -d "$SELECTED_PATH" ]; then
    cd "$SELECTED_PATH" || return 1
    echo ""
    echo -e "  ${GREEN}Navigated to: ${SELECTED_LABEL}${NC}"
    echo -e "  ${GRAY}$(pwd)${NC}"
    echo ""
    ls -la
    echo ""
else
    echo ""
    echo -e "  ${RED}Directory not found: ${SELECTED_PATH}${NC}"
    echo -e "  ${YELLOW}Check the path in goto.sh and try again.${NC}"
    echo ""
    return 1 2>/dev/null || exit 1
fi
