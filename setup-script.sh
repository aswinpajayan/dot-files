#!/bin/bash

# Setting up userChrome.css
target_folder=`grep Default ~/.mozilla/firefox/profiles.ini | cut -d'=' -f2 | grep release`
if [ ! -e ~/.mozilla/firefox/$target_folder/chrome ]; then
	mkdir -p userChrome.css ~/.mozilla/firefox/$target_folder/chrome
fi
if [ -e ~/.mozilla/firefox/$target_folder/chrome/userChrome.css ]; then
	printf "\033[0;31m \t\tOverwriting userChrome css file\033[0m \n"
	rm ~/.mozilla/firefox/$target_folder/chrome/userChrome.css
fi
ln userChrome.css ~/.mozilla/firefox/$target_folder/chrome/userChrome.css

chmod  +rx ~/.mozilla/firefox/$target_folder/chrome/userChrome.css
printf "set  \033[1;33m \033[1;3mtoolkit.legacyUserProfileCustomizations.stylesheets \033[0mto true in firefox about config\033[0m \n"
echo "required for firefox versions > Firefox69"
