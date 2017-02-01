#!/bin/bash

psql edca -c "
copy (select contractingprocess.id as id_local, contractingprocess.ocid, concat(replace(contractingprocess.ocid, '/', '_'),
'_',contractingprocess.id,'.json') as nombre_archivo, contract.title from contractingprocess, contract where contractingprocess_id = contractingprocess.id  order
by id_local) to stdout With CSV DELIMITER ','; " > json_filenames.csv

go run parser-adela.go > adela-edca.csv
