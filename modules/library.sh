#!/bin/bash

cat << "EOF"
  __                  _   _             _     _ _
 / _|_   _ _ __   ___| |_(_) ___  _ __ | |   (_) |__
| |_| | | | '_ \ / __| __| |/ _ \| '_ \| |   | | '_ \
|  _| |_| | | | | (__| |_| | (_) | | | | |___| | |_) |
|_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|_____|_|_.__/

EOF

# ------------------------------------------------------
# Function: Is package installed
# ------------------------------------------------------
_isInstalledPacman() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

_isInstalledYay() {
    package="$1";
    check="$(yay -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# ------------------------------------------------------
# Function to install all Pacman packages if not installed
# ------------------------------------------------------
_installPackagesPacman() {
    toInstall=();

    for pkg; do
        if [[ $(_isInstalledPacman "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;

        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All pacman packages are already installed.";
        return;
    fi;

    printf "Packages not installed:\n%s\n" "${toInstall[@]}";
    sudo pacman -S "${toInstall[@]}";
}

# ------------------------------------------------------
# Function to install all Yay packages if not installed
# ------------------------------------------------------
_installPackagesYay() {
    toInstall=();

    for pkg; do
        if [[ $(_isInstalledYay "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;

        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All packages are already installed.";
        return;
    fi;

    printf "AUR ackages not installed:\n%s\n" "${toInstall[@]}";
    yay -S "${toInstall[@]}";
}

# ------------------------------------------------------
# Function to prompt for symlink creation
# ------------------------------------------------------
_installSymLink() {
    name="$1"           # Name of the symlink (for display purposes)
    linksource="$2"     # Source path for the symlink
    linktarget="$3"     # Target path for the symlink

    while true; do
        read -p "DO YOU WANT TO INSTALL ${name}? (Existing dotfiles will be removed!) (Yy/Nn): " yn
        case $yn in
            [Yy]* )
                # Check if the symlink exists
                if [ -e "${linktarget}" ]; then
                    # Handle different types of existing targets
                    if [ -L "${linktarget}" ]; then
                        rm "${linktarget}"
                        ln -s "${linksource}" "${linktarget}"
                        echo "Symlink ${linksource} -> ${linktarget} created."
                        echo ""
                    elif [ -d "${linktarget}" ]; then
                        rm -rf "${linktarget}/"
                        ln -s "${linksource}" "${linktarget}"
                        echo "Symlink for directory ${linksource} -> ${linktarget} created."
                        echo ""
                    elif [ -f "${linktarget}" ]; then
                        rm "${linktarget}"
                        ln -s "${linksource}" "${linktarget}"
                        echo "Symlink to file ${linksource} -> ${linktarget} created."
                        echo ""
                    else
                        ln -s "${linksource}" "${linktarget}"
                        echo "New symlink ${linksource} -> ${linktarget} created."
                        echo ""
                    fi
                else
                    # If symlink doesn't exist, create a new one
                    ln -s "${linksource}" "${linktarget}"
                    echo "New symlink ${linksource} -> ${linktarget} created."
                    echo ""
                fi
                break;;
            [Nn]* )
                # If user chooses not to install, break out of the loop
                echo ""
                break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# -----------------------------------------
# Function to prompt for user confirmation
# -----------------------------------------
confirm_execution() {
    while true; do
        read -p "Do you want to run this step? (y/n/q): " choice
        if [[ "$choice" =~ ^[Yy]$ ]]; then
            echo "STARTED."
            eval "$@"
            break
        elif [[ "$choice" =~ ^[Nn]$ ]]; then
            echo "SKIPPED."
            break
        elif [[ "$choice" =~ ^[Qq]$ ]]; then
            echo "Quitting."
            exit 0
        else
            echo "Invalid option. Enter 'y' for yes, 'n' for no, or 'q' for quit."
        fi
    done
}

# -----------------------------------------
# Function to confirm start
# -----------------------------------------
confirm_start() {
    while true; do
        read -p "DO YOU WANT TO PROCEED (Yy/Nn): " yn
        case $yn in
            [Yy]* )
                echo "Started."
                break;;
            [Nn]* ) 
                exit;;
                break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}
