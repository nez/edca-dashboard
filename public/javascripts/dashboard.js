$(document).ready(function () {

    // DONUT CHARTs

    function donutChart1() {
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
                        sliceMargin: 0,
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
                        'gray', // adhesión
                        '#00cc99', // adjudicación
                        '#663399', // contrato de fideicomiso
                        '#ff6666', // convenio de colaboración
                        '#ffcc00', // ITP
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

                    //dataLabels: 'value',
                    //tooltipFormatString: '%s'
                    tooltipContentEditor: function (current, serie, index, plot) {
                        //return "<div class='col-sm-2'><p style='color: black'><b>" + data[index][1] + " " + data[index][0] + "</b></p></div>";
                        return "<div class='col-sm-2'><p style='color: black'><b>" + newData[index][0] + ":<br> $" +  ( (   newData[index][1]    ).toFixed(2) ).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")  + "</b></p></div>";
                    }
                }
            });
        });
    }


    function donutChart2d3() {
        var width = 400,
            height = 350,
            radius = Math.min(width, height) / 2;

        var color = d3.scale.ordinal()
            .range([
                '#00cc99', // adjudicación
                '#663399', // contrato de fideicomiso
                //'#ff6666', // convenio de colaboración
                //'#ffcc00', // ITP
                '#ff6600' // Licitaci
            ]);

        var arc = d3.svg.arc()
            .outerRadius(radius - 10)
            .innerRadius(radius - 85);

        var pie = d3.layout.pie()
            .sort(null)
            .value(function(d) { return d.population; });

        var svg = d3.select("#donutchart2").append("svg")
            .attr("width", width)
            .attr("height", height)
            .append("g")
            .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

        d3.csv("/contratacionesabiertas/static/data.csv", type, function(error, data) {
            if (error) throw error;

            var g = svg.selectAll(".arc")
                .data(pie(data))
                .enter().append("g")
                .attr("class", "arc");

            g.append("path")
                .attr("d", arc)
                .style("fill", function(d) { return color(d.data.age); });

            g.append("text")
                .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
                .attr("dy", ".35em")
                .text(function(d) { return d.data.age; });
        });

        function type(d) {
            d.population = +d.population;
            return d;
        }

    }

    function donutChart2() {

        //$.post('/contratacionesabiertas/donut-chart-data', function (data) {

        var d = [
            ['Adquisición de bienes y servicios', 2690410604.15],
            ['Obra pública', 29471789070.68],
            ['Servicios relacionados con la obra', 8796566811.17]
        ];
        // var colors = [];

        /*for (var i = 0; i < data.length; i++) {
         newData.push([data[i].procurementmethod, Number(data [i].sum)]);
         }*/


        var plot4 = $.jqplot('donutchart2', [d], {
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
                    // By default, data labels show the percentage of the donut/pie.
                    // You can show the data 'value' or data 'label' instead.
                    //dataLabels: 'value',
                    // "totalLabel=true" uses the centre of the donut for the total amount
                    totalLabel: true,
                    shadow: false
                },
                seriesColors: [
                    //'gray', // adhesión
                    '#00cc99', // adjudicación
                    '#663399', // contrato de fideicomiso
                    //'#ff6666', // convenio de colaboración
                    //'#ffcc00', // ITP
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

                //dataLabels: 'value',
                //tooltipFormatString: '%s'
                tooltipContentEditor: function (current, serie, index, plot) {
                    //return "<div class='col-sm-2'><p style='color: black'><b>" + data[index][1] + " " + data[index][0] + "</b></p></div>";
                    return "<div class='col-sm-2'><p style='color: black'><b>" + newData[index][0] + ":<br> $" +  ( (   newData[index][1]    ).toFixed(2) ).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")  + "</b></p></div>";
                }
            }
        });
        //});

    }


    donutChart1();
    donutChart2d3();

    /*
    $('#cat').click(function () {
      donutChart2();
    });*/

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
                'Adhesión a licitación pública': {color: 'gray'},
                'Adjudicación directa': {color: '#00cc99'},
                'Contrato de fideicomiso': {color: '#663399'},
                'Convenio de colaboración': {color: '#ff6666'},
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



