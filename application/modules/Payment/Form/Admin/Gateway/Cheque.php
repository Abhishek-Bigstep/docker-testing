<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    Payment
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: Cheque.php 9747 2019-12-07 02:08:08Z john $
 * @author     John Boehr <j@webligo.com>
 */

/**
 * @category   Application_Core
 * @package    Payment
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 */
class Payment_Form_Admin_Gateway_Cheque extends Payment_Form_Admin_Gateway_Abstract
{
  public function init()
  {
    parent::init();
    $this->setTitle('Payment Gateway: Cheque');
    $this->setDescription('PAYMENT_FORM_ADMIN_GATEWAY_CHEQUE_DESCRIPTION');
    // Decorators
    $this->loadDefaultDecorators();
    $this->getDecorator('Description')->setOption('escape', false);
        // Elements
  $checkInfo =
  "
  Name or Business:
Mailing address:
  ";

    // Elements
    $this->addElement('Textarea', 'account_details', array(
      'label' => 'Account Details:',
      'required' => true,
      'allowEmpty' => false,
      'value'=>$checkInfo,
      'filters' => array(
        new Zend_Filter_StringTrim(),
      ),
    ));
  }
}
