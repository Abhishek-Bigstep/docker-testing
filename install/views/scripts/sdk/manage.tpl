<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    Install
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: manage.tpl 9747 2012-07-26 02:08:08Z john $
 * @author     John
 */
?>

<div class="content sdk manage" id="content4">
  
  <div class="tip" id="package-created"><span>Package(s) successfully created. Download below.</span></div>
  

  <h3>Manage Package Files</h3>

  <p>
    These are the built package files we found on your system at
    <i>temporary/package/sdk</i>
  </p>

  <?php if( empty($this->packages) ): ?>

    <div class="tip">
      No packages were found.
    </div>
  
  <?php else: ?>

    <div class="button-container">
      <button onclick="scriptJquery('#sdk_manage_form').attr('action', '<?php echo $this->url(array('action' => 'combine')) ?>').submit();">Combine</button>
      <button onclick="scriptJquery('#sdk_manage_form').attr('action', '<?php echo $this->url(array('action' => 'delete')) ?>').submit();">Delete</button>
    </div>

    <form action="<?php echo $this->url() ?>" method="get" id="sdk_manage_form">
    
      <table class="sdk_table manage">
        <thead>
          <tr>
            <th><input type='checkbox' class='checkbox' onclick="toggle(this);" /></th>
            <th class="package-file"><a href="javascript:void(0);">Package File</a></th>
            <th class="package-date"><a href="javascript:void(0);">Date Built</a></th>
          </tr>
        </thead>
        <tbody>

          <?php foreach( $this->packages as $index => $package ): ?>
            <tr>
              <td>
                <input type='checkbox' class='checkbox' name="actions[]" value="<?php echo basename($this->packageFiles[$index]) ?>">
              </td>
              <td>
                <a href="<?php echo $this->url(array('action' => 'download')) ?>?file=<?php echo urlencode(basename($this->packageFiles[$index])) ?>" class="buttonlink sdk-download">
                  <?php echo basename($this->packageFiles[$index]) ?>
                </a>
              </td>
              <td>
                <?php echo $package ? $package->getMeta()->getDate() : '' ?>
              </td>
            </tr>
          <?php endforeach; ?>

        </tbody>
      </table>

    </form>
    <script type="text/javascript">
      function toggle(source) {
          var checkboxes = document.querySelectorAll('input[type="checkbox"]');
          for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i] != source)
              checkboxes[i].checked = source.checked;
          }
      }
    </script>
  <?php endif; ?>
</div>
