<?php
/**
 * SocialEngine
 *
 * @category   Application_Core
 * @package    Install
 * @copyright  Copyright 2006-2020 Webligo Developments
 * @license    http://www.socialengine.com/license/
 * @version    $Id: install.tpl 9747 2012-07-26 02:08:08Z john $
 * @author     John
 */
?>

<?php if (!$this->queryError) : ?>

    <?php echo $this->form->render($this);?>

<?php else : ?>

    <ul>
        <?php foreach ($this->errors as $error) : ?>
            <li>
                <?php echo $error ?>
            </li>
        <?php endforeach; ?>
    </ul>

<?php endif; ?>
