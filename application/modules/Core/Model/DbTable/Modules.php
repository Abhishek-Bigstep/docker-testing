<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    Core
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: Modules.php 9747 2012-07-26 02:08:08Z john $
 * @author     John
 */

/**
 * @category   Application_Core
 * @package    Core
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 */
class Core_Model_DbTable_Modules extends Engine_Db_Table
{
    protected $_modules;

    protected $_modulesAssoc = array();

    protected $_enabledModuleNames;

    protected $defaultModules = array (
        'activity',
        'album',
        'announcement',
        'authorization',
        'blog',
        'chat',
        'classified',
        'core',
        'event',
        'fields',
        'forum',
        'group',
        'invite',
        'messages',
        'mobi',
        'music',
        'network',
        'payment',
        'poll',
        'storage',
        'user',
        'video'
    );

    public function getModule($name)
    {
        if (null === $this->_modules) {
            $this->getModules();
        }

        if (!empty($this->_modulesAssoc[$name])) {
            return $this->_modulesAssoc[$name];
        }

        return null;
    }

    public function getModules()
    {
        if (null === $this->_modules) {
            $this->_modules = $this->fetchAll();
            foreach ($this->_modules as $module) {
                $this->_modulesAssoc[$module->name] = $module;
            }
        }

        return $this->_modules;
    }

    public function getModulesAssoc()
    {
        if (null === $this->_modules) {
            $this->getModules();
        }

        return $this->_modulesAssoc;
    }

    public function hasModule($name)
    {
        return !empty($this->_modulesAssoc[$name]);
    }

    public function isModuleEnabled($name)
    {
        return engine_in_array($name, $this->getEnabledModuleNames());
    }

    public function getEnabledModuleNames()
    {
        if (null === $this->_enabledModuleNames) {
            $this->_enabledModuleNames = array();
            $modules = $this->select()
                ->from($this, 'name')
                ->where('enabled = ?', true)
                ->query()
                ->fetchAll(Zend_Db::FETCH_COLUMN);

            foreach ($modules as $module) {
                if (defined('_ENGINE_DEFAULT_MODULES_ONLY') && !engine_in_array($module, $this->defaultModules)) {
                    continue;
                }
                $this->_enabledModuleNames[] = $module;
            }
        }

        return $this->_enabledModuleNames;
    }
    
    public function getAllModules($params = array()) {
    
      $select = $this->select()
                    ->from($this)
                    ->where('type = ?', 'extra')
                    ->order('title ASC');
      $data = array('' => '');
      foreach( $select->query()->fetchAll() as $category ) {
        $data[$category['name']] = $category['title'];
      }
      return $data;
    }
}
