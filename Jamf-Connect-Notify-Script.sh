#!/bin/bash
#variables
NOTIFY_LOG="/var/tmp/depnotify.log"
echo "STARTING RUN" >> $NOTIFY_LOG
# Define the number of increments for the progress bar
echo "Command: Determinate: 6" >> $NOTIFY_LOG
 #1 - Introduction window with username and animation
echo "Command: Image: /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/com.apple.macbookpro-15-retina-touchid-silver.icns" >> $NOTIFY_LOG
echo "Command: MainTitle: Welcome" >> $NOTIFY_LOG
echo "Command: MainText: Your Mac is now managed and will be automatically configured for you." >> $NOTIFY_LOG
echo "Status: Preparing your new Mac..." >> $NOTIFY_LOG
sleep 10
 #2 - Setting up single sign-on passwords for local account
echo "Command: Image: /Applications/Utilities/Keychain Access.app/Contents/Resources/AppIcon.icns" >> $NOTIFY_LOG
echo "Command: MainTitle: Tired of remembering multiple passwords?" >> $NOTIFY_LOG
echo "Command: MainText: We use single sign-on services to help you log in to each of our corporate services.
You can use your email address and account password to sign into all necessary applications." >> $NOTIFY_LOG
echo "Status: Setting the account password for your Mac to sync with your network password..." >> $NOTIFY_LOG
sleep 10
 #3 - Self Service makes the Mac life easier
echo "Command: Image: /Applications/Self Service.app/Contents/Resources/AppIcon.icns" >> $NOTIFY_LOG
echo "Command: MainTitle: Self Service makes the Mac life easier" >> $NOTIFY_LOG
echo "Command: MainText: Self Service includes helpful bookmarks and installers for other applications that may interest you." >> $NOTIFY_LOG
echo "Status: Installing Jamf Self Service..." >> $NOTIFY_LOG
sleep 10
 #4 - Everything you need for your first day
###Jamf Triggers
echo "Command: Image: /System/Library/CoreServices/Install in Progress.app/Contents/Resources/Installer.icns" >> $NOTIFY_LOG
echo "Command: MainTitle: Installing everything you need for your first day." >> $NOTIFY_LOG
echo "Command: MainText: All the apps you'll need today are already being installed. Once we're ready to start, you'll find Microsoft Office, Slack, and Zoom are all ready to go." >> $NOTIFY_LOG
echo "Status: Installing Microsoft Office..." >> $NOTIFY_LOG
/usr/local/bin/jamf policy -event "InstallOffice"
sleep 5
 #5 - Finishing up
echo "Command: Image: /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/ApplicationsFolderIcon.icns" >> $NOTIFY_LOG
echo "Status: Installing Slack..." >> $NOTIFY_LOG
/usr/local/bin/jamf policy -event "InstallSlack"
sleep 5 echo "Status: Finishing up... \n We're almost ready for you." >> $NOTIFY_LOG
sleep 5 ###Clean Up
sleep 3 echo "Command: Quit" >> $NOTIFY_LOG
sleep 1 rm -rf $NOTIFY_LOG
