Overview
========

What is Karma ?
---------------

Karma is a PHP command line tool which hydrates source code with environment dependent values.

What does it solve ?
--------------------

Karma manages environment dependent configuration : configuration values which change between development, staging, production or any other environment.

It allows you to version all your configuration values and deploy the correct ones.

Existing solutions
------------------

First alternative solution is to maintain one full configuration file per environment and to symlink the correct one. This solution is a nightmare to maintain
because :

* many values are duplicated
* files become bigger and bigger (or too much file need to be created)
* you must edit each file whenever you add one variable

Other solution is to build a hierarchical configuration system. This also fails because configuration dependencies between environments are not as simple as a 
hierarchical system : 

* you can need to maintain different environment as the same level : staging1, staging2
* the way you read the hierarchy is not obvious : sometimes dev differs from all others, sometimes is production, ... This leads to duplication
* it's hard to have clear overview of all your configuration
 
.. note:: 
    All of these solution have drawbacks. That's why Karma was created !

How does it work ?
------------------

Karma offers you to transform your configuration files into template files. For example, your **db.ini** file below:

.. code-block:: ini

    [Database]
    Host=mysql.domain.com
    User=myUser
    Pass=mySecretPass    

will be replaced by its template **db.ini-dist** : 

.. code-block:: ini

    [Database]
    Host=<%db.host%>
    User=myUser
    Pass=<%db.pass%>

Environment dependent values will be stored in a dedicated file **master.conf** :

.. code-block:: yaml

    [variables]
    db.host:
      prod = mysql.domain.com
      default = 127.0.0.1
    
    db.pass:
      prod = mySecretPass
      integration, staging = otherPass
      dev = awfulPassword

.. note:: 
    Application still uses the **db.ini** file which henceforth needs to be generated

This generation will be performed by karma **hydrate** command :

::

    karma hydrate --env=dev src/ 

which will generate this **db.ini** file : 

.. code-block:: ini

    [Database]
    Host=127.0.0.1
    User=myUser
    Pass=awfulPassword


while the same command with **--env=prod** option would generate : 

.. code-block:: ini

    [Database]
    Host=mysql.domain.com
    User=myUser
    Pass=mySecretPass
    
.. note:: 
    With **karma**, your application does not need to know about environment at all !