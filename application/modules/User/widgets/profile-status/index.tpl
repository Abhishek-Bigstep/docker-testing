<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    User
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: index.tpl 9747 2012-07-26 02:08:08Z john $
 * @author     John
 */
?>

<div id='profile_status'>
	<?php if($this->subject()) { ?>
		<h2>
			<?php echo $this->subject()->getTitle() ?>
		</h2>
		<br />
	<?php } ?>
  <?php if( $this->auth ): ?>
    <span class="profile_status_text" id="user_profile_status_container">
      <?php echo $this->viewMore($this->getHelper('getActionContent')->smileyToEmoticons($this->subject()->status)) ?>
      <?php if( !empty($this->subject()->status) && $this->subject()->isSelf($this->viewer())): ?>
        <a class="profile_status_clear" href="javascript:void(0);" onclick="en4.user.clearStatus();">(<?php echo $this->translate('clear') ?>)</a>
      <?php endif; ?>
    </span>
  <?php endif; ?>
</div>


<?php if( !$this->auth ): ?>
  <div class="tip">
    <span>
      <?php echo $this->translate('This profile is private.');?>
    </span>
  </div>
  <br />
<?php endif; ?>
