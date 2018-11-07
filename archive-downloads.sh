#! /usr/bin/php
<?php

define('USERNAME', 'usrName');
define('DOWNLOADS_DIR_NAME', 'downloadsDirName')
define('ARCHIVE_DIR_NAME', 'archiveDirName');

$path = '/home/' . USERNAME . '/' . DOWNLOADS_DIR_NAME;
$isDirChanged = chdir($path);

if ($isDirChanged === false) {
	echo 'Cannot change dir to: ' . $path . '. Application terminated.' . PHP_EOL;
	return 1;
}

$fileList = scandir('.');

if (in_array(ARCHIVE_DIR_NAME, $fileList) === false) {
	mkdir(ARCHIVE_DIR_NAME);
}

foreach ($fileList as $fileName) {

	if (in_array($fileName, ['.', '..', ARCHIVE_DIR_NAME]) === true) {
		continue;
	}

	$lastFileModificationDate = date('Y-m-d', filemtime($fileName));
	if (date('Y-m-d') <= $lastFileModificationDate) {
		continue;
	}

	$newFileDir = './' . ARCHIVE_DIR_NAME . '/' . $lastFileModificationDate;
	if (file_exists($newFileDir) === false) {
		mkdir($newFileDir);
	}

	$i = 1;
	$newFilePath = $newFileDir . '/' . $fileName;
	while (file_exists($newFilePath) === true) {
		$newFilePath = $newFileDir . '/' . $i . '_' . $fileName;
		$i++;
	}

	$isFileMoved = rename($fileName, $newFilePath);
	if ($isFileMoved === true) {
		echo 'File was moved: ' . $fileName . ' -> ' . $newFilePath . PHP_EOL;
	} else {
		echo 'Cannot move file: ' . $fileName . ' -> ' . $newFilePath . PHP_EOL;
	}

}

return 0;