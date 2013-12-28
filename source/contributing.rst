Contributing to Karma
=====================

.. note::
    All contributions are welcomed, even the smaller ! 

Documentation
-------------

You can `fork this documentation on github <https://github.com/niktux/karma-docs>`_ and submit pull requests.
You only have to edit **.rst** files with a text editor.

If you want to compile it, you will need : 

* python
* sphinx

Please refer to `sphinx documentation <http://sphinx-doc.org/install.html>`_ to install these items.

To compile, use the makefile :

.. code-block:: bash

    make html

.. note::

    Html generated site will be under **build** directory


Code
----

Just `fork the repository on github <https://github.com/niktux/karma-docs>`_ and submit pull requests.

Please follow these simple rules before submitting pull requests : 

* Update unit tests and run them
* Follow coding standards (check build/phpcs.xml for exact rules)
* Be careful of encoding (utf8 + unix line delimiters only)
* Ideally, rebase your branch and clean your commit messages (squash your commits if needed)

To run the unit tests, just call phpunit (it will use phpunit.xml configuration file)

.. code-block:: bash

    vendor/bin/phpunit

Thank you for your contributions !