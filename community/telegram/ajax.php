<?php
require('links.php');

$recaptcha = $_POST['recaptcha'] ?? '';
if ('' === $recaptcha) failed();
if (!recaptcha_verify($recaptcha)) failed();

$tag = $tags[$_GET['tag'] ?? ''] ?? 'zh-tw';
success(get_links($tag));

/**
 * Verify the recaptcha.
 * @param  string $recaptcha_response The recaptcha field value.
 * @return boolean Recaptcha verify state.
 */
function recaptcha_verify($recaptcha_response)
{
    return json_decode(file_get_contents('https://www.google.com/recaptcha/api/siteverify', false, stream_context_create(['http' => [
        'method' => 'POST',
        'header' => 'Content-type: application/x-www-form-urlencoded',
        'content' => http_build_query([
            'secret' => '6LdlOxYTAAAAAAlL-GdqeU_KWOYt1WrHNGtW6m2E',
            'response' => $recaptcha_response,
            'remoteip' => $_SERVER['REMOTE_ADDR'],
        ])]])), true)['success'];
}

/**
 * @param array $contents
 */
function response_json($contents)
{
    $json = json_encode($contents);
    header('Content-Type: application/json');
    header('Length: ' . strlen($json));
    echo($json);
    exit();
}

/**
 * Failed the verify.
 */
function failed()
{
    response_json([
        'success' => false,
    ]);
}

/**
 * Passed the verify and output the links.
 * @param array $links The links for the output.
 */
function success($links)
{
    response_json([
        'success' => true,
        'links' => $links,
    ]);
}

/**
 * Get links with the specified tag.
 * @param string $tag Specified the tag that the links should contain.
 * @return array Returns the links.
 */
function get_links($tag)
{
    global $links;

    $result = [];
    foreach ($links as $link) {
        if (in_array($tag, $link['tags'])) {
            $result[] = $link;
        }
    }
    return $result;
}
