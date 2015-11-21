## ZF2 Creator
Um script simples escrito em Bash para criar módulo e controlador seguindo a estrutura do Zend Framework 2.

Você deve alterar o arquivo **DefineAuthorFile** e modificar a string **author**. Por exemplo:

**DefineAuthorFile**
```sh
#!/bin/bash
export author="@author Guilherme P. Nogueira <guilhermenogueira90@gmail.com>"
```

Resultado no arquivo **PHP**:
```php
<?php

/**
 * @author Guilherme P. Nogueira <guilhermenogueira90@gmail.com>
 */

 // source code...
```

Casos de dúvidas, veja exemplo no site do [**phpDocumentor**](http://manual.phpdoc.org/HTMLSmartyConverter/HandS/phpDocumentor/tutorial_tags.author.pkg.html)

### O Script

Opções:
  - 1 - Module: Cria o módulo por completo (estrutura de diretório, arquivos padrões, e Controller seguindo com padrão Factory)
  - 2 - Controller: Cria o controller com padrão Factory

### Run
Para rodar o script, basta executar:

```sh
$ ./run.sh
```

### Autor
Guilherme P. Nogueira
