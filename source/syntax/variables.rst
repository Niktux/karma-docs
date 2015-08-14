Variables
=========

The main section is **[Variables]**. It contains values for all the environments.

Syntax is : 

.. code-block:: yaml

    [variables]
    variableName1:
        environment = value
        environment, otherEnvironment, anotherEnvironment = otherValue
        default = fallbackValue

    variableName2:
        environment = value1
        anotherEnvironment = value2
        otherEnvironment = value3
        default = fallbackValue

For a same variable, you can : 

* set value for a given environment
* group all environments that share a same value
* define a default value for all missing environments (fallback strategy)

TODO values
-----------
If a value is not known yet, you can use **__TODO** marker to avoid silencious hydratation errors. Karma will trigger an error if you try to hydrate with a TODO value.

.. code-block:: yaml

    [variables]
    myVar:
        dev = value
        prod = __TODO__


System variables
----------------

A system variable contains configuration depending on the system onto the application is running, in opposition of pure application configuration.

For example, a variable that enables or disables debug mode is not a system one. A variable containing database configuration is a system variable. 


Distinguishing system variables from other ones allows you to execute scenarios like "testing production configuration in dev environment".
Hydrate command allows you tu use different environments for both system and normal variables.

Syntax is : 

.. code-block:: yaml

    [variables]
    notASystemVariable:
        environment = value
        default = fallbackValue

    @systemVariable:
        environment = value
        default = fallbackValue
        
.. note::
	System variable are prefixed with **@**