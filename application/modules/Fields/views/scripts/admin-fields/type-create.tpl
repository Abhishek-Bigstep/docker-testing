<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    Fields
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: type-create.tpl 9747 2012-07-26 02:08:08Z john $
 * @author     John
 */
?>
<?php if( $this->form ): ?>

  <?php echo $this->form->render($this) ?>

<?php else: ?>

  <div class="global_form_popup_message">
    <?php echo $this->translate("Your changes have been saved.") ?>
  </div>

  <script type="text/javascript">
    setTimeout(function() {
      parent.onTypeCreate(
        <?php echo Zend_Json::encode($this->option) ?>
      );
      parent.Smoothbox.close();
    },1000);
  </script>

<?php endif; ?>

<script type="text/javascript">
  function disableSubmit(el) {
    el.disabled = true;
    el.form.submit();
  }
</script>
