#!/bin/bash
# Check the file permission, make sure that the execute is enabled
# Run the script and you will be asked to add or delete a user

echo "Welcome!"

while true
do

    # Input choice C for create and D for delete
    echo "Do you want to CREATE or DELETE a user?"
    read -p "Please type C to create, type D to delete, or type Q to quit: " CHOICE

    # If you type C, the program will ask for a username and create a user
    if [[ $CHOICE = "C" || $CHOICE = "c" ]]
    then
        echo "You are creating a user."
        read -p "Please type a username: " USERNAME
        sudo useradd $USERNAME
        echo "User has been created."
        echo ""
    
    # If you type D, the program will ask for confirmation before deleting a user. 
    elif [[ $CHOICE = "D" || $CHOICE = "d" ]]
    then
        echo "You are deleting a user."
        read -p "Please type a username: " USERNAME
        echo "Are you sure you want to delete $USERNAME? "
        read -p "Please type Y for yes and N for no: " CONFIRM
        echo ""
            
            # Confirmation to delete the user
            while true
            do
                if [[ $CONFIRM = "Y" || $CONFIRM = "y" ]]
                then
                    sudo userdel -r $USERNAME
                    echo "User has been deleted."
                    echo ""
                    break
                elif [[ $CONFIRM = "N" || $CONFIRM = "n" ]]
                    then
                    echo "$USERNAME is not deleted."
                    echo ""
                    break
                else
                    echo "Please type Y or N only, thank you."
                    echo ""
                    break
                fi
            done
    
    # Quit the loop
    elif [[ $CHOICE = "Q" || $CHOICE = "q" ]]
    then
        echo "Thank you. Have a great day!"
        echo "Current users: "
        sudo tail -n 5 /etc/passwd
        echo ""
        break
    fi
done


