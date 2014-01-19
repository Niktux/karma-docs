Getting started
===============

Requirements
------------

Karma needs **PHP 5.4+**.

Installation
------------

The recommended way is to use `composer <http://getcomposer.org/>`_ : 

.. code-block:: json

    {
        "require": {
                "niktux/karma" : "1.0"
        }
    }

Recommended directory structure
-------------------------------

We strongly recommend to store configuration files one level above sources files. Deployments will be easier and more secure.

.. code-block:: text

    ├── conf
    │   └── master.conf
    └── www
        ├── src
        │   └── ...
        ├── vendor
        │    └── ...
        └── composer.json
        
.. note:: 
    Following this structure saves you from filling options in each karma commands !
 