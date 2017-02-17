$(document).ready(function () {

    // DONUT CHARTs

    function donutChart1() {
        $.post('/contratacionesabiertas/donut-chart-data', function (data) {

            var newData = [];
            var colors = [];

            for (var i = 0; i < data.length; i++) {
                newData.push([data[i].procurementmethod, Number(data [i].sum), data[i].percentage, data[i].conteo]);
            }


            var plot4 = $.jqplot('chart4', [newData], {
                //title: 'TIPOS DE CONTRATACION',
                seriesDefaults: {
                    // make this a donut chart.
                    renderer: $.jqplot.DonutRenderer,
                    rendererOptions: {
                        // Donut's can be cut into slices like pies.
                        sliceMargin: 0,
                        // Pies and donuts can start at any arbitrary angle.
                        startAngle: -90,
                        showDataLabels: true,
                        dataLabelFormatString: '%.1f%',
                        // By default, data labels show the percentage of the donut/pie.
                        // You can show the data 'value' or data 'label' instead.
                        //dataLabels: 'value',
                        // "totalLabel=true" uses the centre of the donut for the total amount
                        totalLabel: true,
                        shadow: false
                    },
                    seriesColors: [
                        '#00cc99', // adjudicación
                        'gray', // asa akira
                        '#ffcc00', //conv
                        //'#ff6666', // convenio de colaboración
                        '#663399', // ITP
                        '#ff6600' // Licitación
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
                    dataLabelFormatString: '%.1f',
                    //dataLabels: 'value',
                    //tooltipFormatString: '%s'
                    tooltipContentEditor: function (current, serie, index, plot) {
                        //return "<div class='col-sm-2'><p style='color: black'><b>" + data[index][1] + " " + data[index][0] + "</b></p></div>";
                        return "<div class='col-sm-2'><p style='color: black'>" + newData[index][0] +  " (" + newData[index][2]+")" +":<br><b> $"
                            +  ( (   newData[index][1]    ).toFixed(1) ).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")  +
                                "</b><br>Número de contratos:<br><b>"+
                               newData[index][3]                            +
                            "</b></p></div>";
                    }
                }
            });
        });
    }

    function donutChart2(  ) {

        $.get('/contratacionesabiertas/donut-chart2-data/', function (data) {

            var newData = [];
            //var colors = [];

            for (var i = 0; i < data.length; i++) {
                newData.push([data[i].destino, Number( data [i].total_amount ), data[i].percentage, data[i].conteo ]);
            }


            var plot4 = ff('donutchart2', [newData], {
                //title: 'TIPOS DE CONTRATACION',
                seriesDefaults: {
                    // make this a donut chart.
                    renderer: ff.DonutRenderer,
                    rendererOptions: {
                        // Donut's can be cut into slices like pies.
                        sliceMargin: 0,
                        // Pies and donuts can start at any arbitrary angle.
                        startAngle: -90,
                        showDataLabels: true,
                        dataLabelFormatString: '%.1f%',
                        // By default, data labels show the percentage of the donut/pie.
                        // You can show the data 'value' or data 'label' instead.
                        //dataLabels: 'value',
                        // "totalLabel=true" uses the centre of the donut for the total amount
                        totalLabel: true,
                        shadow: false
                    },
                    seriesColors: [
                        '#ff6600', // Licitación
                        '#663399', // ITP
                        '#00cc99' // adjudicación
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
                        return "<div class='col-sm-2'><p style='color: black'>" + newData[index][0] +" ("+newData[index][2]+")" +
                            ":<br><b> $" +  ( (   newData[index][1]    ).toFixed(2) ).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")  +
                                "</b><br>Número de contratos: <br><b>"+
                                newData[index][3]+
                            "</b></p></div>";

                    }
                }
            });
        });
    }

    donutChart1();
    //donutChart2();
    //donutChart2d3();

    var ff= $.jqplot;
    var st= false;

    $('a[data-toggle="tab"]').on('shown.bs.tab', function ( e ) {
        //$('#donutchart2').html("")
        if (!st) {
            donutChart2();
            st = true;
        }
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
            //sortBubblesBySize: false,
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
                //maxValue: new Date(2017, 2, 2),
                //minValue: new Date(2013, 9, 9),
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
                //maxValue: 8000,
                //minValue: -100,
                scaleType: 'log',
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
                'Contrataciones ASA': {color: 'gray'},
                'Convenio de colaboración': {color: '#ffcc00'},
                'Invitación a tres': {color: '#663399'},
                //'Convenio de colaboración': {color: '#ff6666'},
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


        //evento para dirigir al detalle del contrato
         function selectHandler() {
             var selectedItem = chart.getSelection()[0];
             window.location.href = "/contratacionesabiertas/contrato/"+(data[selectedItem.row].contractingprocess_id)+"/planeacion";

         }
        
        google.visualization.events.addListener(chart, 'select', selectHandler);
        
        //chart.draw( data  , options);

        var dt = google.visualization.arrayToDataTable(newData);
        chart.draw(dt/*google.visualization.arrayToDataTable(newData)*/, options);

        var formatter = new google.visualization.NumberFormat(
            {prefix: '$', negativeColor: 'red', negativeParens: true, decimalSymbol: '.', groupingSymbol: ','});
        formatter.format(dt, 4); // Apply formatter to second column

        var formatter1 = new google.visualization.NumberFormat(
            {negativeColor: 'red', fractionDigits: 0, negativeParens: true, decimalSymbol: '.', groupingSymbol: ','});
        formatter1.format(dt, 2); // Apply formatter to second column


        function resizeHandler () {
            chart.draw(/*google.visualization.arrayToDataTable(newData)*/dt, options);
        }

        if (window.addEventListener) {
            window.addEventListener('resize', resizeHandler, false);
        }
        else if (window.attachEvent) {
            window.attachEvent('onresize', resizeHandler);
        }

    });
}





