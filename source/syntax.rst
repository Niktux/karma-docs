Configuration file syntax
=========================

.. warning::
    Configuration files must have **.conf** extension

Variables
---------

The main section is **[Variables]**. It contains values for all the environments.

Syntax is : 

.. code-block:: yaml

    [variables]
    variableName1:
        environment = value
        environment, otherEnvironment, anotherEnvironment = otherValue
        default = fallbackValue

    variableName2:
        environment = value1
        anotherEnvironment = value2
        otherEnvironment = value3
        default = fallbackValue

For a same variable, you can : 

* set value for a given environment
* group all environments that share a same value
* define a default value for all missing environments (fallback strategy)

Datatypes
---------

Although configuration are text files, all values are not interpreted as strings. See below values that will be casted into their corresponding PHP type :

* true, false
* null 
* integers
* floats (. as separator)

Includes
--------

It is not mandatory to store all your configuration in a single file (master.conf). You can sort values by using different configuration files. 
In this case, you have to choose a master file which includes other files.

.. note::
    By convention, **master.conf** is the master file. Following this convention prevents you from specifying it in each karma command

An included file **can** include other files. However it's recommended to list all included files in master file only.

Syntax is : 

.. code-block:: yaml

    [includes]
    file1.conf
    relative/path/to/file2.conf
    file3.conf
    
.. warning::
    All paths are relative to configuration root directory (by convention **conf/**)
    
Externals
---------

Concept
*******

Externals are kind of optional included files. This support allows you to version sensitive data without providing them to everyone.
Environment teams that don't need to know this data can still work with karma (without having the external file).

.. note::
    An external file is only needed when values for the secured environment are used 

Use case
********

Consider this example : 

.. code-block:: yaml

    #master.conf
    [externals]
    secured.conf
    
    [variables]
    db.pass:
        staging = pass1
        dev = pass2
        prod = <external>

.. code-block:: yaml

    #secured.conf
    [variables]
    db.pass:
        prod = secretPass

The sensitive data is the production database password. Instead of storing it in master.conf, it's stored in another file (secured.conf).
You can run karma in development or staging environment without having this second file : it will **not** lead to an error. On the other hand,
if you want to run it in production environment, you will have to provide this file. 

.. note::
    Your hosting team should be the only team to have access to **secured.conf** file. They are responsible to version and maintain this file

Syntax rules
************

* The **[externals]** section lists the files which contain the sensitive data
* An external file can only contain *variables* section (neither *includes* section nor *externals* one is allowed)
* Sensitive values need to be explicitly declared as **<external>** : this tag tells karma to find correct value in external file instead of applying fallback strategy 


Full example
------------

.. code-block:: yaml

    # master.conf
    [includes]
    db.conf
    subdir/other.conf
    
    [variables]
    var1:
        dev = value1
        staging, integration = value2
        prod = value3
        default = value4
    
    var2:
        integration, prod = valA
        default = valB

.. code-block:: yaml
        
    #subdir/other.conf
    [variables]
    var3:
        prod = false
        default = true

.. code-block:: yaml
        
    # db.conf
    [externals]
    secured.conf
    
    [variables]
    db.user:
        prod = <external>
        default = root
    
    db.password:
        prod = <external>
        default = 

.. code-block:: yaml
        
    #secured.conf
    [variables]
    db.user:
        prod = sqluser
    
    db.password:
        prod = ThisIsASecretData