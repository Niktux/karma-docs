Profile
=======

Why a profile ?
---------------

If you have changed karma default values (master filename, configuration directory or template suffix), you need to specify your own values
to karma. Since 2.0.0, this can not be done with command options. That's where profile comes in !

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
    sourcePath: config/

Using profile
-------------
Nothing to do ! Karma tries to read your profile before applying default values. 
