Groups
======

Concept
-------

If you have similar environments, groups can be useful. You can gather these environments in the same groups and then assign all the
common configuration values to this group instead of each environments.

This way you don't duplicate values : you only have to specify values that differ from common ones.

Syntax is : 

.. code-block:: yaml

    [groups]
    staging = [ staging1, staging2, staging3 ]
    dev = [ dev_debug, dev_without_debug ]
    
    [variables]
    cache.enable:
        # common value for each dev environments
        dev = false
            
    debug:
        # specific values
        dev_debug = true
        dev_without_debug = false
    
.. note::
    When hydrating, values used by an environment follow this algorithm :
    
    - value of the **environment**
    - value of the **group** which environment belongs to
    - **default** value
        
    In our example, if you hydrate for environment **dev_debug**, karma will look for :
    
    - dev_debug
    - then dev
    - then default
    
.. warning::
    An environment can belong to **only one** group

.. warning::
    A group can **not** belong to another group

Default environment
-------------------

Since 4.0.0, it is possible to define a default environment for a group. This environment will be use if the group is used as environment parameter in hydrate command.
Default environment are prefixed by a **star**.

Syntax is : 

.. code-block:: yaml

    [groups]
    staging = [ staging1, *default_staging, staging3 ]
    dev = [ * dev_debug, dev_without_debug ]
    
In the example below, hydrating with **dev** is equivalent to hydrating with **dev_debug**. Hydrating with **staging** is equivalent to hydrating with **default_staging**. 