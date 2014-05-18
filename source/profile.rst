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

.. _formatters:

Formatters
----------

Rendering some special values like true/false, null can lead to errors depending on your target file format.
To deal with, you can define in your profile a rendering strategy called **formatter**.

Up to now, in Karma 2.2.0, only one strategy is applied. In further versions, each targeted file will be able to choose which strategy using.

To do so, you have first to choose your default formatter. Then you have to define it. All definitions are done in profile :

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

Special values supported by formatters are : 

- **<true>** which stands for corresponding boolean
- **<false>** which stands for corresponding boolean
- **<null>** which stands for null value
- **<string>** for strings that do not match any other rules (<string> can be used in right part as placeholder for value being formatted)

.. note::
    None special values are mandatory : you can define partial formatters. Missing special values will not be translated while hydrating.