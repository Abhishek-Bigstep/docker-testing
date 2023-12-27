<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    Activity
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: deleted-item.tpl 9747 2012-07-26 02:08:08Z john $
 * @author     Steve
 */
?>

<script type="text/javascript">
  parent.scriptJquery('#activity-item-<?php echo $this->action_id ?>').remove();
  setTimeout(function()
  {
    parent.Smoothbox.close();
  }, <?php echo ( $this->smoothboxClose === true ? 1000 : $this->smoothboxClose ); ?>);
</script>


  <div class="global_form_popup_message">
    <?php echo $this->message ?>
  </div>
