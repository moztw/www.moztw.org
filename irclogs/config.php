<?php

class config
{
	static $dbms_host = 		"localhost";
	static $dbms_port = 		"";
	static $dbms_database = 	"lumberjack";
	static $dbms_user = 		"root";
	static $dbms_pass = 		"";
	
	static $default_channel =	"mozilla-taiwan";
	static $default_number_of_lines = 50;

	static $timezone = 		"Asia/Taipei";

	static function get_db()
	{
		return new lumberjack_db( config::$dbms_host, config::$dbms_port, config::$dbms_database, config::$dbms_user, config::$dbms_pass, config::$timezone );
	}
}


?>
