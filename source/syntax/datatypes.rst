Datatypes
=========

Although configuration are text files, all values are not interpreted as strings. See below values that will be casted into their corresponding PHP type :

* true, false
* null 
* integers
* floats (. as separator)

.. warning::

   Rendering of these values could be not satisfying in some cases.
   See :ref:`formatters` chapter for dealing with this issue.

.. _lists:

Lists
-----

A variable can also be a list of values. List are surrounded by square brackets and values must be separated by commas.

Examples :

.. code-block:: yaml

    [variables]
    servers:
        dev = [value1, value2, value3]
        staging = [1, null, true, false, 2]
        prod = [singleValue]
        
.. note::
    List can **not** be nested
    
While hydrating, a line which refers to a list variable will be duplicated for each value of the list.

Exemple 1 :

.. code-block:: yaml

    # system.yml-dist
    servers:
        - <%servers%>

.. code-block:: yaml

    # system.yml
    servers:
        - value1
        - value2
        - value3
        
Exemple 2 :

.. code-block:: ini

    # system.ini-dist
    servers[] = <%servers%>

.. code-block:: ini

    # system.ini
    servers[] = value1
    servers[] = value2
    servers[] = value3
    

.. _karma:list:
    
Controlling list hydratation
----------------------------

While dealing with lists, if default hydratation policy doesn't fit your needs, you can override it with **karma:list** directive.

.. code-block:: php

    <?php // system.php-dist
    
    $serverList = array(<% karma:list var=servers delimiter=", " %>);

.. code-block:: ini

    # system.ini-dist
    serverList = <% karma:list var=servers delimiter="|" %>

This directive injects all the values inlined and separed by delimiter string (if provided).


.. note::

   The **delimiter** parameter is optional
   
Examples above will generate this files :

.. code-block:: php

    <?php // system.php
    
    $serverList = array(value1, value2, value3);

.. code-block:: ini

    # system.ini
    serverList = value1|value2|value3
    
It's also possible to define wrapping strings. These strings are inserted **only if the list contains at least one value**.
The wrapper expects 2 values : the prefix and the suffix. The syntax is ``wrapper="<prefix>":"<suffix>"``.

.. code-block:: yaml

    # system.yml-dist
    serverList: <% karma:list var=servers delimiter=", " wrapper="[":"]" %>

This example will generate this file :

.. code-block:: yaml

    # system.yml
    serverList: [value1, value2, value3]

If the list is empty, the generated file will be :

.. code-block:: yaml

    # system.yml
    serverList: 

If you need to generate wrapping strings even if the list is empty, you have to write it this way :

.. code-block:: yaml

    # system.yml-dist
    serverList: {<% karma:list var=servers delimiter=", " %>}

.. note::

   The **wrapper** parameter is optional.


.. warning::
   
   You must respect the parameter order : **var**, then **delimiter**, then **wrapper**.
   
   **var** is always mandatory. You can use **wrapper** without defining **delimiter**.

.. note::

   Of course, the **karma:list** directive supports formatters
