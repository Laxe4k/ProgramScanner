# ProgramScanner

## Script Explanation

This batch script generates an HTML file listing the programs installed on the computer. Here are the main steps:

1. **Initialization**: The script sets the encoding to UTF-8 and enables delayed variable expansion.
2. **Preparing the output file**: It sets the name of the HTML file (`programs.html`) and deletes it if it already exists.
3. **Creating the HTML header**: The script creates the header of the HTML file, including tags for the title, charset, and a script to make the table sortable.
4. **Retrieving programs**: Uses `WMIC` to get the list of installed programs and adds them to the HTML file with Google search links.
5. **Closing HTML tags**: Adds the closing tags and a CSS style for the HTML file.
6. **Finalization**: Displays a confirmation message indicating that the HTML file has been generated.

