<?php

namespace Product\Controller\Factory;

use Product\Controller\FindAllProductsByPrice;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

/**
 * @author Guilherme P. Nogueira <guilhermenogueira90@gmail.com>
 */
class FindAllProductsByPriceFactory implements FactoryInterface
{
    /**
     * {@inheritdoc}
     */
    public function createService(ServiceLocatorInterface $serviceLocator)
    {
        $realServiceLocator = $serviceLocator->getServiceLocator();

        return new FindAllProductsByPrice;
    }
}
