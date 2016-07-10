#!/bin/bash
# 
# This script monitors the cpu temerature continuously by using the 
# sensors command to check the temperature every 5 seconds, and keeps 
# track of the approximate number of seconds it as been running.
#
# Enter q to exit.
#


# Counter
counter=0


# This is the number of seconds the script waits to check the cpu temp.
# Change this to change how often it checks the temprature.
#
# If the value of $pause is set to a value that is greater than 1, it will
# not change each second, because the seconds display only updates each 
# loop iteration. 
pause=1


# Main loop. If the value of the $key variable is lower case x the loop 
# exits.
while [ "$key" != "q" ] && [ "$key" != "Q" ]; do 

	clear
	echo
	sensors | grep "CPU Temperature"
	echo Runtime in seconds: $counter
	echo	
	echo Type q to Quit.     
	
	# Counter counts the seconds by incrementing each by the value of 
	# $pause each loop iteration.
	counter=$((counter+pause))


	# Waits 1 second to read text input into the $key variable. This is 
	# what gives the 5 second pause for the counter.
	read -t $pause -n 1 key
done
