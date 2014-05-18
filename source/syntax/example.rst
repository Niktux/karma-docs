Full example
============

.. code-block:: yaml

    # master.conf
    [includes]
    db.conf
    subdir/other.conf
    
    [groups]
    staging = [integration, preprod]
    
    [variables]
    # Some comment
    var1:
        dev, integration = value1
        # another comment
        staging = value2
        prod = value3
        default = value4
    
    var2:
        dev = ${someParameter}
        integration, prod = valA
        default = valB
        
    servers:
        dev = devel-server
        prod = [ prod1, prod2, prod3 ]

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