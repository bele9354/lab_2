#!/bin/bash
# Authors : Ben Lee
# Date: 2/1/2019

#Problem 1 Code:
echo "Problem 1: Count the number of phone numbers in regex_practice.txt"
echo "Enter file name containing the phone numbers: "
read fileName
symbOne="\(?\d{3}\)?[-.s\]?\d{3}[-.\s]?\d{4}?"

#\(?\d{3}\)? says that there may or may not be parentheses around 3 digits.
#[-.s\]? says that there may or may not be a dash, dot, or space following the first 3 digits.
#\d{3} says that there will be 3 digits.
#[-.\s]? says that there again may or may not be a dash, dot, or space following the second set of 3 digits.
#\d{4}? says that there may or may not be 4 digits ending the phone number.

grep -E -c $symbOne $fileName #listing the cout of the number of phone numbers


#Problem 2 Code:
echo "Problem 2: Count the number of emails in regex_practice.txt"
echo "Enter file name containing the emails: "
read fileName
symbTwo="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b"
#I found the symbTwo String online but what I understand is that [A-Za-z0-9._%+-] says that the first element in an email will be a string containing capital or lowercase letter, or special symbols.  +@[A-Za-z0-9.-] means that the first string will; be followed by an @ symbol and another string. +\.[A-Za-z]{2,6} means that . will follow, and end with a string between 2 and 6 characters long. This represents the .com or .net portion of the email.
grep -E -o -c $symbTwo $fileName #listing the number of emails that follow the pattern exactly.

#Problem 3 Code:
echo "Problem 3: List all of the phone numbers in the 303 area code and store the results in phone_results.txt"
echo "Enter file name containing the phone numbers beginning with 303: "
symbThree="303-"
read fileName
result=$(grep -E $symbThree $fileName)
#I'm not entirely sure why I need to set result here, but without it, the last line will not print the results to the file.
grep -E $symbThree $fileName
grep -E $symbThree $fileName > "phone_results.txt" #writing the results to the file.

#Problem 4 Code:
echo "Problem 4: List all of the emails from geocities.com and store the results in email_results.txt"
echo "Enter file name containing the emails from geocities.com "
symbFour="@geocities.com"
read fileName
result=$(grep -E $symbFour $fileName)
#I'm not entirely sure why I need to set result here, but without it, the last line will not print the results to the file.

grep -E $symbFour $fileName
grep -E $symbFour $fileName > "email_results.txt" #writing the results to the file.

#Problem 5 Code:
echo "Problem 5: List all of the lines that match a command-line regular expresion and store the results in command_results.txt"
echo "Enter what you want to search: "
read arg1
echo "Enter the name of the file you want to search: "
read arg2
#I am taking 2 arguments from the user. What they want to find (arg1) and the file they want to search (arg2).

result=$(grep $arg1 $arg2)
#I'm not entirely sure why I need to set result here, but without it, the last line will not print the results to the file.
grep -E $arg1 $arg2
grep -E $arg1 $arg2 > "command_results.txt" #writing the results to the file.
