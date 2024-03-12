#!/bin/bash

# dd if=/dev/zero of=large_file bs=1M count=50

# mv lage_file /home/john

# Verify if file exists
verify_file() {
    local file="$1"  # first arg of the function

    if [ -f "$file" ]; then
        echo -e "\nFile $file exists."
    else
        echo -e "\nFile $file doesn't exist."
        exit 1
    fi

    if [ "$(basename "$file")" != "passwd" ]; then
        echo -e "\nFile name is not passwd"
        exit 1
    else
        echo -e "\nFile name is passwd"
    fi
}


# 1. Print the home directory
print_homedir(){
    local file="$1"

    echo -e "\nPrint the home directory"
    if output=$(awk -F: '{print $6}' "$file"); then #print the 6th field of every line in file; fields separated by :
        echo "$output" 
    else
        echo "Printing the home directory failed"
        exit 1   
    fi

}




# 2. List all usernames from the passwd file
list_usernames(){
    local file="$1"

    echo -e "\nList all usernames from the passwd file"
    if output=$(awk -F: '{print $1}' "$file"); then
        echo "$output" 
    else
        echo "\nListing all usernames from the passwd file failed"
        exit 1   
    fi

}


# 3. Count the number of users
count_users(){
    local file="$1"

    echo -e "\nCount the number of users"
    if output=$(awk -F: '{print $1}' "$file" | wc -l); then #the output of awk is the input for wc counting the lines
        echo "$output" 
    else
        echo "\nCounting users failed"
        exit 1   
    fi

}



# 4. Find the home directory of a specific user (prompt to enter the username value)
homedir_user(){
    local file="$1"

    echo -e "\nFind the home directory of a specific user. \nInsert user:"
    read username
    if output=$(awk -F: -v user="$username" '{if ($1 == user) {print $6}}' "$file"); then 
        echo "$output" 
    else
        echo "\nFinding the home directory of a specific user failed"
        exit 1   
    fi

}


# 5. List users with specific UID range (e.g. 1000-1010)
UID_range(){
    local file="$1"

    echo -e "\nList users with specific UID range."
    echo "Insert lower_limit UID:" 
    read lower
    echo "Insert upper_limit UID:"
    read upper

    if output=$(awk -F: -v lower="$lower" -v upper="$upper" '{if ($3 >= lower && $3 <= upper) {print $1}}' "$file"); then
        echo "$output" 
    else
        echo "\nListing users with specific UID range failed"
        exit 1   
    fi


}


# 6. Find users with standard shells like /bin/bash or /bin/sh
standard_shells(){
    local file="$1"

    echo -e "\nFind users with standard shells like /bin/bash or /bin/sh"
    if output=$(awk -F: '{if ($7 == "/bin/bash" || $7 == "/bin/sh") {print $1}}' "$file"); then
        echo "$output" 
    else
        echo "\nFinding users with standard shells like /bin/bash or /bin/sh failed"
        exit 1   
    fi


}


# 7. Replace the “/” character with “\” character in the entire /etc/passwd file and redirect the content to a new file
replace_char(){
    local file="$1"

    echo -e "\nReplace the “/” character with “\” character"

    if sed 's/\//\\/g' "$file" > /home/new_file; then
        echo -e"\n"
    cat new_file
    else
        echo "\nReplaceing the “/” character with “\” character failed"
        exit 1   
    fi

}


# 8. Print the private IP
private_IP(){

    echo -e "\nPrint the private IP"

    if private=$(hostname -I | awk '{print $1}'); then
        #hostname -I command gives the private IP and the output is given to awk to get the IP
        echo "$private"
    else
        echo -e "\nPrinting the private IP failed"
        exit 1
    fi
}

# 9. Print the public IP
public_IP(){
    echo -e "\nPrint the public IP"
    if public=$(curl -s ifconfig.me); then
        echo "$public"
    else
        echo -e "\nPrintint the public IP failed"
        exit 1
    fi
}


# 10. Switch to john user
#11. Print the home directory
switch_john_homedir(){
    echo -e "\nSwitch to john user and print the home directory"
    if su -c 'echo "Switched to user: $(whoami)" &&
           home=$(getent passwd $(whoami) | awk -F: "{print \$6}") &&
           echo "Home directory: $home"' john; then
    echo "Successful"
    #task 11 in the context of the command for task 10

else
    echo "Failed to switch user"
    exit 1
fi
}

verify_file "$1"
print_homedir "$1"
list_usernames "$1"
count_users "$1"
homedir_user "$1"
UID_range "$1"
standard_shells "$1"
replace_char "$1"
private_IP
public_IP
switch_john_homedir

