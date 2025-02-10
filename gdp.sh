#!/bin/bash

# Function to prompt the user for input
get_input() {
    local var_name="$1"
    local prompt_text="$2"
    local value
   
    while true; do
        read -p "$prompt_text (in billions): " value
        if [[ "$value" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
            eval "$var_name=$value"
            break
        else
            echo "Invalid input. Please enter a numeric value."
        fi
    done
}

# Get input from user
get_input C "Enter the value of Consumption (C)"
get_input I "Enter the value of Investment (I)"
get_input G "Enter the value of Government Spending (G)"
get_input X "Enter the value of Exports (X)"
get_input M "Enter the value of Imports (M)"

# Calculate GDP
GDP=$(echo "$C + $I + $G + ($X - $M)" | bc)

# Display the result
echo "The calculated GDP is: $GDP billion"