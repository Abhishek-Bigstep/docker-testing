<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    Core
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: index.tpl 9747 2012-07-26 02:08:08Z john $
 * @author     Jung
 */
?>

<h2><?php echo $this->translate("Language Manager") ?></h2>

<p>
  <?php echo $this->translate("CORE_VIEWS_SCRIPTS_ADMINLANGUAGE_INDEX_DESCRIPTION") ?>
</p>

<br />

<?php
  $settings = Engine_Api::_()->getApi('settings', 'core');
  if( $settings->getSetting('user.support.links', 0) == 1 ) {
    echo 'More info: <a href="https://community.socialengine.com/blogs/597/65/language-manager" target="_blank">See KB article</a>.';
  } 
?>	

<br />

<script type="text/javascript">
  var changeDefaultLanguage = function(locale) {
    var url = '<?php echo $this->url(array('module'=>'core','controller'=>'language','action'=>'default')) ?>';
    scriptJquery.ajax({
      url : url,
      dataType : 'json',
      method : 'post',
      data : {
        locale : locale,
        format : 'json'
      },
      success : function() {
        window.location.replace( window.location.href );
      }
    });
  }
</script>

<br />

<div class="admin_language_options">
  <a href="<?php echo $this->url(array('action' => 'create')) ?>" class="buttonlink admin_language_options_new"><?php echo $this->translate("Create New Pack") ?></a>
  <a href="<?php echo $this->url(array('action' => 'upload')) ?>" class="buttonlink admin_language_options_upload"><?php echo $this->translate("Upload New Pack") ?></a>
</div>

<br />

<?php if ($this->customLocale) : ?>
<div class="tip">
   <span>The Locale "<?php echo $this->customLocale; ?>" does not have a language package, so the default language is set to English. Please create the language pack.</span>
</div>
<?php endif; ?>

<table class="admin_table admin_languages admin_responsive_table">
  <thead>
    <tr>
      <th><?php echo $this->translate("Language") ?></th>
      <th><?php echo $this->translate("Options") ?></th>
    </tr>
  </thead>
  <tbody>
    <?php foreach( $this->languageNameList as $locale => $translatedLanguageTitle ): ?>
      <tr>
        <td data-label="<?php echo $this->translate("Language") ?>">
          <?php echo $translatedLanguageTitle ?>
        </td>
        <td class="admin_table_options">
          <a href="<?php echo $this->url(array('action' => 'edit', 'locale' => $locale)) ?>"><?php echo $this->translate("edit phrases") ?></a>
           <a href="<?php echo $this->url(array('action' => 'export', 'locale' => $locale)) ?>"><?php echo $this->translate("export") ?></a>
          <?php if( $this->defaultLanguage != $locale ): ?>
             <?php echo $this->htmlLink('javascript:void(0);', $this->translate('make default'), array('onclick' => 'changeDefaultLanguage(\'' . $locale . '\');')) ?>
             <?php echo $this->htmlLink(array('module'=>'core','controller'=>'language','action'=>'delete',  'locale'=>$locale), $this->translate('delete'), array('class'=>'smoothbox')) ?>
          <?php else: ?>
            <?php echo $this->translate("default") ?>
          <?php endif; ?>
          
        </td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>
