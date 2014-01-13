Hydrate
=======

Injects configuration values and generate target files (this is the main command).

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
**env**     environment to extract values from configuration files                 dev
**dry-run** do not alter the filesystem (no write operations)                      *<none>*
**backup**  backup old generated files before overwritting them (suffix will be ~) *<none>*
**cache**   cache the dist files list                                              *<none>*
suffix      template file suffix                                                   -dist
confDir     directory where conf files are stored                                  ../conf
master      first configuration file to parse                                      master.conf
=========== ====================================================================== ==============


Prototype
---------

.. code-block:: bash

    karma hydrate [--confDir="..."] [--master="..."] [--env="..."] [--suffix="..."] [--dry-run] [--backup] [--cache] sourcePath

Hydratation
-----------

TODO

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
    
            