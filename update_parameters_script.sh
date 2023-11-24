#!/bin/bash

# Default values
release_build="S20"
release_letter="T"
build_number="17"
prev_release_letter="U"
two_releases_prior_letter="T"
host="\\SED1"
database="020.36"
prefix_letter="S"
new_disk="$DATA1"
old_disk="$DATA2"
port="13000"
ctcws="36.64"
tma="21.2"

# Function to display current parameters
display_parameters() {
    echo "Release Build: $release_build"
    echo "Release Letter: $release_letter"
    echo "Build Number: $build_number"
    echo "Previous Release Letter: $prev_release_letter"
    echo "2 Releases Prior Letter: $two_releases_prior_letter"
    echo "Host: $host"
    echo "Database: $database"
    echo "Prefix Letter: $prefix_letter"
    echo "New Disk: $new_disk"
    echo "Old Disk: $old_disk"
    echo "Port: $port"
    echo "CTCWS: $ctcws"
    echo "TMA: $tma"
}

# Function to update parameters based on user inputs
update_parameters() {
    read -p "Enter Release Build: " release_build
    read -p "Enter Release Letter: " release_letter
    read -p "Enter Build Number: " build_number
    read -p "Enter Previous Release Letter: " prev_release_letter
    read -p "Enter 2 Releases Prior Letter: " two_releases_prior_letter
    read -p "Enter Host: " host
    read -p "Enter Database: " database
    read -p "Enter Prefix Letter: " prefix_letter
    read -p "Enter New Disk: " new_disk
    read -p "Enter Old Disk: " old_disk
    read -p "Enter Port: " port
    read -p "Enter CTCWS: " ctcws
    read -p "Enter TMA: " tma
}

# Display default parameters
echo "Default Parameters:"
display_parameters

# Ask user if they want to update parameters
read -p "Do you want to update parameters? (y/n): " choice

# If user chooses to update, call the update_parameters function
if [ "$choice" == "y" ]; then
    update_parameters
fi

# Display updated parameters
echo "Updated Parameters:"
display_parameters
