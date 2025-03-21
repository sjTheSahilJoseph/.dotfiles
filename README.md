
# .dotfiles - SJ the Sahil Joseph
These are my *personal* __.dotfiles__.

# Setup

## Operating System
   1. Download Windows 11 Pro x64 ISO.
   2. Create bootable USB Pendrive.
   3. Install Windows 11 Pro x64.
   4. Activate.
   5. Name Computer "sjjoseph".
   6. Update Windows and Apps.

## Browser
   1. Download "Google Chrome" from Microsoft Edge.
   2. Make default browser.

## Git
   1. Install "Git" from Google Chrome.
   2. Setup Git (username, email, ssh).

## Clone .dotfiles
   1. git clone .dotfiles (this repository).

## Fonts Install
   1. Extract fonts from "assets" folder.
   2. Install the fonts.

## Wallpaper
   1. Go to "assets" folder, select wallpaper from there.
   2. Same wallpaper for lock screen and desktop.

## Emacs
   1. Download Emacs 30.1+ from Official Site.
   2. Link .dotfiles/emacs.
   3. New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Roaming\.emacs.d" -Target "C:\Users\sjthe\.dotfiles\emacs".

## Emacs Theme
   1. git clone git@github.com:sjTheSahilJoseph/loveisanillusion.emacs.git.
   2. New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Roaming\.emacs.d" -Target "C:\Users\sjthe\.dotfiles\emacs". (administrator terminal).

## Visual Studio Code
   1. Download Visual Studio Code from Official Website.
   2. Sign In using Github.
   3. Automatically sync settings, and extensions.


## Visual Studio IDE
   1. Download Visual Studio IDE from Official Website.
   2. Sign In using Github.
   3. Link .dotfiles/VSSETTINGS23022025.vssettings.
   4. 
   
