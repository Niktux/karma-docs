VCS
===

Handles vcs operations : ignoring generated files and untracking them if needed.

The only vcs supported up to now is Git.
The command may edit your root .gitignore file.

Arguments
---------

=========== ====================================================================== ======== =============
Argument    Role                                                                   Required Default Value
=========== ====================================================================== ======== =============
sourcePath  application sources directory                                          Yes      *<none>*
=========== ====================================================================== ======== =============

Options
-------

=========== ====================================================================== ==============
Option      Role                                                                   Default Value
=========== ====================================================================== ==============
**cache**   cache the dist files list                                              *<none>*
suffix      template file suffix                                                   -dist
confDir     directory where conf files are stored                                  env/
master      first configuration file to parse                                      master.conf
=========== ====================================================================== ==============

Prototype
---------

.. code-block:: bash

    karma vcs [--confDir="..."] [--master="..."] [--suffix="..."] sourcePath

Examples
--------

.. code-block:: bash

    karma vcs -vvv config/
