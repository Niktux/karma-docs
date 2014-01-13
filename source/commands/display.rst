Display
=======

Display all values for a given environment

Options
-------

=========== ====================================================================== ==============
Option      Role                                                                   Default Value
=========== ====================================================================== ==============
**env**     environment values to display                                          dev           
**value**   filter, display only values that match this filter                     *<none>*      
confDir     directory where conf files are stored                                  ../conf
master      first configuration file to parse                                      master.conf
=========== ====================================================================== ==============

Prototype
---------

.. code-block:: bash

    karma display [--confDir="..."] [--master="..."] [--env="..."] [--value="..."]

Filtering values
----------------
**value** option supports wildcard character \*

Wilcard can be escaped like this \*\*

Note that escaped wildcard is interpreted before wildcard. Ambigous expressions like \*\*\* is understood as **star** then **wildcard**

Some examples : 

.. code-block:: bash

    karma display --env=dev
    karma display --env=prod
    karma display --env=prod --value=false
    karma display --env=prod --value=*2
    karma display --env=prod --value=*www*
    karma display --env=prod --value=*stringEndingWithStar**

Examples
--------

TODO