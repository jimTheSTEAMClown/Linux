#! /bin/bash
# ============================================================================
# shell script to restore an Ubuntu Linux Class Image after a clean Ubuntu install
# Source: STEAM Clown - www.steamclown.org
# GitHub: https://github.com/jimTheSTEAMClown/Linux
# Hacker: Jim Burnham - STEAM Clown, Engineer, Maker, Propmaster & Adrenologist
# This example code is licensed under the CC BY-NC-SA 4.0, GNU GPL and EUPL
# https://creativecommons.org/licenses/by-nc-sa/4.0/
# https://www.gnu.org/licenses/gpl-3.0.en.html
# https://eupl.eu/
# Program/Design Name:  Ubuntu-24.04-New-Clean-Install.sh
# Description: shell script to restore an Ubuntu Linux Class Image after a
#              clean Ubuntu install, and leave the box ready for a ROS 2
#              distro install script (Humble/Jazzy) to run next.
# Dependencies: internet access, sudo privileges, Ubuntu 24.04 (Noble)
# Revision:
#  Revision 0.04 - Updated 07/10/2026
#    - IMPORTANT: this script prepares the box for ROS 2 and stops there.
#      It adds the ROS 2 apt repo/key so the packages are RESOLVABLE, but it
#      does NOT run `apt install ros-<distro>-desktop` or anything else that
#      pulls actual ROS 2 packages. Run your distro-specific script
#      (e.g. Ubuntu-24.04-ROS2-Jazzy-Install.sh) separately for that step.
#  Revision 0.03 - Updated 07/10/2026
#    - Rewritten as documented functions, one per section, each logged
#    - Every command routed through a run() wrapper so one failed/renamed
#      package (e.g. arduino) does not abort the whole build
#    - Full session logged to ~/steamclown-logs/ (timestamped file)
#    - Removed all prompts except the initial "do you want to run" question;
#      everything after that runs unattended with -y
#    - Fixed unquoted $yesInstall comparisons (broke on empty input)
#    - Fixed Google Chrome install to use `apt install ./file.deb` so apt
#      resolves dependencies instead of a bare dpkg -i
#    - Added ROS 2 readiness: UTF-8 locale, universe/multiverse repos,
#      ROS 2 apt source + key, colcon/rosdep/vcstool, chrony, avahi-daemon
#  Revision 0.02 - Updated 05/04/2024 for SVCTE Mechatronics Class
#  Revision 0.01 - Created 05/04/2024
# Additional Comments:
# https://ubuntu.com/tutorials/access-remote-desktop#1-overview
# https://askubuntu.com/questions/1369973/how-to-connect-to-ubuntu-via-vnc-from-windows
# https://www.makeuseof.com/tag/how-to-establish-simple-remote-desktop-access-between-ubuntu-and-windows/
# https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debs.html
#
# Copy This wget
# sudo wget -O Ubuntu-24.04-New-Clean-Install.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/Ubuntu-24.04-New-Clean-Install.sh
# ============================================================================

set -uo pipefail

# ----------------------------------------------------------------------------
# Logging setup
# Every run gets its own timestamped log file under ~/steamclown-logs/.
# stdout+stderr are teed to both the terminal and the log file.
# ----------------------------------------------------------------------------
LOGDIR="$HOME/steamclown-logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/Ubuntu-24.04-Class-Image-Update-$(date +%Y%m%d-%H%M%S).log"
exec > >(tee -a "$LOGFILE") 2>&1

log_section() {
    # Prints a timestamped section header so the log file reads like a
    # table of contents of the build.
    echo ""
    echo "============================================================"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
    echo "============================================================"
}

run() {
    # Runs a command, logs it, and continues even on failure so one
    # missing/renamed package doesn't kill the rest of the class image build.
    echo "-> $*"
    if "$@"; then
        echo "   OK: $*"
    else
        echo "   FAILED (exit $?): $*"
    fi
}

# ----------------------------------------------------------------------------
# Section: Intro banner + single confirmation prompt
# This is the ONLY interactive prompt in the whole script. Everything after
# "Yes" runs unattended.
# ----------------------------------------------------------------------------
banner_intro() {
    echo "----------------------------------------------------"
    echo "Ubuntu Class Image Update Script"
    echo "Log file: $LOGFILE"
    echo "----------------------------------------------------"
    pwd
    ls
}

confirm_run() {
    echo " "
    echo "----------------------------------------------------"
    echo "Do you wish to run the Ubuntu Class Image Update?"
    echo "----------------------------------------------------"
    select yn in "Yes" "No"; do
        case $yn in
            Yes )
                log_section "User confirmed - starting unattended build"
                break;;
            No )
                log_section "User declined - exiting without changes"
                exit 0;;
        esac
    done
}

# ----------------------------------------------------------------------------
# Section: System update/upgrade
# ----------------------------------------------------------------------------
system_update_upgrade() {
    log_section "System update and upgrade"
    run sudo apt update
    run sudo apt upgrade -y
}

# ----------------------------------------------------------------------------
# Section: Core CLI/networking tools
# ----------------------------------------------------------------------------
install_core_tools() {
    log_section "Core tools: curl, git, ssh, openssh-server, putty, net-tools"
    run sudo apt install -y curl git ssh openssh-server putty net-tools
    run sudo ufw allow ssh
}

# ----------------------------------------------------------------------------
# Section: Google Chrome
# Uses `apt install ./file.deb` instead of `dpkg -i` so apt resolves any
# missing dependencies automatically instead of leaving a broken package.
# ----------------------------------------------------------------------------
install_google_chrome() {
    log_section "Google Chrome"
    local tmpdir
    tmpdir="$(mktemp -d)"
    (
        cd "$tmpdir" || exit 1
        wget -O google-chrome-stable_current_amd64.deb \
            https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo apt install -y ./google-chrome-stable_current_amd64.deb
    )
    rm -rf "$tmpdir"
    command -v google-chrome >/dev/null 2>&1 \
        && echo "   OK: google-chrome installed" \
        || echo "   NOTE: google-chrome not found on PATH after install"
}

# ----------------------------------------------------------------------------
# Section: Desktop metapackage + power/lock settings
# NOTE: only meaningful if this box was imaged from a Server ISO with no
# desktop environment. On a stock Desktop install this is a redundant no-op.
# ----------------------------------------------------------------------------
configure_desktop_settings() {
    log_section "Desktop metapackage + power/lock settings"
    run sudo apt install -y ubuntu-gnome-desktop
    run gsettings set org.gnome.desktop.session idle-delay 800
    run gsettings set org.gnome.desktop.screensaver lock-delay 900
}

# ----------------------------------------------------------------------------
# Section: Editors and IDEs
# NOTE: the legacy `arduino` package (IDE 1.x) has been dropped from some
# Ubuntu repo revisions. If it fails here, install Arduino IDE 2.x manually
# via the .AppImage from arduino.cc instead.
# ----------------------------------------------------------------------------
install_editors_and_ides() {
    log_section "Editors and IDEs: vim, thonny, notepad++, arduino, VS Code"
    run sudo apt install -y vim thonny
    # run sudo snap install notepad-plus-plus
    # run sudo apt install -y arduino
    run sudo snap install --classic code
}

# ----------------------------------------------------------------------------
# Section: Python + build tooling
# ----------------------------------------------------------------------------
install_python_tooling() {
    log_section "Python + build tooling"
    run sudo apt install -y python3-pip python3-venv build-essential
}

# ----------------------------------------------------------------------------
# Section: Locale (UTF-8)
# ROS 2 requires a UTF-8 locale. Stock Ubuntu Desktop installs are usually
# already fine, but class-imaged/minimal installs sometimes aren't.
# ----------------------------------------------------------------------------
configure_locale_utf8() {
    log_section "Locale (UTF-8) - required by ROS 2"
    run sudo apt install -y locales
    run sudo locale-gen en_US en_US.UTF-8
    run sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
}

# ----------------------------------------------------------------------------
# Section: Universe/multiverse repos
# The ROS 2 apt package set depends on packages that live in universe.
# ----------------------------------------------------------------------------
enable_universe_multiverse() {
    log_section "Universe/multiverse repos - required for ROS 2 apt deps"
    run sudo apt install -y software-properties-common
    run sudo add-apt-repository -y universe
    run sudo add-apt-repository -y multiverse
    run sudo apt update
}

# ----------------------------------------------------------------------------
# Section: ROS 2 apt repository + GPG key
# This only ADDS the ROS 2 apt source - it does not install ros-<distro>-desktop.
# Run your distro-specific script next (e.g. Ubuntu-24.04-ROS2-Jazzy-Install.sh).
# ----------------------------------------------------------------------------
add_ros2_apt_repo() {
    log_section "ROS 2 apt repository + GPG key (repo prep ONLY - no packages installed)"
    run sudo apt install -y curl gnupg2 lsb-release
    run sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
        -o /usr/share/keyrings/ros-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo "$UBUNTU_CODENAME") main" \
        | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
    run sudo apt update
    echo "   ROS 2 apt source added. Run your distro install script next"
    echo "   (e.g. Ubuntu-24.04-ROS2-Jazzy-Install.sh) to pull the actual packages."
}

# ----------------------------------------------------------------------------
# Section: ROS 2 dev prerequisites
# colcon/rosdep/vcstool are the standard workspace tools; chrony keeps clocks
# in sync for DDS discovery across lab machines; avahi-daemon enables mDNS
# hostname discovery on the local network.
# ----------------------------------------------------------------------------
install_ros2_prereqs() {
    log_section "ROS 2 dev prerequisites: colcon, rosdep, vcstool, time sync, mDNS"
    run sudo apt install -y python3-colcon-common-extensions python3-rosdep python3-vcstool
    run sudo apt install -y chrony avahi-daemon
    if [ ! -d /etc/ros/rosdep ]; then
        run sudo rosdep init
    else
        echo "   rosdep already initialized, skipping init"
    fi
    run rosdep update
}

# ----------------------------------------------------------------------------
# Section: Verification
# Confirms what actually landed on PATH rather than assuming apt succeeded.
# ----------------------------------------------------------------------------
verify_installed_apps() {
    log_section "Verifying installed apps"
    for cmd in curl git ssh putty arduino code python3 pip3 colcon rosdep; do
        if command -v "$cmd" >/dev/null 2>&1; then
            echo "   OK: $cmd -> $(command -v "$cmd")"
        else
            echo "   MISSING: $cmd"
        fi
    done
    curl --version | head -n1
    git --version
    python3 -V
    pip3 -V
    code --version 2>/dev/null || echo "   NOTE: code --version failed (snap may need a fresh shell)"
    command -v ifconfig >/dev/null 2>&1 && ifconfig || echo "   NOTE: net-tools ifconfig not on PATH yet (new shell may be needed)"
}

# ----------------------------------------------------------------------------
# Section: Summary + next steps
# ----------------------------------------------------------------------------
final_summary() {
    log_section "Class image build complete"
    echo "  _  _  ____  _  _  ____    ___  ____  ____  ____  ___ "
    echo " ( \( )( ___)( \/ )(_  _)  / __)(_  _)( ___)(  _ \/ __) "
    echo "  )  (  )__)  )  (   )(    \__ \  )(   )__)  )___/\__ \ "
    echo " (_)\_)(____)(_/\_) (__)   (___/ (__) (____)(__)  (___/ "
    echo " "
    echo "  Log saved to: $LOGFILE"
    echo " "
    echo "Next steps:"
    echo "  1. Reboot or open a fresh shell so snap/PATH changes take effect."
    echo "  2. Run the ROS 2 distro-specific install script (e.g. Jazzy or Humble)"
    echo "     to pull ros-<distro>-desktop and set up the colcon workspace."
    echo "  3. Confirm time sync is active before multi-machine DDS testing:"
    echo "     timedatectl"
}

# ============================================================================
# Main
# ============================================================================
banner_intro
confirm_run
system_update_upgrade
install_core_tools
install_google_chrome
configure_desktop_settings
install_editors_and_ides
install_python_tooling
configure_locale_utf8
enable_universe_multiverse
add_ros2_apt_repo
install_ros2_prereqs
verify_installed_apps
final_summary
