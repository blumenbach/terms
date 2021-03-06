#!/bin/bash
if (( $# < 2 )); then
    term=$1
fi
query="https://query.wikidata.org/sparql?query=PREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0APREFIX+wd%3A+%3Chttp%3A%2F%2Fwww.wikidata.org%2Fentity%2F%3E%0APREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0ASELECT+%3Fs+%3Ftaxon+WHERE+%7B%0A++%7B%3Fs+rdfs%3Alabel+%22";
query1="%22%40de%7D+UNION+%7B%3Fs+skos%3AaltLabel+%22"
query2="%22%40de%7D+.%0A++%3Fs+wdt%3AP225+%3Ftaxon%0A%7D++%0A -X GET";
query3="$query$term$query1$term$query2";
echo "$query3";
SPARQL_RESULTS="$(curl "$query3")";
echo "<term id='$term'>$SPARQL_RESULTS</term>" >> "results.xml"


