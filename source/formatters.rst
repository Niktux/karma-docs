.. _formatters:

Formatters
==========

Definition
----------

Rendering some special values like true/false, null can lead to errors depending on your target file format.
To deal with, you can define in your profile a rendering strategy called **formatter**.

To do so, you have first to choose your default formatter. Then you have to define it. All definitions are done in **profile**.
A formatter is defined by a set of rules. When a value matches the left part, it will be replaced by the right part of the rule.

.. code-block:: yaml

    # .karma
    defaultFormatter: myFormatter
    formatters:
      myFormatter:
        <true>: "true"
        <false>: "false"
        <null>: 0
        <string> : "<string>"
        foo: bar

.. note:: 
    Profile is written in **yaml**. Therefore **"true"** is parsed as string and **true** is parsed as boolean.

.. warning:: 
    As profile is written in **yaml**, be careful about quotes ! If you want a string to be surrounded by quotes, you have to write :
    
.. code-block:: yaml  
  
    foo: '"bar"'

Special values
--------------

Special values supported by formatters are : 

- **<true>** which stands for corresponding boolean
- **<false>** which stands for corresponding boolean
- **<null>** which stands for null value
- **<string>** for strings that do not match any other rules (<string> can be used in right part as placeholder for value being formatted)

.. note::
    None special values are mandatory : you can define partial formatters. Missing special values will not be translated while hydrating.
    
Selecting which formatter to apply
----------------------------------
You can define as many formatters as you want. By default, the default formatter is the only one used by karma. But you can specify in a dist file
an alternative formatter to use with the ``karma:formatter`` directive.

Full example
^^^^^^^^^^^^

Some dist files :

.. code-block:: php

    <?php // file.php-dist
    
    <% karma:formatter = php %>
    
    define(CONSTANT, <%const%>);

.. code-block:: ini

    # file.ini-dist

    <% karma:formatter = config %>
    
    [section]
    var = <%var%>
    
.. code-block:: yaml

    # file.yml-dist

    foo:
      bar = <%foo.bar%>


Example of corresponding profile :

.. code-block:: yaml

    # .karma
    defaultFormatter: yaml
    formatters:
      config:
        <false>: 0
      yaml:
        <true>: "true"
        <false>: "false"
        <null>: "null"
      php:
        <true>: "true"
        <false>: "false"
        <null>: "null"
        <string> : "'<string>'"

Selecting formatters based on file extension
--------------------------------------------

You can also define a file extension based strategy to select formatters.

For example : 

.. code-block:: yaml

    # .karma
    defaultFormatter: f3
    formatters:
      f1:
        <false>: 0
      f2:
        <true>: "true"
        <false>: "false"
      f3:
        <null>: "null"
    fileExtensionFormatters:
      ini: f1
      cfg: f1
      yml: f2
 
In order to select a formatter, Karma will check these points in order :

1. Does the file have a **karma::formatter** directive ?
2. Does the target file extension have an associated formatted
3. Is there a default formatter ?
4. Do not use any formatter !

Formatter selection resolution examples :
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: ini

    # file.ini-dist
    
    <% karma:formatter = f2 %>
    
    [section]
    var=<%var%>

will use formatter **f2** : directive found

.. code-block:: ini

    # file.ini-dist
    
    [section]
    var=<%var%>

will use formatter **f1** : no directive but a fileExtension rule has matched (ini)


.. code-block:: ini

    # file.txt-dist

    Foo = <%var%>

will use formatter **f3** : neither directive nor fileExtension rule so we use the default formatter