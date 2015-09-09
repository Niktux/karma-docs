Generate
========

Generate hydrated yaml files (do not manage intermediate dist files) 

Arguments
---------

=========== ====================================================================== ======== ================= =============
Argument    Role                                                                   Required                   Default Value
=========== ====================================================================== ========================== =============
sourcePath  generated yaml files directories                                       No (if defined in profile) *<none>*
=========== ====================================================================== ========================== =============

Options
-------

============ ======== ====================================================================== ==============
Option       Shortcut Role                                                                   Default Value
============ ======== ====================================================================== ==============
**env**      e        environment to extract values from configuration files                 dev
**system**   s        environment to use while hydrating system variables                    *<none>*
**override** o        override variable value (--override <variable>=<value>)                *<none>*
**data**     d        set metadata value (--data <variable>=<value>)                         *<none>*
**dry-run**           do not alter the filesystem (no write operations)                      *<none>*
**backup**            backup old generated files before overwritting them (suffix will be ~) *<none>*
**no-title**          do not display logo title (clean console output)                       *<none>*
============ ======== ====================================================================== ==============


Prototype
---------

.. code-block:: bash

    karma generate [--env="..."] [--system="..."] [--override <var>=<val>] [--data <var>=<val>] [--dry-run] [--backup] [--no-title] [sourcePath1] [sourcePath2] ...

Explanation
-----------

Not documented yet

Profile options
---------------

.. code-block:: yaml

    generator:
      translator: prefix


Not documented yet
