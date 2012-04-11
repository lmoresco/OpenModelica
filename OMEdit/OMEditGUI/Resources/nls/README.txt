/*
 * RCS: $Id$
 */
 
Creating a new Translation File
-----------------------------------

- Open file tsupdate.sh and add the name of your language file at the end e.g OMEdit_ro.ts (Note :: You don't have to create that file, it will be generated automatically.)
- Run tsupdate.sh and it will generate your translations file. Windows users need to add lupdate.exe in their PATH.
- Open your generated file with Qt Linguist for writing translations.
- If you want to edit file manually then make sure you only change the "<translation>" tags. Makesure to remove the attribute "type="unfinished"" once you are done.

------------------------------
Adeel.
adeel.asghar@liu.se