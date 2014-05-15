VCS
===

Handles vcs operations : ignoring generated files and untracking them if needed.

The only vcs supported up to now is Git.
The command may edit your root .gitignore file.

Arguments
---------

=========== ====================================================================== ======== ================= =============
Argument    Role                                                                   Required                   Default Value
=========== ====================================================================== ========================== =============
sourcePath  application sources directory                                          No (if defined in profile) *<none>*
=========== ====================================================================== ========================== =============

Options
-------

=========== ====================================================================== ==============
Option      Role                                                                   Default Value
=========== ====================================================================== ==============
**cache**   cache the dist files list                                              *<none>*
=========== ====================================================================== ==============

Prototype
---------

.. code-block:: bash

    karma vcs [--cache] [sourcePath]

Examples
--------

.. code-block:: bash

    karma vcs -vvv config/
