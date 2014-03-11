Custom data
===========

Values in your ***.conf** files can be parameterized. Typical example is developement urls which contain developer names.
It's done with this syntax ``${var}``

Example :

.. code-block:: yaml

    [variables]
    url:
        dev = http://${developper}.karma-php.dev
        production = http://www.karma-php.com

These custom data can be valued with ``--data`` (or ``-d``) option in hydrate command : 

::

    karma hydrate -e dev -d developper=jdoe config/