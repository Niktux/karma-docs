Changelog
=========

v 1.4.1
-------
    * Revert upgrade to pimple 2.0 (will be done in 2.0.0) 

v 1.4.0
-------
    * add --override option to hydrate command
    * upgrade dependencies : pimple 1.1 -> 2.0 

v 1.3.x
-------
Add VCS command (GIT only up to now) :
    * ignore generated files
    * untrack generated files if needed (files that have been versioned before becoming a template)

v 1.2.0
-------
Add profile support :
    * handles confDir, master and suffix custom values

v 1.1.0
-------
Change confDir default value (from **../conf/** to **env/**)

v 1.0.0
-------
Initial version