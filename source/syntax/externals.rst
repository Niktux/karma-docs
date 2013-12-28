Externals
=========

Concept
-------

Externals are kind of optional included files. This support allows you to version sensitive data without providing them to everyone.
Environment teams that don't need to know this data can still work with karma (without having the external file).

.. note::
    An external file is only needed when values for the secured environment are used 

Use case
--------

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
------------

* The **[externals]** section lists the files which contain the sensitive data
* An external file can only contain *variables* section (neither *includes* section nor *externals* one is allowed)
* Sensitive values need to be explicitly declared as **<external>** : this tag tells karma to find correct value in external file instead of applying fallback strategy 