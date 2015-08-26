.. _getting_started:

Getting started
===============

Current version
---------------
The current version is **5.2.1**

Requirements
------------

Karma needs **PHP 5.4+**.

Installation
------------

The recommended way is to use `composer <http://getcomposer.org/>`_ : 

.. code-block:: json

    {
        "require": {
                "niktux/karma" : "~5.2"
        }
    }

Recommended directory structure
-------------------------------

We recommend to follow this classic files organization.

.. code-block:: text

    ├── env
    │   └── master.conf
    ├── src
    │   └── ...
    ├── vendor
    │    └── ...
    ├── www
    │    └── ...
    └── composer.json
        
.. note:: 
    Following this structure saves you from filling some configuration to see karma working !
 
