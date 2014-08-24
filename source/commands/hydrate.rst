Hydrate
=======

Injects configuration values and generate target files (this is the main command).

Arguments
---------

=========== ====================================================================== ======== ================= =============
Argument    Role                                                                   Required                   Default Value
=========== ====================================================================== ========================== =============
sourcePath  application sources directory                                          No (if defined in profile) *<none>*
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
**cache**             cache the dist files list                                              *<none>*
**no-title**          do not display logo title (clean console output)                       *<none>*
============ ======== ====================================================================== ==============


Prototype
---------

.. code-block:: bash

    karma hydrate [--env="..."] [--system="..."] [--override <var>=<val>] [--data <var>=<val>] [--dry-run] [--backup] [--cache] [--no-title] [sourcePath]


Understanding backup option
---------------------------

File system before any action :

.. code-block:: text

    ├── src
    │   └── myfile-dist
    

Hydrate a first time

.. code-block:: bash

    karma hydrate src/

.. code-block:: text

    ├── src
    │   └── myfile-dist
    │   └── myfile
    

Then, hydrate a second time :

* **myfile** will be generated again
* no other file will be created

.. code-block:: bash

    karma hydrate src/

.. code-block:: text

    ├── src
    │   └── myfile-dist
    │   └── myfile
    

And finally, hydrate a third time but with **backup** option :

* myfile will be backuped (myfile~) before being overwritten

.. code-block:: bash

    karma hydrate --backup src/

.. code-block:: text

    ├── src
    │   └── myfile-dist
    │   └── myfile
    │   └── myfile~
    
            
Overriding variables
--------------------
You can override configuration values directly from commandline.

Example :
 
.. code-block:: bash

    karma hydrate -e integration --override db.user=integ_user --override db.pass=123456 src/


Custom data replacement
-----------------------

If your **master.conf** file contains variables ``${var}``, you can value them with **--data** option :

.. code-block:: bash

    karma hydrate -e dev --data user=jdoe config/

Debugging
---------

While debugging your application, you could need to run staging or production configuration onto dev platform.
If you have correctly defined your system variables, you can do it like this :

.. code-block:: bash

    karma hydrate -e staging -s dev
