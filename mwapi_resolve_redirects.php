<?php

$title = $argv[1];
$uri = 'https://en.wikipedia.org/w/api.php?action=query&generator=links&prop=redirects&format=json&titles=';
$curl = curl_init();
$fp = fopen("/tmp/results_redirects_en.xml", "a");
$q = urlencode($title);
$req= $uri . $q;
curl_setopt ($curl, CURLOPT_URL, $req);
curl_setopt($curl, CURLOPT_FILE, $fp);
curl_setopt($curl,  CURLOPT_RETURNTRANSFER, TRUE);
$contents = curl_exec($curl);
$json = json_decode($contents, true);
foreach ($json['query']['pages'] as $page) {
  $result = $page['title'];
}
$out = '<redirect>' . $result . '>'. "</redirect>\n";
fwrite($fp, $out);
curl_close($curl);
fclose($fp);

