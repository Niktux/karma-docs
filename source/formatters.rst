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

    <% karma:formatter = ini %>
    
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
      ini:
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