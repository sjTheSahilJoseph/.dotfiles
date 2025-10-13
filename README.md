


# .dotfiles - SJ the Sahil Joseph
These are my *personal* __.dotfiles__.

## Softwares and Settings:

### Operating System
- Microsoft Windows 11 Pro x64
  - Taskbar should be empty (no pinned items).
  - Start should have some pinned items.
  - Desktop should be empty.
    
### Terminal
- Windows Terminal
  - Settings -> terminal_settings.json.

// call that function powershell:
``` powershell
function prompt {
  $loc = $executionContext.SessionState.Path.CurrentLocation;

$out = ""
  if ($loc.Provider.Name -eq "FileSystem") {
    $out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
  }
  $out += "PS $loc$('>' * ($nestedPromptLevel + 1)) ";
  return $out
}```
  
### Text Editor
- Emacs 30.
  - Config files in .dotfiles/emacs.
    
### IDEs and Development Stuff.
// I don't write code using IDEs, I write code using Emacs.
// Keep open IDEs side by side. But write code in Emacs.
- Microsoft Visual Studio Community (C/C++/C#).
  - Just Sign In & use Liberation Mono 16, Default Dark Theme, rest default.
- Microsoft Visual Studio Code (JavaScript/TypeScript/Python/etc...).
  - Just Sign In & use Liberation Mono 16, Default Dark Theme, rest default.
- Unity Engine.
  - Defaults.
- Unreal Engine.
  - Defaults.

### Browser
- Google Chrome.
  - Sign In account, and sync.
  - Vimium Extension.

### Cloud Backup
- DropBox for everything.
  - Personal, Professional, each and everything.
  - Store photos, videos in folder structure.

### Contacts
- Google Contacts

### Media
- VLC Media Player.
- Adobe Photoshop.
- Adobe Illustrator.
- Adobe Lightroom.
- Adobe Premiere Pro.
- Adobe After Effects.
- Adobe Audition.
- SJ Draw.
- Blender.
- FL Studio.
- OBS Studio.

### Office Management
- Microsoft Office (Word, Excel, PowerPoint, Teams, etc...).
- (with sjthesahiljoseph@gmail.com).

### Personal Notes
- Google Keep Notes.

### Communication & Social
- Gmail.
- Microsoft Teams.
- WhatsApp
- Discord
- Instagram
- Facebook
- Massenger
- Zoom
- Slack
- YouTube
- LinkedIn
- GitHub
- Stack Overflow
- Reddit

### Personal
- Wallpaper & Coding fonts (/assets)
- Dark Theme.

### Mobile
- Dark Mode.
- Mobile ringtone sound 100%, notification sound silent, alarm tone same as ringtone.
- Mobile ringtone in /assets.
- Use mobile phone only for main things and as less as possible. (use computer more).

### Hardware
- Laptop ().
- LCD ().
- Keyboard ().
- Mouse ().
- Earphones ().
- Mic ().
- Camera ().
- Table ().
- Chair ().
- Mobile ().
- Laptop Bag ().
- Lights ().
- Speakers ().

## Habits
- Always Maximized Screen.
- Alt + Tab to switch programs.
- Mouse as less as possible.
- FaceCam on bottom right/left (300 px x 300 px).
-
-
- 


