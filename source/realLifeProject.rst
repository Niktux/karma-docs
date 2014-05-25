Real life project step by step
==============================

Setup
-----

1. Install **karma** via composer : see :ref:`getting_started`

2. Given our application filetree is :

.. code-block:: text

    ├── config
    │   └── app.yml-dist
    │   └── db.yml-dist
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

With :file:`config/app.yml-dist` :

.. code-block:: yaml

    debug: <%app.debug%>
    base_url: <%url%>

and :file:`config/db.yml-dist` :

.. code-block:: yaml

    hosts:
      - <%db.host%>
    user: <%db.user%>
    pass: <%db.pass%>



3. Create a profile :file:`.karma` in root directory

.. code-block:: yaml

    confDir: env
    suffix: -dist
    master: master.conf
    sourcePath: config/

Production
----------

.. important::

   Difference between production and other environments is that some values are very sensitive (like database access).
   We are using karma's **externals** system to manage it.

Fill :file:`env/master.conf` with production values : 

.. code-block:: yaml

    [externals]
    secured.conf
    
    [variables]    
    app.debug:
        production = false
    
    url:
        production = http://www.mysite.com
    
    db.host:
        production = [ http://sql1.mysite.com, http://sql2.mysite.com ]
         
    db.user:
        production = <external>
        
    db.pass:
        production = <external>

And :file:`env/secured.conf` for sensitive values :

.. code-block:: yaml

    [variables]    
    db.user:
        production = prod_user
        
    db.pass:
        production = qd5yBz$mdK)=6s

.. caution::

    Do not store **secured.conf** with the application in the same vcs. Only hosting team should have access to this file.


Deployment step has to run this command :

::

    karma hydrate -e production


Staging
-------

.. important::

    Staging environment is quite a standard need. No specificity in this chapter.

Just add staging values in :file:`env/master.conf` :

.. code-block:: yaml

    [externals]
    secured.conf
    
    [variables]    
    app.debug:
        default = false
    
    url:
        production = http://www.mysite.com
        staging = http://staging.mysite.com
    
    db.host:
        production = [ http://sql1.mysite.com, http://sql2.mysite.com ]
        staging = http://sql.staging.mysite.com
         
    db.user:
        production = <external>
        staging = staging_user
        
    db.pass:
        production = <external>
        staging = unsecuredPass

Deployment step has to run this command :

::

    karma hydrate -e staging

Development
-----------

.. important::

    Development environment is special : there is no **one** environment but as much as developers in your team.
    For this example project, each developer has his own host with his name in url (http://devname.mysite.dev)
    and all developers share the same database with his own user.

Add dev values in :file:`env/master.conf` :

.. code-block:: yaml

    [externals]
    secured.conf
    
    [variables]    
    app.debug:
        dev = true
        default = false
    
    url:
        production = http://www.mysite.com
        staging = http://staging.mysite.com
        dev = http://${user}.mysite.dev
    
    db.host:
        production = [ http://sql1.mysite.com, http://sql2.mysite.com ]
        staging = http://sql.staging.mysite.com
        dev = http://sql.mysite.dev
         
    db.user:
        production = <external>
        staging = staging_user
        dev = ${user}
        
    db.pass:
        production = <external>
        staging = unsecuredPass
        dev = 123456

Deployment step has to run this command :

::

    karma hydrate -e dev -d user=jdoe

Continuous integration
----------------------

.. important::

    A special need here : we have a n-tier continous integration solution. Our application can be built on any slave.
    For automated functional test suites, the used url can change from one slave to another. We use karma **overriding** system to solve this problem.
    
Let's go ! Add integration values in :file:`env/master.conf` :

.. code-block:: yaml

    [externals]
    secured.conf
    
    [variables]    
    app.debug:
        dev = true
        default = false
    
    url:
        production = http://www.mysite.com
        staging = http://staging.mysite.com
        dev = http://${user}.mysite.dev
        integration = http://default_slave.ic.mysite.com
    
    db.host:
        production = [ http://sql1.mysite.com, http://sql2.mysite.com ]
        staging = http://sql.staging.mysite.com
        dev = http://sql.mysite.dev
        integration = http://default_sql.ic.mysite.com
         
    db.user:
        production = <external>
        staging = staging_user
        dev = ${user}
        integration = integration_user
        
    db.pass:
        production = <external>
        staging = unsecuredPass
        dev, integration = 123456

Deployment step has to run this command :

::

    karma hydrate -e integration --override url=http://slave22.ici.mysite.com

or

::

    karma hydrate -e integration -o url=http://slave22.ici.mysite.com -o db.host=http://sql22.ici.mysite.com

.. note::

    The overriden value (-o) can be dynamically given by our CI platform.
    
