<?php 
// All of the JSON calls are handled here. 

error_reporting( E_ERROR | E_WARNING | E_PARSE ); 

include("LumberJack_Database.php");
include("config.php");

$pdb = config::get_db();

// n: The number of results to return (centered around id, if provided)
if( isset( $_GET['n']) ) 
{
	$n = $_GET['n'];
}
else
{
	$n = config::$default_number_of_lines;
}

// id: The id of a term. 
if( isset($_GET['id']) )
{
	$id = $_GET['id'];
}

// channel: The channel, less the # mark - say, 'sfucsss' or 'ubuntu'. 
if( isset( $_GET['channel'] ) )
{
	$channel = $_GET['channel'];
}
else
{
	$channel = config::$default_channel;
}

# SEARCH 
if ( isset( $_GET['search'] ) )
{
	$search = $_GET['search'];

	$offset = 0;
	if ( isset( $_GET['offset'] ) && is_numeric( $offset ) )
	{
		$offset = $_GET['offset'];
	}
	
	// Search channel for $search
	$lines = $pdb->get_search_results( $channel, $search, $n, $offset );
	print json_encode( $lines );
	return;
}	

# USER
if ( $_GET['type'] == 'user' ) 
{
	$lines = $pdb->get_user( $channel, $_GET['user'], $n); 
	print json_encode( $lines );
	return;
}


# CONTEXT - results centered about an ID value
if( $_GET['type'] == 'context' )
{
	// context type (before, middle, after)
	if( isset( $_GET['context']) ) 
	{
		$context = $_GET['context'];
	}
	else
	{
		$context = "middle";
	}
	
	// Used to retrieve a page before the existing page
	if( $context == "before" )
	{
		$lines = $pdb->get_before( $channel, $id,  $n );
	}
	// Used to retrieve a page centered about an ID value
	if( $context == "middle" )
	{
		$lines = $pdb->get_context( $channel, $id,  $n );
	}
	// Used to retrieve a page after the existing page
	if( $context == "after" )
	{
		$lines = $pdb->get_after( $channel, $id,  $n );
	}
	print json_encode( $lines );
	return;
}

// UPDATE - get all results that occur after $id 
if ( $_GET['type'] == 'update' )
{
	if( !isset( $id )) 
	{
		print "Cannot return results without provided id parameter.";
		return;
	}
	$lines = $pdb->get_lines_between_now_and_id( $channel, $id ) ;
	print json_encode( $lines );
	return;
}

// TAG- get all results that match a blah: blahblah tag. 
if ( $_GET['type'] == 'tag' && isset( $_GET['tag']) )
{
	$lines = $pdb->get_tag( $channel, $_GET['tag'], $n ) ;
	print json_encode( $lines );
	return;
}

// LAST SEEN - when was the last time name n posted?
if( $_GET['type'] == 'lastseen' && isset( $_GET['user'] ) )
{
	$lines = $pdb->get_lastseen( $channel, $_GET['user'] ); 
	print json_encode( $lines );
	return;
}

// DEFAULT - get the last $n results

$lines = $pdb->get_last_n_lines( $channel, $n );
print json_encode( $lines );
return;


