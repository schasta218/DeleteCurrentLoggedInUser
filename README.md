# DeleteCurrentLoggedInUser
Having problems binding your computer through DEP? Use this script to log the user out and delete the user after binding. This allows the user to log in again. 

This script should be a part of a workflow deployed using a Jamf | Pro server. The computer should be scoped to a DEP prestage that, idealy, authenticates against LDAP (alhtough this is not required). This is an example of what the policy you deploy should look like:

## POLICY
 * WHAT (payloads)
   * Computer Renaming Script (with a BEFORE priority)
     * For more information, visit https://www.schasta.com/tech/methods-for-naming-macos-computers/#scripting-solution
   * Directory Bindings
   * DeleteCurrentLoggedInUser.sh (with an AFTER priority)
 * WHEN (trigger)
   * Enrollment
 * HOW OFTEN (frequency)
   * Once per computer
 * WHOM (Scope)
   * To a smart group with a criteria that isolates computers enrolled via a particular prestage
   
This is a simple script. All it does is grabs the username of the logged in user (Credit to Ben Toms: https://macmule.com/2014/11/19/how-to-get-the-currently-logged-in-user-in-a-more-apple-approved-way/), logs the user out, and deletes the user and their home folder. The idea is that they would then login using their LDAP credentials, and the computer doesn't need to be bound **during** the DEP process, which presents a number of challenges. 
