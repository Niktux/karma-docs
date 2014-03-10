Changelog
=========

v 1.5.1
-------
Restore pimple 1.1 (missing merge in 1.5.0)

v 1.5.0
-------
* Add **--data** option to hydrate command
* Add shortcuts for command options

v 1.4.1
-------
Revert upgrade to pimple 2.0 (will be done later to avoid conflicts with Silex 1.x dependencies) 

v 1.4.0
-------
* Add **--override** option to hydrate command  
* Upgrade dependencies : pimple 1.1 -> 2.0  

v 1.3.x
-------
Add VCS command (GIT only up to now) :
    * Ignore generated files
    * Untrack generated files if needed (files that have been versioned before becoming a template)

v 1.2.0
-------
Add profile support :
    * Handles confDir, master and suffix custom values

v 1.1.0
-------
Change confDir default value (from **../conf/** to **env/**)

v 1.0.0
-------
Initial version