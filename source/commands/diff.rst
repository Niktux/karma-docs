Diff
====

Display values differences between two environments

Arguments
---------

=========== ====================================================================== ======== =============
Argument    Role                                                                   Required Default Value
=========== ====================================================================== ======== =============
env1        first environment to compare                                           Yes      *<none>*     
env2        second environment to compare                                          Yes      *<none>*     
=========== ====================================================================== ======== =============

Prototype
---------

.. code-block:: bash

    karma diff env1 env2

Examples
--------

.. code-block:: bash

    karma diff dev prod
    
will output this kind of display :

.. code-block:: text

    Diff between dev and prod
    |---------------------------------------|
    |              | dev       | prod       |
    |---------------------------------------|
    | print_errors | true      | false      |
    | server       | NOT FOUND | sql21      |
    | search       | localhost | search21   |
    | nullInProd   | true      | NULL       |
    | db.user      | root      | <external> |
    |---------------------------------------|