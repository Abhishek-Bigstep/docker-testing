<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    Core
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: widget.tpl 9747 2012-07-26 02:08:08Z john $
 * @author     John
 */
?>
<div style="padding: 10px;">

  <?php if( $this->form ): ?>

    <script type="text/javascript">
      window.addEvent('domready', function() {
        var params = parent.pullWidgetParams();
        var info = parent.pullWidgetTypeInfo();
        $H(params).each(function(value, key) {
          if( $type(value) == 'array' ) {
            value.each(function(svalue){
              if( layoutAdmin(key + '-' + svalue) ) {
                layoutAdmin(key + '-' + svalue).set('checked', true);
              }
            });
          } else if( layoutAdmin(key) ) {
            layoutAdmin(key).value = value;
          } else if( layoutAdmin(key + '-' + value) ) {
            layoutAdmin(key + '-' + value).set('checked', true);
          }
        });
        $$('.form-description').set('html', info.description);
      })
    </script>

    <?php echo $this->form->render($this) ?>

  <?php elseif( $this->values ): ?>

    <script type="text/javascript">
      parent.setWidgetParams(<?php echo Zend_Json::encode($this->values) ?>);
      parent.Smoothbox.close();
    </script>

  <?php else: ?>

    <?php echo $this->translate("Error: no values") ?>
    
  <?php endif; ?>

</div>
