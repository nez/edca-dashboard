function searchbykeyword ( keyword, table ){
    $.post('/contrataciones-abiertas/find-contracts', { keyword: keyword }, function (contracts) {
        table.html(contracts);
    });
}

var ctable = $('#ctable');

$('#buscar').keyup(function () {
    searchbykeyword($(this).val(), ctable);
});
