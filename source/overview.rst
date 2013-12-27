Overview
========
Some text, *italic text*, **bold text**
 
* bulleted list.  There needs to be a space right after the "*"
* item 2
 
.. note:: 
    This is a note.

And some php code:

.. code-block:: php

    <?php
    
    namespace Karma;
    
    use Symfony\Component\Console\Input\InputInterface;
    use Symfony\Component\Console\Output\OutputInterface;
    use Symfony\Component\Console\Input\InputOption;
    
    class Command extends \Symfony\Component\Console\Command\Command
    {
        use \Karma\Logging\OutputAware;
        
        protected
            $app;
        
        protected function configure()
        {
            $this
                ->addOption('confDir', null, InputOption::VALUE_REQUIRED, 'Configuration root directory', Application::DEFAULT_CONF_DIRECTORY)
                ->addOption('master', null, InputOption::VALUE_REQUIRED, 'Configuration master file', Application::DEFAULT_MASTER_FILE)
            ;
        }
    }