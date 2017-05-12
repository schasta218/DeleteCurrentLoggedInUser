#!/bin/bash
# Convert DEP Enrolled User to LDAP User
# This script will log the user out upon enrollment and delete their user account. It should only be deployed to computers enrolled via a particular prestage, and should put some further error checking in to make sure it doesn't run after the process has run.

# Get the logged in user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`


# Log the user out
osascript -e 'tell application "loginwindow" to  «event aevtrlgo»'

# Delete the user account
sudo /usr/bin/dscl . -delete "/Users/${loggedInUser}"

# Delete the home folder
rm -rf ~/Users/${loggedInUser}