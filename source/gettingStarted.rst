Getting started
===============

Installation
------------

The recommended way is to use `composer <http://getcomposer.org/>`_ : 

.. code-block:: json

    {
        "require": {
                "niktux/karma" : "dev-master"
        }
    }

Recommended directory structure
-------------------------------

We strongly recommend to store configuration files at same level thant sources files. Deployments will be easier and more secure.

.. code-block:: text

    ├── conf
        └── master.conf
    ├── src
    │   └── ...
    └── vendor
        └── ...
        
.. note:: 
    Following this structure saves you from filling options in each karma commands !
 