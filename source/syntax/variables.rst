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

