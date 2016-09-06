<?php
// Version
define('VERSION', '1.4.0.0');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

// Install
if (!defined('DIR_APPLICATION')) {
	header('Location: ../install/index.php');
	exit;
}

date_default_timezone_set('PRC');

//VirtualQMOD
require_once('../vqmod/vqmod.php');
VQMod::bootup();

// VQMODDED Startup
require_once(VQMod::modCheck(DIR_SYSTEM . 'startup.php'));

$application_config = 'admin';

// Application
require_once(VQMod::modCheck(DIR_SYSTEM . 'framework.php'));