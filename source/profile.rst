Profile
=======

Why a profile ?
---------------

If you have changed karma default values (master filename, configuration directory or template suffix), you have to specify your own values
every time you run a karma command. It's quite annoying.

With the karma profile (since 1.2.0), you can override karma default values.
  

Setting up profile
------------------

In your working directory (where you launch karma commands, generally application root directory), just write a **.karma** file.

.. code-block:: text

    ├── env
    │   └── master.conf
    ├── src
    │   └── ...
    ├── vendor
    │    └── ...
    ├── www
    │    └── ...
    ├── composer.json
    └── .karma

This file must be in written in YAML.

Example
-------
.. code-block:: yaml

	confDir: myEnvDir
	suffix: -tpl
	master: myMaster.conf

Using profile
-------------
Nothing to do ! When an option value is missing, karma tries to read your profile before applying default values. 
