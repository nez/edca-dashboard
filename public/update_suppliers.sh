#!/bin/bash
echo "Actualizando proveedores"
echo "Proveedor,Razón social,ID de contrato,Producto o servicio,Procedimiento de contratación,Vigencia del contrato,Monto,cpid" > supplier_data.csv
psql -U tester edca -c "
copy (

select ( select string_agg(identifier_id, '; ') from supplier where contractingprocess_id = contractingprocess.id) as identifier_id, (select string_agg(identifier_legalname, '; ') from supplier where contractingprocess_id=contractingprocess.id) as identifier_legalname, ocid, contract.title,tender.procurementmethod, 
concat (cast (  ( DATE_PART('year', period_enddate) - DATE_PART('year', period_startdate) ) * 12  + ( DATE_PART('month', period_enddate) - DATE_PART('month', period_startdate))  as integer) / 12 , ' año(s)') as vigencia,
contract.value_amount, contract.contractingprocess_id as cpid 
from tender, contract, contractingprocess
where 
contractingprocess.id = contract.contractingprocess_id and contractingprocess.id = tender.contractingprocess_id  
and ( contract.period_enddate is not null and contract.period_startdate is not null) order by cast (  ( DATE_PART('year', period_enddate) - DATE_PART('year', period_startdate) ) * 12  + ( DATE_PART('month', period_enddate) - DATE_PART('month', period_startdate))  as integer) / 12

)
To stdout with CSV DELIMITER ',';
" >> supplier_data.csv
