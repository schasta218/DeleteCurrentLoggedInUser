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
 * WHOME (Scope)
  * To a smart group with a criteria that isolates computers enrolled via a particular prestage
