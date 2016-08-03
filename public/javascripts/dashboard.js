// DONUT CHART
$(document).ready(function () {

    $.post('/contratacionesabiertas/donut-chart-data', function (data) {

        var newData = [];
        var colors = [];

        for (var i = 0; i < data.length; i++) {
            newData.push([data[i].procurementmethod, Number(data [i].sum)]);
        }


        var plot4 = $.jqplot('chart4', [newData], {
            //title: 'TIPOS DE CONTRATACION',
            seriesDefaults: {
                // make this a donut chart.
                renderer: $.jqplot.DonutRenderer,
                rendererOptions: {
                    // Donut's can be cut into slices like pies.
                    sliceMargin: 3,
                    // Pies and donuts can start at any arbitrary angle.
                    startAngle: -90,
                    showDataLabels: true,
                    // By default, data labels show the percentage of the donut/pie.
                    // You can show the data 'value' or data 'label' instead.
                    //dataLabels: 'value',
                    // "totalLabel=true" uses the centre of the donut for the total amount
                    totalLabel: true,
                    shadow: false
                },
                seriesColors: [
                    '#00cc99',
                    '#ff6666',
                    '#663399',
                    '#ffcc00',
                    '#ff6600'
                ]
            },
            grid: {
                drawBorder: false,
                drawGridLines: true,        // wether to draw lines across the grid or not.
                shadow: false,
                backgroundColor: 'transparent'//'white'//'rgb(255, 255, 255)'
            },
            highlighter: {
                show: true,

                sizeAdjust: 1,
                tooltipLocation: 'n',
                tooltipAxes: 'yref',
                useAxesFormatters: false,

                //dataLabels: 'value',
                //tooltipFormatString: '%s'
                tooltipContentEditor: function (current, serie, index, plot) {
                    //return "<div class='col-sm-2'><p style='color: black'><b>" + data[index][1] + " " + data[index][0] + "</b></p></div>";
                    return "<div class='col-sm-2'><p style='color: black'><b>" + newData[index][0] + ":<br> $" + newData[index][1] + "</b></p></div>";
                }
            }
        });
    });


    // FIND CONTRACTS
    function searchbykeyword(keyword, table, param, filter) {
        $.post('/contratacionesabiertas/find-contracts', {
            keyword: keyword,
            orderby: param,
            filter: filter
        }, function (contracts) {
            table.html(contracts);
        });
    }

//Eventos de los botones del paginador
    function p () {
        $('ul.pagination li a').click(function(e){
            $('#ctable').load('/contratacionesabiertas/pagination',{ npage: $(this).data('page'), keyword: $('#keyword').val(),  filter: $('#filter').val() , orderby: $('#orderby').val() }, p);
        });
    }

    $('#ctable').load('/contratacionesabiertas/pagination',{ npage : 1 } ,p );


    $('#keyword').keyup(function () {
        $('#ctable').load('/contratacionesabiertas/pagination',{ npage : 1, keyword: $('#keyword').val(),  filter: $('#filter').val() , orderby: $('#orderby').val() } , p );
    });

    $('#orderby').change(function () {
        $('#ctable').load('/contratacionesabiertas/pagination',{ npage : 1, keyword: $('#keyword').val(),  filter: $('#filter').val() , orderby: $('#orderby').val() } , p );
    });

    $('#filter').change(function () {
        $('#ctable').load('/contratacionesabiertas/pagination',{ npage : 1, keyword: $('#keyword').val(),  filter: $('#filter').val() , orderby: $('#orderby').val() } , p );
    });


});


// BUBBLE CHART (GCHART)
google.charts.load('current', {'packages': ['corechart'], 'language': 'es'});
google.charts.setOnLoadCallback(drawSeriesChart);

function drawSeriesChart() {

    $.post('/contratacionesabiertas/bubble-chart-data', function (data) {

        var newData = [['ID', 'Fecha de firma', 'Vigencia (días naturales)', 'Tipo', 'Monto MXN']];
        //var newData = [['ID', 'Fecha de firma', 'Monto MXN' ,  'Tipo',  'Vigencia (días naturales)']];

        for (i = 0; i < data.length; i++) {
            newData.push([ data[i].title , new Date(data[i].datesigned), Math.abs(data[i].vigencia.days), data[i].procurementmethod, Number(data[i].value_amount)]);
            //newData.push([ data[i].title , new Date(data[i].datesigned), Number(data[i].value_amount)/1000000, data[i].procurementmethod,  isNaN(Math.abs(data[i].vigencia.days))?0: Math.abs(data[i].vigencia.days )  ]);
        }

        var options = {
            //'legend': 'left',
            //title: 'Contrataciones en el tiempo',
            chartArea: {
                width: '100%',
                heigth: '100%',
                left: '75',
                right: '30',
                top: '10',
                //bottom: '30'
            },
            backgroundColor: 'transparent',
            tooltip: {isHtml: true},

            hAxis: {
                title: 'Fecha de firma',
                textStyle: {
                    italic: false,
                    fontName: 'Open Sans',
                    fontSize: '11pt'
                },
                titleTextStyle: {
                    italic: false,
                    fontName: 'Open Sans',
                    fontSize: '14pt'
                },
                gridlines: {
                    color: 'transparent'
                }

            },
            vAxis: {
                //maxValue: 2000,
                title: 'Vigencia en días naturales',
                textStyle: {
                    italic: false,
                    fontName: 'Open Sans',
                    fontSize: '11pt'
                },
                titleTextStyle: {
                    italic: false,
                    fontName: 'Open Sans',
                    fontSize: '14pt'
                }
                /*gridlines: {
                 color: 'transparent'
                 }*/
            },
            bubble: {
                stroke: 'none',
                textStyle: {
                    //no text
                    color: 'none',
                    fontSize: 11,
                    auraColor: 'none'
                }
            },
            series: {
                'Adjudicación directa': {color: '#00cc99'},
                'Convenio de colaboración': {color: '#ff6666'},
                'Fideicomiso': {color: '#663399'},
                'Invitación a cuando menos tres personas': {color: '#ffcc00'},
                'Licitación pública': {color: '#ff6600'}
            },
            legend: {
                position: 'bottom',
                textStyle: {
                    fontName: 'Open Sans'
                }
            }
        };

        var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
        //chart.draw( data  , options);
        chart.draw(google.visualization.arrayToDataTable(newData), options);
        function resizeHandler () {
            chart.draw(google.visualization.arrayToDataTable(newData), options);
        }
        if (window.addEventListener) {
            window.addEventListener('resize', resizeHandler, false);
        }
        else if (window.attachEvent) {
            window.attachEvent('onresize', resizeHandler);
        }
    });
}
