#!/bin/bash

# dd if=/dev/zero of=large_file bs=1M count=50

# mv lage_file /home/john

# Write a bash script that reads the passwd file, checks if the file name is “passwd”

# Verify if file exists
if [ -f "$1" ]; then #$1 first arg given to the script
    echo -e "\nFile $1 exists."
else
    echo -e "\nFile $1 doesn't exist."
fi

if [ "$(basename $1)" != "passwd" ]; then
    echo -e "\nFile name is not passwd" #Error
    exit 1
else
    echo -e "\nFile name is passwd"
fi


# 1. Print the home directory
echo -e "\nPrint the home directory"
awk -F: '{print $6}' $1 #print the 6th field of every line in file
                        #fields separated by :


# 2. List all usernames from the passwd file
echo -e "\nList all usernames from the passwd file"
awk -F: '{print $1}' $1

# 3. Count the number of users
echo -e "\nCount the number of users"
awk -F: '{print $1}' $1 | wc -l #the output of awk is the input for wc counting the lines


# 4. Find the home directory of a specific user (prompt to enter the username value)
echo -e "\nFind the home directory of a specific user. \nInsert user:"
read username
awk -F: -v user="$username" '{
    if ($1 == user) {print $6}
}' $1


# 5. List users with specific UID range (e.g. 1000-1010)
echo -e "\nList users with specific UID range."
echo "Insert lower_limit UID:" 
read lower
echo "Insert upper_limit UID:"
read upper
awk -F: -v lower="$lower" -v upper="$upper" '{
    if ($3 >= lower && $3 <= upper) {print $1}
}' $1


# 6. Find users with standard shells like /bin/bash or /bin/sh
echo -e "\nFind users with standard shells like /bin/bash or /bin/sh"
awk -F: '{
    if ($7 == "/bin/bash" || $7 == "/bin/sh") {print $1}
}' $1


# 7. Replace the “/” character with “\” character in the entire /etc/passwd file and redirect the content to a new file
echo -e "\nReplace the “/” character with “\” character"
sed 's/\//\\/g' $1 > /home/new_file

echo -e"\n"
cat new_file


# 8. Print the private IP
echo -e "\nPrint the private IP"
private=$(hostname -I | awk '{print $1}')
#hostname -I command gives the private IP and the output is given to awk to get the IP
echo "$private"

# 9. Print the public IP
echo -e "\nPrint the public IP"
public=$(curl -s ifconfig.me)
echo "$public"

# 10. Switch to john user
if su -c 'echo "Switched to user: $(whoami)" &&
           echo -e "\nPrint the home directory" &&
           home=$(getent passwd $(whoami) | awk -F: "{print \$6}") &&
           echo "$home"' john; then
    echo "Switched to user: john"
    #task 11 in the context of the command for task 10

else
    echo "Failed to switch user"
fi


