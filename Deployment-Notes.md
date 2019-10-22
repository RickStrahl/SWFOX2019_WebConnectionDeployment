# Deployment Session Notes

### Create new Application
* Console
* Run app
* Enable Live Reload
* Make Change to Default, CSS, Script and Process class
* Build into EXE
* Test COM mode
* Run Build.bat

### Setting up IIS
* Run IIS Role Configuration Script (already done)
* Create new Web Site
* Make sure to set Host Name
* Turn on Windows Authentication
* Configure Application Pool: Set Identity to LocalSystem, Enable 32 bit

### Copy to Server
* Copy zip file using RDP File Copy (slow)
* Unzip in same structure as local drive
* Open Command Window in Deploy
* Modify publishing.ini `[ServerConfig] 
    * Change the Site Id to the new Site's ID
    * Remove `Virtual` for Root Site
* run `publishing CONFIG`
* Open web.config and disable LiveReload
* Test running server as File Mode EXE
* Test running Server as COM Server

### Add SSL Certificate
* Use WinAcme - run .\wacs

### Update Code on the server
* Make sure Web Deploy is installed



