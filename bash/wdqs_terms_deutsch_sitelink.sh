#!/bin/bash
if (( $# < 2 )); then
    term=$1
fi
query="https://query.wikidata.org/sparql?query=PREFIX%20rdf%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX%20rdfs%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX%20wd%3A%20%3Chttp%3A%2F%2Fwww.wikidata.org%2Fentity%2F%3E%0APREFIX%20skos%3A%20%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0ASELECT%20%3Fo%20%3Flabel%20%3Fdesc%20WHERE%20%7B%20";
query1="%20schema%3Aabout%20%3Fo%20.%0A%20%20%3Fo%20rdfs%3Alabel%20%3Flabel%20filter(lang(%3Flabel)%20%3D%20%22de%22)%20.%0A%20%20OPTIONAL%20%7B%3Fo%20schema%3Adescription%20%3Fdesc%20filter(lang(%3Fdesc)%20%3D%20%22de%22)%7D%0A%7D%20%20 -X GET";
query3="$query$term$query1";
echo "$query3";
SPARQL_RESULTS="$(curl "$query3")";
echo "<term id='$term'>$SPARQL_RESULTS</term>" >> "results_deutsch_sitelink.xml"
