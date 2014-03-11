Includes
========

It is not mandatory to store all your configuration in a single file (``master.conf``). You can sort values by using different configuration files. 
In this case, you have to choose a master file which includes other files.

.. note::
    By convention, **master.conf** is the master file. Following this convention prevents you from specifying it in your karma profile

An included file **can** include other files. However it's recommended to list all included files in master file only.

Syntax is : 

.. code-block:: yaml

    [includes]
    file1.conf
    relative/path/to/file2.conf
    file3.conf
    
.. warning::
    All paths are relative to configuration root directory (by convention **env/**)
    