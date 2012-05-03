<?php


class db_class
{
	protected $_conn;
	
	public function __construct( $server, $port, $database, $user, $password, $timezone)
	{
		if ($port) { $port = ":".$port; }
		$this->_conn = mysql_connect( $server.$port, $user, $password );
		if (!$this->_conn){ die ("Could not connect: " + mysql_error() ); }
		mysql_select_db( $database, $this->_conn );
		$this->timezone = $timezone;
	}
	
	public function __destruct( )
	{
		mysql_close( $this->_conn );	
	}
	
}

class lumberjack_db extends db_class
{
	protected function hashinate( $result )
	{
		$lines = array();
		$counter = 0;
		while( $row = mysql_fetch_assoc($result) )
		{
			if( isset( $row['time'] ) )
			{
				date_default_timezone_set('UTC');
				$dt = date_create( $row['time']);
				$dt->setTimezone( new DateTimeZone($this->timezone));
				$row['time'] = $dt->format("Y-m-d H:i:s"); 
			}
			$lines[$counter] = $row;
			$counter++;
		}
		return $lines;
	}
	
	public function get_last_n_lines( $channel, $n )
	{
		$channel = mysql_real_escape_string( $channel );
		$n = (int)$n;
		$query = "
			SELECT id, channel, name, time, message, type, hidden FROM main WHERE channel = '$channel' ORDER BY time DESC, id DESC LIMIT $n;";
		
		$results = mysql_query( $query, $this->_conn);
		if (!$results){ print mysql_error(); return false; }
		if( mysql_num_rows($results) == 0 ) { return false; }
		
		return array_reverse($this->hashinate($results));
	}
	
	public function get_before( $channel, $id, $n )
	{
		$channel = mysql_real_escape_string( $channel );
		$n = (int)$n;
		$id = (int)$id;
		$query = "
			SELECT id, channel, name, time, message, type, hidden FROM main WHERE channel = '$channel' AND id < $id ORDER BY time DESC, id DESC LIMIT $n;";
		
		$results = mysql_query( $query, $this->_conn);
		if (!$results){ print mysql_error(); return false; }
		if( mysql_num_rows($results) == 0 ) { return false; }
		
		return $this->hashinate($results);
	}
	
	public function get_after( $channel, $id, $n )
	{
		$channel = mysql_real_escape_string( $channel );
		$n = (int)$n;
		$id = (int)$id;
		$query = "
			SELECT id, channel, name, time, message, type, hidden FROM main WHERE channel = '$channel' AND id > $id ORDER BY time ASC, id DESC LIMIT $n;";
		
		$results = mysql_query( $query, $this->_conn);
		if (!$results){ print mysql_error(); return false; }
		if( mysql_num_rows($results) == 0 ) { return false; }
		
		return $this->hashinate($results);
	}
	
	public function get_lines_between_now_and_id( $channel, $id)
	{
		$channel = mysql_real_escape_string( $channel );
		$id = (int)$id;
		$query = "
			SELECT id, channel, name, time, message, type, hidden FROM main WHERE channel = '$channel' AND id > $id ORDER BY time DESC, id DESC LIMIT 500";
		
		$results = mysql_query( $query, $this->_conn);
		if (!$results){ print mysql_error(); return false; }
		if( mysql_num_rows($results) == 0 ) { return false; }
		
		return array_reverse($this->hashinate($results));
	}
	
	public function get_offset( $channel, $id)
	{
		$channel = mysql_real_escape_string( $channel );
		$n = (int)$n;
		$query = "
			SELECT COUNT(*) as count FROM main 
				WHERE channel = '$channel' 
				AND id < $id 
				GROUP BY channel;";
		
		$results = mysql_query( $query, $this->_conn);
		if (!$results){ print mysql_error(); return false; }
		if( mysql_num_rows($results) == 0 ) { return false; }
		
		$res = $this->hashinate($results);
		$count = $res[0]["count"];
		if ( $count < 0 )
		{
			return 0;
		}
		return $count;
	}
	
	public function get_context( $channel, $id, $n)
	{
		$channel = mysql_real_escape_string($channel);
		$n = (int)$n + (int)$offset;
		$offset = (int) $offset;
		$id = (int)$id;
		
		$count = $this->get_offset( $channel, $id );
		
		$offset = $count - (int)($n/2);
		
		if( $offset < 0)
		{
			$offset = 0;
		}
		
		$query = "
			SELECT * 
				FROM (SELECT * FROM main 
						WHERE channel = '$channel'
						LIMIT $n OFFSET $offset) channel_table
				ORDER BY time DESC ;
				";
		
		$results = mysql_query( $query, $this->_conn);
		if (!$results){ print mysql_error(); return false; }
		if( mysql_num_rows($results) == 0 ) { return false; }
		
		return array_reverse($this->hashinate($results));
	}
	
	public function get_search_results( $channel, $search, $n, $offset=0 )
	{
		$search = mysql_real_escape_string($search);
		$channel = mysql_real_escape_string($channel);
		$n = (int) $n;
		$offset = (int) $offset;
		
		$searchquery = " WHERE channel = '$channel' ";
		$searcharray = split("[ (%20)(%25)(%2520)|]", $search);
		foreach($searcharray as $searchterm )
		{
			$searchquery .= "AND (message LIKE '%".mysql_real_escape_string($searchterm)."%' OR name LIKE '%".mysql_real_escape_string($searchterm)."%' ) ";
		}
		
		$n = (int)$n;
		$query = "
			SELECT id, channel, name, time, message, type, hidden 
				FROM main 
			$searchquery ORDER BY id DESC LIMIT $n OFFSET $offset;";
		
		$results = mysql_query( $query, $this->_conn);
		if (!$results){ print mysql_error(); return false; }
		if( mysql_num_rows($results) == 0 ) { return false; }
		
		$results = array_reverse($this->hashinate($results));
		return $results;
	}
	
	public function get_tag( $channel, $tag, $n )
	{
		$tag = mysql_real_escape_string($tag);
		$channel = mysql_real_escape_string($channel);
		$n = (int)$n;
		
		$query = "
			SELECT id, channel, name, time, message, type, hidden 
				FROM main 
			WHERE message LIKE '".$tag.":%' ORDER BY id DESC LIMIT $n;";
		
		$results = mysql_query( $query, $this->_conn);
		if (!$results){ print mysql_error(); return false; }
		if( mysql_num_rows($results) == 0 ) { return false; }
		
		return array_reverse($this->hashinate($results));
	}
	
	public function get_lastseen( $channel, $user )
	{
		$user = mysql_real_escape_string($user);
		$channel = mysql_real_escape_string($channel);
		
		$query = "
			SELECT time 
				FROM main 
			WHERE name = '".$user."' ORDER BY id DESC LIMIT 1;";
		
		$results = mysql_query( $query, $this->_conn);
		if (!$results){ print mysql_error(); return false; }
		if( mysql_num_rows($results) == 0 ) { return false; }
		
		return $this->hashinate($results);
	}
	
	public function get_user( $channel, $user, $n )
	{
		$user = mysql_real_escape_string($user);
		$channel = mysql_real_escape_string($channel);
		$n = (int) $n;
		
		$query = "
			SELECT id, channel, name, time, message, type
				FROM main 
			WHERE name = '".$user."' ORDER BY id DESC LIMIT ".$n.";";
		
		$results = mysql_query( $query, $this->_conn);
		if (!$results){ print mysql_error(); return false; }
		if( mysql_num_rows($results) == 0 ) { return false; }
		
		return $this->hashinate($results);
	}
}
?>

