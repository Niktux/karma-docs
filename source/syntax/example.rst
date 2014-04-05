Full example
============

.. code-block:: yaml

    # master.conf
    [includes]
    db.conf
    subdir/other.conf
    
    [variables]
    # Some comment
    var1:
        dev = value1
        # another comment
        staging, integration = value2
        prod = value3
        default = value4
    
    var2:
        dev = ${someParameter}
        integration, prod = valA
        default = valB

.. code-block:: yaml
        
    #subdir/other.conf
    [variables]
    var3:
        prod = false
        default = true

.. code-block:: yaml
        
    # db.conf
    [externals]
    secured.conf
    # comments are allowed in any section
    
    [variables]
    db.user:
        prod = <external>
        default = root
    
    db.password:
        prod = <external>
        default = 

.. code-block:: yaml
        
    #secured.conf
    [variables]
    db.user:
        prod = sqluser
    
    db.password:
        prod = ThisIsASecretData