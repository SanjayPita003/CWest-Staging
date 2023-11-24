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

# Function to perform pre-staging activities
prestage_activities() {
    # SSH commands using dynamically set parameters
    ssh wil-trng1 ls –ld "/L/ctc_data/ctc_data.${release_build}.${database}"
    ssh wil-trng2 ls –ld "/L/ctc_data/ctc_data.${release_build}.${database}"

    ssh wil-trng1 ls –ld "/L/ctcws/ctcws.${ctcws}"
    ssh wil-trng2 ls –ld "/L/ctcws/ctcws.${ctcws}"

    ssh wil-trng1 ls –ld "/L/gds/tma.${tma}"
    ssh wil-trng2 ls –ld "/L/gds/tma.${tma}"
}

# Function to perform additional SSH commands
additional_ssh_commands() {
    # SSH commands for PRODSE.USER1
    ssh PRODSE.USER1@SED1 "EMANT TP1; DE"

    # SSH commands for TRAIN.TRNING
    ssh TRAIN.TRNING@SED1 "EMANT TT2; DE"

    # SSH commands for RC.MGR
    ssh RC.MGR@SED1 "EMANT TRA; DE"

    # SSH commands for RX.FER
    ssh RX.FER@SED1 "VOLUME $SYSTEM.EMANT; PURGE *; FI"
}

# Display default parameters
echo "Default Parameters:"
display_parameters

# Ask user if they want to update parameters
read -p "Do you want to update parameters? (y/n): " choice

# If the user chooses to update, call the update_parameters function
if [ "$choice" == "y" ]; then
    update_parameters
fi

# Display updated parameters
echo "Updated Parameters:"
display_parameters

# Perform pre-staging activities
echo "Performing Pre-staging Activities:"
prestage_activities

# Perform additional SSH commands
echo "Performing Additional SSH Commands:"
additional_ssh_commands
