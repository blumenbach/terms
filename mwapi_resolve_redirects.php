<?php

$title = $argv[1];
$uri = 'https://de.wikipedia.org/w/api.php?action=query&generator=links&prop=redirects&format=json&titles=';
$curl = curl_init();
$fp = fopen("/tmp/results_redirects_de.xml", "a");
$q = urlencode($title);
$req= $uri . $q;
curl_setopt ($curl, CURLOPT_URL, $req);
curl_setopt($curl, CURLOPT_FILE, $fp);
curl_setopt($curl,  CURLOPT_RETURNTRANSFER, TRUE);
$contents = curl_exec($curl);
$json = json_decode($contents, true);
$result = null;
$query = arrayGet($json, 'query');
if ($query) {
  foreach ($json['query']['pages'] as $page) {
    $result = $page['title'];
  }
}
$out = '<term>' . $title . '</term><redirect>' . $result . "</redirect>\n";
fwrite($fp, $out);
curl_close($curl);
fclose($fp);

function arrayGet($array, $key, $default = NULL) {
  return isset($array[$key]) ? $array[$key] : $default;
}
