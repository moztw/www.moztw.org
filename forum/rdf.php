<?php
/***************************************************************************
 *                                  rdf.php
 *                            -------------------
 *   begin                : Friday, 2nd May
 *   copyright            : (C) 2002 Antony Bailey
 *   email                : antony_bailey@lycos.co.uk
 *
 *
 *
 ***************************************************************************/

/***************************************************************************
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 ***************************************************************************/


// Set phpBB
define ('IN_PHPBB', true);
$phpbb_root_path = './';
include($phpbb_root_path . 'extension.inc');
include($phpbb_root_path . 'common.'.$phpEx);

// Set RDF and cache (Will proberly not run on lycos)
header ('Cache-Control: private, pre-check=0, post-check=0, max-age=0');
header ('Expires: ' . gmdate('D, d M Y H:i:s', time()) . ' GMT');
header ('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
header ('Content-Type: text/xml');

// Set default output rate at 10 well it's not to small and not too big ;)
$count = ( !isset($HTTP_GET_VARS['count']) ) ? 10 : intval($HTTP_GET_VARS['count']);
$count = ( $count == 0 ) ? 20 : $count;

// Set main url
$script_name = preg_replace('/^\/?(.*?)\/?$/', '\1', trim($board_config['script_path']));
$viewtopic = ( $script_name != '' ) ? $script_name . '/viewtopic.' . $phpEx : 'viewtopic.'. $phpEx;
$index = ( $script_name != '' ) ? $script_name . '/index.' . $phpEx : 'index.'. $phpEx;
$server_name = trim($board_config['server_name']);
$server_protocol = ( $board_config['cookie_secure'] ) ? 'https://' : 'http://';
$server_port = ( $board_config['server_port'] <> 80 ) ? ':' . trim($board_config['server_port']) . '/' : '/';

$index_url = $server_protocol . $server_name . $server_port . $index;
$viewtopic_url = $server_protocol . $server_name . $server_port . $viewtopic;

// Set the encoding
$rdf = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>
<rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\" xmlns=\"http://my.netscape.com/rdf/simple/0.9/\">

<channel>
    <title>" . $board_config['sitename'] . " Forum</title>
    <link>" . $index_url . "</link>
    <description>" . $board_config['site_desc'] . "</description>
</channel>
";

$fid = ( isset($HTTP_GET_VARS['fid']) ) ? intval($HTTP_GET_VARS['fid']) : '';
$sql_where = ( !empty($fid) ) ? " AND f.forum_id = $fid " : " ";

// Load public forums only
$sql = "SELECT DISTINCT t.topic_title, t.topic_last_post_id, p.post_time, f.forum_name
    FROM " . TOPICS_TABLE . " AS t, " . POSTS_TABLE . " AS p, " . FORUMS_TABLE . " AS f
    WHERE
        t.forum_id = f.forum_id
            AND f.auth_view = " . AUTH_ALL . "
            AND p.topic_id = t.topic_id
            AND p.post_id = t.topic_last_post_id
            $sql_where
    ORDER BY p.post_time DESC LIMIT $count";
$topics_query = $db->sql_query($sql);

if ( !$topics_query )
{
    die("Could not obtain topics data");
}
else
{
    $topics = $db->sql_fetchrowset($topics_query);
}

if ( count($topics) == 0 )
{
    die("Could not find topics");
}
else
{
// Interesting...very very interesting.
    for ($i = 0; $i < count($topics); $i++)
    {
        $title = htmlspecialchars($topics[$i]['topic_title']);
        $url = $viewtopic_url . "?" . POST_POST_URL . "=" . $topics[$i]['topic_last_post_id'] . "#" . $topics[$i]['topic_last_post_id'];

        $rdf .= "
<item>
    <title>" . $title . "</title>
    <link>" . $url . "</link>
</item>
";
    }
}

// Set footer
$rdf .= "
</rdf:RDF>";

// And here goes the output.
echo $rdf;
//
// That's all Folks!
// -------------------------------------------------
?> 
