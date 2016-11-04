Changelog
=========

v 5.5.0
-------
* Add targetPath config to output files in an external dir

v 5.4.0
-------
* Add **wrapper** parameter in **karma:list** directive

v 5.3.2
-------
* FIX : Custom data was not replaced in lists

v 5.3.1
-------
* FIX : stacktrace if a directory with at least one file has karma suffix in its name

v 5.3.0
-------
* Command now accepts multiple source paths

v 5.2.1
-------
* FIX : break dependency to git executable

v 5.2.0
-------
* __TODO__ introduced in 5.1.0 is replaced by __FIXME__ (missing value blocks the hydration)
* __TODO__ now only warns while hydrating

v 5.1.1
-------
* FIX version number ;-)

v 5.1.0
-------
* Add __TODO__ support

v 5.0.0
-------
* FIX : semi colon are allowed in values
* Add generate command (not documented yet) : do not manage your dist file anymore

**BC breaks with 4.x :**

* = is not allowed anymore in variable name

v 4.0.4
-------
* FIX : Unused variables display issue

v 4.0.3
-------
* FIX : Zero numerical values were dropped in list parsing

v 4.0.2
-------
* Add warning for unused variables in hydrate command

v 4.0.1
-------
* FIX : Spaces in variable names does not trigger error in conf files

v 4.0.0
-------
* Define default environment for group 
* Allow hydrating with group (using default environment)

**BC breaks with 3.x :**

* stars are not allowed anymore in groups name

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
