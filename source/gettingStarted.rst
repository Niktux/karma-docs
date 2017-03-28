.. _getting_started:

Getting started
===============

Current version
---------------
The current version is **5.5.3**

Requirements
------------

Karma needs **PHP 5.4+** or **PHP 7.0+**.

Installation
------------

The recommended way is to use the phar archive
 
.. code-block:: shell

   wget -O karma https://github.com/Niktux/karma/releases/download/5.5.3/karma.phar
   chmod 0755 karma

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
 
