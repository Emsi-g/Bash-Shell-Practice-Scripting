#!/bin/bash
# Check the file permission, make sure that the execute is enabled
# Run the script, and you will see the options for user modification

echo "Welcome! You are about to modify a user."
read -p "Type the username you want to modify: " USERNAME


# Test if the user exists
id -u "$USERNAME" >/dev/null 2>&1
REQ=$?

if [ $REQ -eq 0 ]
then
    echo "User exist."
    echo
    echo "Please choose the modification options below:"
    printf "1) Add/Edit Comment\n2) Change Home Directory\n3) Change Expiry Date\n" 
    printf "4) Add Group User\n5) Change User Login Name\n6) Lock a user\n"
    printf "7) Unlock a User\n8) Create a Shell\n9) Change User ID\n"
    read -p "Choose one: " CHOICE
    echo
    
    case $CHOICE in
        1)
            echo "Add/edit comment for a user."
            echo "TAKE NOTE! Do not include double quotation mark (\" \")"
            read -p "Type the comment here: " VAL
            sudo usermod -c "$VAL" $USERNAME
            echo "The comment has been added."
            sudo grep $USERNAME /etc/passwd
            echo
            ;;
        
        2)
            echo "Change the home directory of a user."
            echo "TAKE NOTE! Use ABSOLUTE path, and include slash (/). For ex: /home/ec2-user"
            read -p "Type the new directory here: " VAL
            sudo usermod -d $VAL $USERNAME
            echo "The home directory has been changed."
            sudo grep $USERNAME /etc/passwd
            echo
            ;;
        
        3)
            echo "Change the expiry date of a user."
            echo "TAKE NOTE! Follow the format strictly, use YY-MM-DD. For ex: 2022-01-25 (Jan 25, 2022)"
            read -p "Type the date here: " VAL
            sudo usermod -e $VAL $USERNAME
            echo "The expiry date has been changed."
            sudo chage -l $USERNAME | grep Account
            echo
            ;;
        
        4)
            echo "Add user to the group/s."
            echo "TAKE NOTE! If you want to include two or more groups, just add spaces between them."
            echo "For ex: Group1 Group2 Group3"
            read -p "Type the group/s here: " VAL
            sudo usermod -a -G $VAL $USERNAME
            REQQ=$?
                # Check if the group exists
                if [ $REQQ = 0 ]
                then
                    echo "The group has been added."
                    id $USERNAME
                else
                    echo "The group is not added"
                fi
            echo
            ;;
        
        5)
            echo "Change user login name."
            read -p "Type the new username here: " VAL
            sudo usermod -l $VAL $USERNAME
            echo "The username has been changed."
            sudo grep $VAL /etc/passwd
            echo
            ;;
        
        6)
            echo "Lock a user."
            read -p "Type the username here: " VAL
            sudo usermod -L $VAL
            echo "The user has been locked."
            echo
            ;;
            
        7)
            echo "Unlock a user."
            read -p "Type the username here: " VAL
            sudo usermod -U $VAL
            echo
            read -p "Do you want to set the password now? (Y/N): " CHOOSE
                # Follow up option for changing password
                if [[ $CHOOSE = "Y" || $CHOOSE = "y" ]]
                then
                    echo "You are about to set an unencrypted password for the user."
                    read -p "Type the password here: " PASS
                    sudo usermod -p $PASS $VAL
                    echo "The password has been added."
                elif [[ $CHOOSE = "N" || $CHOOSE = "n" ]]
                then
                    echo "Please, take note that $VAL is passswordless."
                fi
            echo "The user has been unlocked."
            echo
            ;;
        
        8)
            echo "Create a shell for the user"
            echo "TAKE NOTE! Use ABSOLUTE path, and include slash (/). For ex: /bin/sh"
            read -p "Type the shell here: " VAL
            sudo usermod -s $VAL $USERNAME
            echo "The shell has been created."
            echo
            ;;
        
        9)
            echo "Change the user ID of a user"
            read -p "Type the new ID here: " VAL
            sudo usermod -u $VAL $USERNAME
            echo "The user ID has been changed."
            id $USERNAME
            echo
            ;;
            
    esac
else
    echo "User not found"
fi