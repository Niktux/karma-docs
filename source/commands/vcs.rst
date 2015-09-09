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
sourcePath  application sources directories                                        No (if defined in profile) *<none>*
=========== ====================================================================== ========================== =============

Options
-------

============ ====================================================================== ==============
Option       Role                                                                   Default Value
============ ====================================================================== ==============
**cache**    cache the dist files list                                              *<none>*
**no-title** do not display logo title (clean console output)                       *<none>*
============ ====================================================================== ==============

Prototype
---------

.. code-block:: bash

    karma vcs [--cache] [--no-title] [sourcePath1] [sourcePath2] ...

Examples
--------

.. code-block:: bash

    karma vcs -vvv config/
