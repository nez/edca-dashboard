function searchbykeyword ( keyword, table ){

    $.post('/contracts', function (contracts) {


        var html = "<table class='table table-striped'>"+
            "<thead>"+
            "<tr>"+
            "<th>#</th><th>Producto o servicio</th><th>Año</th><th style='width: 180px'>Contrato</th><th>Monto (IVA)</th><th>Descarga</th><th>Explora</th>"+
            "</tr>"+
            "</thead>"+
            "<tbody>";

        for (var i =0; i < contracts.length; i++){

            if ( keyword != '' ){

                if ( contracts[i].id.toUpperCase().indexOf(keyword.toUpperCase()) != -1 || contracts[i].product.toUpperCase().indexOf(keyword.toUpperCase()) != -1 ) {
                    html += "<tr><td>"+ contracts[i].number+"</td>"+
                        "<td>"+contracts[i].product+"</td>"+
                        "<td>"+contracts[i].year+"</td>"+
                        "<td>"+contracts[i].id_naicm+"</td>"+
                        "<td>"+contracts[i].amount+"</td>"+
                        "<td> <a href='"+contracts[i].download_url+"' class='btn btn-default'> <i class='fa fa-download'></i></a></td>"+
                        "<td> <a href='"+contracts[i].url+"' class='btn btn-default'> <i class='fa fa-line-chart'></i></a></td></tr>";
                }

            } else {
                html += "<tr><td>"+ contracts[i].number+"</td>"+
                    "<td>"+contracts[i].product+"</td>"+
                    "<td>"+contracts[i].year+"</td>"+
                    "<td>"+contracts[i].id_naicm+"</td>"+
                    "<td>"+contracts[i].amount+"</td>"+
                    "<td> <a href='"+contracts[i].download_url+"' class='btn btn-default'> <i class='fa fa-download'></i></a></td>"+
                    "<td> <a href='"+contracts[i].url+"' class='btn btn-default'> <i class='fa fa-line-chart'></i></a></td></tr>";
            }

        }

        html += "</tbody></table>";

        table.html(html);
    });
}

var ctable = $('#ctable');

$('#buscar').keyup(function () {
    searchbykeyword($(this).val(), ctable);
});

$(document).ready(function(){
    searchbykeyword('', ctable);
});
