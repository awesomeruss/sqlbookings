# Usage
Read the docs for info on how to use and how to develop

# Install
Run all the sql scripts in the install folder, in sequence to install a fresh system. 
Run the latest test script in the test folder to verify the installation

# Develop
To create a new upgrade script:
- Copy the "sqlBookings upgrade template.sql" file.
- Determine the next version number, and rename your file to match it
- Change line 5 and line 14 to reference the new version number. Update the text value on line 14 with a brief description of the upgrade
- Add your upgrade statements where shown
- Run on a test system, then run the latest test script to check for correct operation. If necessary, update the test script and save with your version number.
- Commit to the development branch and create a new pull request