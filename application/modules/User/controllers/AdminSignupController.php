<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    User
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: AdminSignupController.php 9747 2012-07-26 02:08:08Z john $
 * @author     John
 */

/**
 * @category   Application_Core
 * @package    User
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 */
class User_AdminSignupController extends Core_Controller_Action_Admin
{
  public function indexAction()
  {    
    $signup_id = $this->_getParam('signup_id');

    // Prepare all steps
    $table = Engine_Api::_()->getDbtable('signup', 'user');
    $select = $table->select()
      ->order('order ASC');
    $this->view->steps = $steps = $table->fetchAll($select);

    // Get current step
    $currentStep = null;
    $fixedStep = NULL;
    foreach( $steps as $step ) {
      if( $step->signup_id == $signup_id ) {
        $currentStep = $step;
      }
    }
    if( !$currentStep ) {
      $currentStep = $steps->offsetGet(0);
      $signup_id = $currentStep->signup_id;
    }
    $this->view->current_step = $currentStep;

    // Get form and view script
    $plugin = new $currentStep->class;
    $this->view->script = $plugin->getAdminScript();
    $this->view->form = $form = $plugin->getAdminForm();
    
    $form->setAction(Zend_Controller_Front::getInstance()
         ->getRouter()->assemble(
         array('module' => 'user', 'controller' => 'signup', 'signup_id' => $signup_id), 
         'admin_default', true));
    
    // Check method
    if( !$this->getRequest()->isPost() )  {
      return;
    }

    if( !$form->isValid($this->getRequest()->getPost()) ) {
      return;
    }
    
    if(!empty($_POST['adminemail']) && $_POST['adminemail'] == 1 && empty($_POST['adminemailaddress'])) {
      $form->addError($this->view->translate("Receive New Signup Alerts is requried field."));
      return;
    }

    // Process
    if( $plugin->onAdminProcess($form) === false && $signup_id == 5 ) {
      $this->view->error = $this->view->translate('Please enable subscription plans ' .
        'from %1$shere%2$s before enabling this step during sign-up process.',
        '<a href="' .
        $this->view->escape($this->view->url(array('module' => 'payment','controller' => 'package'),'',true)) .
        '">', '</a>');
    }
  }

  public function enableAction()
  {

  }

  public function disableAction()
  {

  }
  
  public function orderAction() {
    $table = Engine_Api::_()->getDbtable('signup', 'user');
    $results = $table->fetchAll($table->select());
    $orders = $this->getRequest()->getParam('order');
    foreach ($results as $result) {
      $key = array_search ('step_'.$result->signup_id, $orders);
      $result->order = $key+1;
      $result->save();
    }
    return;
  }
}
