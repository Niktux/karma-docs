Display
=======

Display all values for a given environment

Options
-------

============ ======== ====================================================================== ==============
Option       Shortcut Role                                                                   Default Value
============ ======== ====================================================================== ==============
**env**      e        environment values to display                                          dev           
**value**    f        filter, display only values that match this filter                     *<none>*      
**no-title**          do not display logo title (clean console output)                       *<none>*
============ ======== ====================================================================== ==============

Prototype
---------

.. code-block:: bash

    karma display [--env="..."] [--value="..."] [--no-title]

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
    
    karma display -e prod -f *stringEndingWithStar**
