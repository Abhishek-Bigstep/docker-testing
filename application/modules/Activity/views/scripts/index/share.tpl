<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    Activity
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: share.tpl 9747 2012-07-26 02:08:08Z john $
 * @author     John
 */
?>

<div>
  <?php echo $this->form->setAttrib('class', 'global_form_popup')->render($this) ?>
  <br />
  <div class="sharebox">
    <?php if( $this->attachment->getPhotoUrl() ): ?>
      <div class="sharebox_photo">
        <?php echo $this->htmlLink($this->attachment->getHref(), $this->itemPhoto($this->attachment, 'thumb.icon'), array('target' => '_parent')) ?>
      </div>
    <?php endif; ?>
    <div>
      <div class="sharebox_title">
        <?php echo $this->htmlLink($this->attachment->getHref(), $this->attachment->getTitle(), array('target' => '_parent')) ?>
      </div>
      <div class="sharebox_description">
        <?php echo Engine_Api::_()->core()->smileyToEmoticons($this->attachment->getDescription()); ?>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
//<![CDATA[
var toggleTwitterShareCheckbox;
(function() {
  toggleTwitterShareCheckbox = function(){
      scriptJquery('span.composer_twitter_toggle').toggleClass('composer_twitter_toggle_active');
      scriptJquery('input[name=post_to_twitter]').prop('checked', scriptJquery('span.composer_twitter_toggle').hasClass('composer_twitter_toggle_active'));
  }
})()
//]]>
</script>
