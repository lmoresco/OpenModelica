/*
 * RCS: $Id$
 */
 
Creating a new Translation File .ts
-----------------------------------

- Open OMEditGUI.pro and add a new language entry in TRANSLATIONS variable.
- The format for the language entry is <OMEdit_<language_code>.ts>. For correct <language_code> see http://www.loc.gov/standards/iso639-2/php/code_list.php.
- Generating translation file (Note :: You don't have to create that file, it will be generated automatically.)
    Linux   :: Run tsupdate.sh, it will generate all the translation files.
    Windows :: Open "Qt Command Prompt" or add "lupdate" in "PATH". Run tsupdate.bat, it will generate all the translation files.
- Open your generated file with Qt Linguist for writing translations (**RECOMMENDED**).
- If you want to edit file manually then make sure you only change the "<translation>" tags. Makesure to remove the attribute "type="unfinished"" once you are done.

Creating a .qm file
-----------------------------------
- Generating .qm files from .ts files.
    Linux   :: Run tsrelease.sh, it will generate all the .qm files.
    Windows :: Open "Qt Command Prompt" or add "lrelease" in "PATH". Run tsrelease.bat, it will generate all the .qm files.

------------------------------
Adeel.
adeel.asghar@liu.se