# Windows Setup Notes

*based on [original document](https://gist.github.com/alanstevens/8078733e669e1308c5994c4e59dc81ef) from Alan Stevens*

# Installation
### System Updates:
* Settings -> Update & Security
* Install all updates

## Setup and Configuration Scripts from Microsoft
* https://github.com/Microsoft/windows-dev-box-setup-scripts


### Powershell Execution Policy:  
* launch Windows Powershell as administrator and execute:
* `Set-ExecutionPolicy Unrestricted`
* Enter `A` to accept all changes


### Chocolatey:  
* To install [Chocolatey](https://chocolatey.org), follow the instructions [here](https://chocolatey.org/install).
* Restart your console (as administrator) to take advantage of the updated path.
* Set Chocolatey polices (prevents a prompt for each package) and install core tools:  

```
choco feature enable -n allowGlobalConfirmation  
choco feature enable -n allowEmptyChecksums

choco install googlechrome filezilla firefox
```

### Install Visual Studio First!
Yes this sounds silly but it'll make sure that anything you install with VS can be installed where you want it to with a re-install. Also extensions etc. can be installed with chocolatey afterwards.

### SQL Server 2017 Developer Edition:
* [Download](https://go.microsoft.com/fwlink/?linkid=853016) and install
* Just install database engine services
* Mixed mode. Add Administrators group and current user to server administrators.
* *must be installed before SQL Server Management Studio*

### Windows Bash:
* `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`


### Install IIS
* Run `OptionalFeatures.exe`
* Choose IIS and tick options
* **Or** use Install-IIS Powershell script  (Admin scripts)

### Git
* Install [git](https://git-scm.com/download/win) manually to select custom settings
* De-select "Windows Explorer Integration"
* Select "Use Git and optional Unix tools from the Windows Command Prompt"


### Install Chocolatey App and Dev Packages
* Use Admin folder scripts
* Install Chocolatey packages

### Manually Installs
* Visual FoxPro

### Manually install special Licensed Applications (licenses)
* Nitro Pro
* Corel Draw
* QuickBooks


### Powershell
* In an administrator prompt:
* Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
* Install-Module Get-ChildItemColor
* Install-Module PSReadLine

# Configuration

### Set Command Window Color Scheme
* [Ir_Black](https://gist.github.com/alanstevens/07d778f988c3183822eeac79086a0d1f#file-ir_black-reg)

### Configure ConEmu
* In settings -> features -> colors
* In the schemes field, type IR_Black
* Click save.
* Edit %appdata%\ConEmu.xml
* Search for IR_Black
* Replace ColorTable00 through ColorTable15 with the lines found below:
* [IR_Black color scheme](https://gist.github.com/alanstevens/07d778f988c3183822eeac79086a0d1f#file-conemu_ir_black-xml)
* Alternately, replace the entire contents of ConEmu.xml with this: [ConEmu.xml](https://gist.github.com/alanstevens/07d778f988c3183822eeac79086a0d1f#file-conemu-xml)


### Disable hibernation and remove hiberfil.sys  
* In an admin console: `powercfg -h off`
* Reboot

### set git config defaults:
* `git config --global user.name "Rick Strahl"`
* `git config --global user.email "rstrahl@west-wind.com"`

### Registy files:
* Get rid of the annoying Notification Center.  [DisableNotificationCenter.reg](https://gist.github.com/alanstevens/07d778f988c3183822eeac79086a0d1f#file-disablenotificationcenter-reg)
* Remove 3D Objects, Desktop, Documents, Downloads, Music, Pictures & Videos from File Explorer: [remove-all-folders-64-bit-reg](https://gist.github.com/alanstevens/07d778f988c3183822eeac79086a0d1f#file-remove-all-folders-64-bit-reg)
* restart


### Rename This PC
* In Explorer, on the left, right-click "This PC" and select properties.
* On the right, under Computer name, domain and workgroup settings, click Change settings
* On the bottom right, click change
* Enter your new computer name
* click ok and reboot


### Desktop
* small icons
* right click on the desktop -> view -> uncheck show desktop icons

### Start Menu
* right click on every modern app on the start menu and choose unpin from start
* resize start menu to minimum width

### Explorer:

* `Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions`


### Control Panel: 
* View By: Large Icons

### Reverse scroll wheel:
* *Not needed in Parallels*
* Settings -> Devices -> Mouse & touchpad, Reverse Scrolling Direction 
* If no touch pad do [this](https://www.addictivetips.com/windows-tips/reverse-scroll-direction-in-windows-10/)

### Install configuration files from DropBox:
  * copy .ssh folder from DropBox to `%userprofile%`
  * copy .gitconfig to `%userprofile%`

***
# Application Configuration

### SourceTree: 
* Tools -> Options: set the project folder to %userprofile%\Development
* Tools -> Options -> Authentication: Add your GitHub and Bitbucket accounts

***
### VSCode
* Use Settings Sync

***
### Notepad++
* Install the [xml tools plugin](https://sourceforge.net/projects/npp-plugins/files/XML%20Tools/) 
* settings -> Style Configurator:
  * Select Obsidian from the drop down
  * Select Hack Nerd Font Mono from the font list
  * Font Size: 12
  * Enable global font
  * Enable global font size
  * Enable global foreground color
  * enable global background color
***
## Visual Studio 2017

### Settings:
Tools -> Options: 
* Environment: 
  * Fonts & Settings: Font: Hack NF, Size: 14
  * Startup -> At Startup: Show Empty Environment
  * General -> Color Theme: Dark
  * General -> Apply title case styling to the menu bar (should be on by default)
* Projects and Solutions: 
  * Locations -> Projects Location: `%userprofile%\Development\`
  * track active item in solution explorer
* Debugging -> General -> uncheck: Enable Just My Code
* Source Control -> Plug-in selection: git
* Text Editor -> All Languages: 
  * General: 
    * uncheck: hide advanced members
    * check: line numbers
    * uncheck: navigation bar
  * Tabs:
    * Indenting: Smart
    * Tab Size: 4
    * Indent Size: 4
    * check: Insert Spaces
* Install ir_black color scheme
  * download: ir_black theme https://studiostyl.es/schemes/ir-black
  * Tools -> Import and Export Settings -> Import Selected Environment Settings -> Next -> No, just import new settings -> Next -> Browse to file -> open -> next -> finish
* Stop VS from opening the start page after a solution is closed:

  https://stackoverflow.com/questions/42701902/how-to-disable-start-page-after-solution-close-in-visual-studio-2017/44598030#44598030

### Extensions:
Tools -> Extensions and Updates: 
* [ILSpy](https://marketplace.visualstudio.com/items?itemName=SharpDevelopTeam.ILSpy)
* [Visual Studio Spell Checker](https://marketplace.visualstudio.com/items?itemName=EWoodruff.VisualStudioSpellCheckerVS2017andLater)
* [VsVim](https://marketplace.visualstudio.com/items?itemName=JaredParMSFT.VsVim)
  * tools -> options -> vsvim: 
     * defaults -> general 
      * VimRc Error Reporting: true
      * VimRc File Loading: vsvimrc files only
    * keyboard 
      * Handle all with Visual Studio
      * ctrl+d: Handled by VsVim
      * ctrl+u: Handled by VsVim
    * Copy [_vsvimrc](https://gist.github.com/alanstevens/07d778f988c3183822eeac79086a0d1f#file-_vsvimrc) to `%userprofile%`.
   
* [Productivity Power Tools](https://marketplace.visualstudio.com/items?itemName=VisualStudioProductTeam.ProductivityPowerPack2017)

  * tools -> options -> Productivity Power Tools: 
    * Custom Document Well 
      * *sometimes the general settings don't save if you move to the next screen. Hit ok after changing these settings and come back to options to finish.*
      * General -> Tab Appearance: uncheck Color tabs by project
      * General -> Sorting: uncheck all
      * Advanced -> Colors and Gradients: uncheck Automatically select tab text colors
      * Advanced -> Colors and Gradients: uncheck Force flat custom colors
    * Power Commands -> Commands
      * disable (uncheck) all 
      * enable Fix Mixed Tabs
      * enable Edit Project File
      * enable Open containing folder
      * enable Open command prompt
      * enable Reload Projects
      * enable Unload Projects
***
## Resharper 2017
* Log in to JetBrains.com to get a license key, or simply log in to your JetBrains account when Resharper prompts you for a license

### Settings:
Resharper -> Options:
  * Environment 
    * General
      * Application icons theme: gray
      * Source code symbols theme: gray
    * Keyboard & Menus
      * Keyboard Shortcuts: Resharper 2.x or IntelliJ IDEA
    * Editor 
        * Editor Appearance:
          * Highlight current line
          * Highlight matching delimiters when caret is: at both sides

  * Code inspection
    * Inspection severity
      * C#: *collect these as they are edited on the fly*
  * Code Editing -> C#:

    * Naming Style

        * Constant fields (private): ALL_UPPER
        * Constant fields (not private): ALL_UPPER
    * Formatting Style
    
        * Braces Layout -> Empty Braces Formatting: Together on the same line
        * Line Breaks and Wrapping -> Break line in a block with a single statement: Force put on single line
        * Blank Lines -> Keep max blank lines in code: 1
        * Blank Lines -> Keep max blank lines in declarations: 1
        * Line Breaks and Wrapping -> Prefer wrap before operator in binary expression: check for true
        * Line Breaks and Wrapping -> Place simple property/indexer/event declaration on a single line: check for true
        * Line Breaks and Wrapping -> Place simple method on single line: check for true
        * Line Breaks and Wrapping -> Place field attribute on same line: uncheck for false
        * Line Breaks and Wrapping -> Place simple array, object and collection on single line
        * Other -> Don't indent comments started at first column: uncheck for false

    * file layout :
      ```
      constructors
      fields
      static fields and constants
      properties
      public delegates
      all other members
      nested types
      public enums
      ```
  * Tools 
    * External Sources: Navigation to Object Browser
Import Live Templates
* Resharper -> Tools -> Templates Explorer... 
  * Import (second icon from the right in the toolbar)
    * [resharper_comment_template.dotsettings](https://gist.github.com/alanstevens/07d778f988c3183822eeac79086a0d1f#file-resharper_comment_template-dotsettings)
    * [resharper_todo_comment_template.dotsettings]( https://gist.github.com/alanstevens/07d778f988c3183822eeac79086a0d1f#file-resharper_todo_comment_template-dotsettings)