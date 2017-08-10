## ZF2 Creator
A simple script writen in Bash to create module and controller following Zend FRamework 2 Structure.

You should change file **DefineAuthorFile** and modify the string **author**. Per example:

**DefineAuthorFile**
```sh
#!/bin/bash
export author="@author Guilherme P. Nogueira <guilhermenogueira90@gmail.com>"
```
Result in file **PHP**:
```php
<?php

/**
 * @author Guilherme P. Nogueira <guilhermenogueira90@gmail.com>
 */

 // source code...
```

### Resources

Opções:
  **Module**: Full module (directory structure, files defaults, Controller with **Factory** pattern
  **Controller**: Create Controller with **Factory** pattern
  **Controller Plugin**: Create the plugin to usage inside controllers

### Running
```sh
$ ./run.sh
```

### Author
Guilherme P. Nogueira
