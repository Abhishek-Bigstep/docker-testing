<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    Core
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: spam.tpl 9747 2012-07-26 02:08:08Z john $
 * @author     Jung
 */
?>

<h2>
  <?php echo $this->translate("Spam & Banning Tools") ?>
</h2>

<?php if( engine_count($this->navigation) > 1 ): ?>
  <div class='tabs'>
    <?php
      // Render the menu
      //->setUlClass()
      echo $this->navigation()->menu()->setContainer($this->navigation)->render()
    ?>
  </div>
<?php endif; ?>

<div class='settings'>
  <?php echo $this->form->render($this); ?>
</div>

<script type="application/javascript">
  scriptJquery(document).ready(function() {
    recaptchaVersion("<?php echo Engine_Api::_()->getApi('settings', 'core')->core_spam_recaptcha_version; ?>", '');
  });
  function recaptchaVersion(value) {
    if(value == 1) {
      scriptJquery('#recaptchapublic-wrapper').show();
      scriptJquery('#recaptchaprivate-wrapper').show();
      scriptJquery('#recaptchapublicv3-wrapper').hide();
      scriptJquery('#recaptchaprivatev3-wrapper').hide();
    } else {
      scriptJquery('#recaptchapublic-wrapper').hide();
      scriptJquery('#recaptchaprivate-wrapper').hide();
      scriptJquery('#recaptchapublicv3-wrapper').show();
      scriptJquery('#recaptchaprivatev3-wrapper').show();
    } 
  }
function changeLock(obj) {
    var value = obj.value
    if(value == 1){
        document.getElementById('lockattempts-wrapper').style.display = "block";
        document.getElementById('lockduration-wrapper').style.display = "block";
    }else{
        document.getElementById('lockattempts-wrapper').style.display = "none";
        document.getElementById('lockduration-wrapper').style.display = "none";
    }
}

scriptJquery(document).ready(function() {
  changeLock(scriptJquery('input[name=lockaccount]:checked')[0]);
});
</script>
