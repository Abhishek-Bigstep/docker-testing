<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    User
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: profile.tpl 9984 2013-03-20 00:00:04Z john $
 * @author     John
 */
?>

<div class="layout_middle">
   <div class="generic_layout_container">
      <div class="headline">
         <h2>
            <?php if ($this->viewer->isSelf($this->user)):?>
            <?php echo $this->translate('Edit My Profile');?>
            <?php else:?>
            <?php echo $this->translate('%1$s\'s Profile', $this->htmlLink($this->user->getHref(), $this->user->getTitle()));?>
            <?php endif;?>
         </h2>
         <div class="tabs">
            <?php
      // Render the menu
      echo $this->navigation()
        ->menu()
        ->setContainer($this->navigation)
        ->render();
    ?>
         </div>
      </div>
      <?php
  /* Include the common user-end field switching javascript */
  echo $this->partial('_jsSwitch.tpl', 'fields', array(
      'topLevelId' => (int) @$this->topLevelId,
      'topLevelValue' => (int) @$this->topLevelValue
    ));
?>
      <?php
  $this->headTranslate(array(
    'Everyone', 'All Members', 'Friends', 'Only Me',
  ));
?>
      <script type="text/javascript">
  scriptJquery(document).ready(function() {
    en4.user.buildFieldPrivacySelector(
      scriptJquery('.global_form *[data-field-id]'),
      JSON.parse('<?php echo $this->privacyExemptFields ?>')
    );
  });
</script> 
   </div>
</div>
<div class="layout_middle">
   <div class="generic_layout_container"> 
     <div class="user_profile_edit">
       <?php echo $this->form->render($this) ?> 
     </div>
   </div>
</div>
