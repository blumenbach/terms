<?php

$sitelink = $argv[1];
$query = 'PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>' .
          'PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>' .
          'PREFIX wd: <http://www.wikidata.org/entity/>' .
          'PREFIX skos: <http://www.w3.org/2004/02/skos/core#>' .
          'SELECT ?o ?label ?desc WHERE { ' .
          $sitelink .
          ' schema:about ?o .' .
          '?o rdfs:label ?label filter(lang(?label) = "en") .' .
          'OPTIONAL {?o schema:description ?desc filter(lang(?desc) = "en")}' .
          '}';
$uri = 'https://query.wikidata.org/sparql?query=';
$curl = curl_init();
$fp = fopen("/tmp/results_sitelink_de.xml", "a");
$q = urlencode($query);
$req= $uri . $q;
curl_setopt ($curl, CURLOPT_URL, $req);
curl_setopt($curl, CURLOPT_FILE, $fp);
curl_setopt($curl,  CURLOPT_RETURNTRANSFER, TRUE);
$contents = curl_exec($curl);
$out = '<term uri="' . $sitelink . '">'. "\n" . $contents . "</term>";
fwrite($fp, $out);
curl_close($curl);
fclose($fp);
