Changelog
=========

v 3.3.0
-------
* Add system variables
* Add --system option in hydrate command

v 3.2.1
-------
* FIX : Variables with dashes in name was not replaced while hydrating

v 3.2.0
-------
* Add **karma:list** directive to control list hydratation (see :ref:`karma:list` chapter)

v 3.1.1
-------
* Remove usage of bold characters in console outputs (because of symfony/console 2.5 issue)

v 3.1.0
-------
* Update logo in console outputs
* Add **no-title** to all commands : allow having clean outputs

v 3.0.0
-------
* Environments can now be gathered into groups
* Add string support in formatters
* Add dist file directive to use a different formatter
* Add formatter selection based on file extensions
* Enhance parsing error messages
* Empty list are now parsed as empty arrays (instead of array of empty string)
* Override data allows lists 

**BC breaks with 2.x :** 

* Empty list behaviour
* "karma:XXX" are now reserved keywords (cannot be used as variable names anymore)

v 2.2.0
-------
* Add sourcePath option in profile (for commands hydrate, rollback & vcs)
* Add default formatter for special values : true, false and null (see :ref:`formatters` chapter)
* Add :ref:`lists` support

v 2.1.0
-------
* Allow comments in configuration files

v 2.0.0
-------
* Remove standard options (confDir, master and suffix) : has been replaced by profile usage
* Enhance commands outputs

**BC breaks with 1.x :**

* Options removed in commands


v 1.5.2
-------
* Fix missing dependency in composer.json (symfony/yaml)
* Fix unit tests dependency on real profile file

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
