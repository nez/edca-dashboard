// DONUT CHART
$(document).ready(function(){
    var data = [
        ['Licitaciones', 14],['Invitaciones a tres', 6], ['Adjudicaciones directas:', 5]
    ];

    var plot4 = $.jqplot('chart4', [data], {
        //title: 'TIPOS DE CONTRATACION',
        seriesDefaults: {
            // make this a donut chart.
            renderer:$.jqplot.DonutRenderer,
            rendererOptions:{
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
            seriesColors: ['#00cc99', '#ff4d4d', '#673AB7']
        },
        grid: {
            drawBorder: false,
            drawGridLines: true,        // wether to draw lines across the grid or not.
            shadow: false,
            backgroundColor: 'white'//'rgb(255, 255, 255)'
        },
        highlighter: {
            show: true,

            sizeAdjust: 1,
            tooltipLocation: 'n',
            tooltipAxes: 'yref',
            useAxesFormatters: false,

            //dataLabels: 'value',
            //tooltipFormatString: '%s'
            tooltipContentEditor: function(current, serie, index, plot ){
                //return "<div class='col-sm-2'><p style='color: black'>"+plot.data[serie][index]+"</p></div>";
                return "<div class='col-sm-2'><p style='color: black'><b>"+data[index][1]+" "+data[index][0]+"</b></p></div>";
                //return "<p>Contrato: <br><b>"+ticks1[index] +"</b></p>"+
                //      "<p>Avance "+(serie==0?'fisico':'financiero')+":<br> <b>"+ parseInt(plot.data[serie][index])+ "%</b></p>";
            }
        }
    });

    //JQPLOT BAR CHART
    var bardata = [
        {
            product: 'Plan de monitoreo y conservación de aves del proyecto del<br> Nuevo Aeropuerto Internacional de la Ciudad de México.',
            id : 'LO-009KDH999-N46-2015', s1 : 47.26, s2 : (5708930.68 / 14382969.2 )*100
        },
        {
            product: 'Implementación del programa de rescate de flora y fauna <br>para el Nuevo Aeropuerto Internacional de la Ciudad de México.',
            id : 'LO-009KDH999-N42-2015', s1 : 85.15, s2 : (5344833.89 / 11924906.62)*100
        },
        {
            product: 'Implementación del plan de restauración ecológica para el <br>Nuevo Aeropuerto Internacional de la Ciudad de México.',
            id : 'LO-009KDH999-N45-2015', s1 : 30.25, s2 : (4504538.98/ 18934197.76 )*100
        },
        {
            product: 'Supervisión para: construcción del proyecto integral <br>consistente en barda y camino perimetral, alumbrado, <br>servicios inducidos y casetas de acceso para el <br>Nuevo Aeropuerto Internacional de la Ciudad de México <br>(primera etapa).',
            id : 'IO-009KDH999-N54-2015', s1 : 90, s2 : (2565511.85/3286908.92)*100
        },
        {
            product: 'Desarrollo del proyecto ejecutivo, construcción, equipamiento<br> de mobiliario e instalaciones complementarias para el campamento<br> del Grupo Aeroportuario de la Ciudad de México en el sitio<br> del Nuevo Aeropuerto Internacional de la Ciudad de México.',
            id : 'LO-009KDH999-N47-2015', s1 : 21.23, s2 : (8620689.66/112046320.57)*100
        },
        {
            product: 'Trabajos relativos a la construcción del drenaje pluvial <br>temporal del Nuevo Aeropuerto de la Ciudad de México.',
            id : 'LO-009KDH999-N50-2015', s1 : 10.01, s2 :(13609080.34/192525597.09)*100
        },
        {
            product: 'Diseñar e instrumentar el modelo virtual de información <br>para la construcción del BIM del NAICM.',
            id : 'LO-009KDH999-T52-2015', s1 : 6.4, s2 :0
        },
        {
            product: 'Convocatoria de nivelación y limpieza del terreno del <br> Nuevo Aeropuerto Internacional de la Ciudad de México.',
            id : 'LO-009KDH999-N79-2015', s1 : 4.33, s2 : (169601426.76/1762803241.34)*100
        },
        {
            product: 'Convocatoria de construcción de los caminos provisionales de acceso<br> al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM)<br> ejecutando trabajos de terraceria, estructuras y obras de drenaje,<br>pavimentación y señalamiento.',
            id : 'LO-009KDH999-N80-2015', s1 : 1.11, s2 :(57514449.48/608275577.5)*100
        },
        {
            product: 'Convocatoria de carga, acarreo y descarga fuera del poligono del material<br> existente producto de depositos de demoliciones, desperdicios y desazolve.',
            id : 'LO-009KDH999-N78-2015', s1 : 1.58, s2 : (49391647.5/493916475)*100
        },
        {
            product: 'Supervisión técnica, administrativa y de control de calidad para<br> los trabajos de nivelación y limpieza del terreno del<br> Nuevo Aeropuerto Internacional de la Ciudad de México.',
            id : 'LO-009KDH999-N86-2015', s1 : 25.93, s2 :0
        },
        {
            product: 'Supervisión técnica, administrativa y de control de calidad para<br> los trabajos de construcción de los caminos provisionales<br> de acceso al Nuevo Aeropuerto Intenacional de la<br> Ciudad de México (NAICM) ejecutanto trabajos de terraceria,<br> estructuras y obras de drenaje, pavimentación y señalamiento.',
            id : 'LO-009KDH999-N87-2015', s1 : 12.27, s2 :0
        },
        {
            product: 'Supervisión del proyecto ejecutivo, construcción, equipamiento, <br>mobiliario e instalaciones complementarias para el campamento del <br>Grupo Aeroportuario de la Ciudad de México en el sitio del<br> Nuevo Aeropuerto Internacional de la Ciudad de México.',
            id : 'AO-009KDH999-E26-2016', s1 : 18, s2 :0
        },
        {
            product: 'Supervisión de la construcción del drenaje pluvial temporal del <br>Nuevo Aeropuerto Intenacional de la Ciudad de México.',
            id : 'AO-009KDH999-E20-2016', s1 : 40, s2 :0
        }
    ];
    

/*
    //SORT JQPLOT BAR CHART SERIES
    function sortbyserie(serie, data ) {

        var s1 = [ ];
        var s2 = [ ];
        var ticks = [ ];

        if ( serie == "s1") {
            bardata.sort(function (a, b) {

                if (a.s1 < b.s1) {
                    return -1
                }
                if (a.s1 > b.s1) {
                    return 1
                }
                return 0;
            });

        } else {
            bardata.sort(function (a,b) {

                if  (a.s2 < b.s2) { return -1}
                if  (a.s2 > b.s2) { return 1}
                return 0;
            });

        }

        for ( var i =0; i< data.length;i++){
            s1.push(data[i].s1);
            s2.push(data[i].s2);
            ticks.push(data[i].product);

        }

        return [ s1 , s2 , ticks ];

    }

    var barinfo = sortbyserie('s1',bardata);

    plot2 = $.jqplot('chart2', [barinfo[0], barinfo[1]], {
        title: "Avances al de de 2016",
        seriesColors: ['#00cc99', '#673AB7'],//'#ff4d4d'],
        series : [{label: 'Avance físico'},{label: 'Avance financiero'}],
        seriesDefaults: {
            shadow: false,
            renderer:$.jqplot.BarRenderer,
            pointLabels: {
                show: false //bar value
            }
        },
        axes: {
            xaxis: {
                renderer: $.jqplot.CategoryAxisRenderer,
                tickRenderer: $.jqplot.CanvasAxisTickRenderer,
                labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
                label: 'Contratos',
                //tickOptions:{
                 //show: false,
                 //textColor: 'white'
                 //},

                // rendererOptions: {
                //drawBaseline: false
                 //}
                drawMajorGridlines: false,
                //ticks: ticks
            },
            yaxis:{
                //drawMajorGridlines: false,
                label: "Porcentaje de avance (%)",
                labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
                min: 0,
                max: 100
            }
        },
        legend: {
            renderer: $.jqplot.EnhancedLegendRenderer,
            show: true,
            rendererOptions: {
                numberRows: 1
            },
            location: 's',
            placement: 'outsideGrid'
        },
        grid: {
            drawBorder: false,
            drawGridLines: true,        // wether to draw lines across the grid or not.
            shadow: false,
            backgroundColor: 'white'//'rgb(255, 255, 255)'
        },
        highlighter: {
            show: true,
            sizeAdjust: 0.5,
            showAxesFormatters: false,
            //useAxesFormatters: false,
            //dataLabels: 'value',
            //tooltipFormatString: '%s'
            tooltipContentEditor: function(current, serie, index, plot ){
                return "<div class='col-sm-2'><p>Contrato: <br><b>"+barinfo[2][index] +"</b></p>"+
                    "<p>Avance "+(serie==0?'fisico':'financiero')+":<br> <b>"+ parseInt(plot.data[serie][index])+ "%</b></p></div>";
            }
        }
    });

    // JQPLOT BAR CHART SORT EVENTS
    $('#sort1, #sort2').click(function () {

        barinfo = sortbyserie( $(this).data('serie'),bardata);

        var s1 =[];
        var s2 =[];

        for (var i=0; i< barinfo[0].length;i++){
            s1.push([i, barinfo[0][i]]);
            s2.push([i, barinfo[1][i]]);
        }
        plot2.series[0].data  = s1;
        plot2.series[1].data  = s2;
        plot2.replot();
    });
*/
    // FIND CONTRACTS
    function searchbykeyword ( keyword, table ){
        $.post('/contrataciones-abiertas/find-contracts', { keyword: keyword }, function (contracts) {
            table.html(contracts);
        });
    }

    //FIND CONTRACTS EVENT
    var ctable = $('#ctable');
    $('#buscar').keyup(function () {
        searchbykeyword($(this).val(), ctable);
    });

});


// BUBBLE CHART (GCHART)
google.charts.load('current', {'packages':['corechart'], 'language':'es'});
google.charts.setOnLoadCallback(drawSeriesChart);

function drawSeriesChart() {

    var data = google.visualization.arrayToDataTable([
        ['ID',                      'Fecha de firma',                    'Vigencia (meses)', 'Tipo',             'Monto MXN'],
        ['LO-009KDH999-N5-2014',     new Date('2015-01-02'),              6,      'Licitación',              39724276.56],
        ['SO-009KDH999-N24-2015',    new Date('2015-02-19'),              1,      'Adjudicación directa',   521999.84],
        ['SO-009KDH999-N23-2015',    new Date('2015-02-20'),               1,      'Adjudicación directa',   638000],
        ['SO-009KDH999-N26-2015',    new Date('2015-02-19'),              1,      'Adjudicación directa',   539400],
        ['IO-009KDH999-N11-2015',    new Date('2015-03-19'),              2,         'Invitación a 3',         9429941.46],
        ['IO-009KDH999-N10-2015',    new Date('2015-03-20'),              6,       'Invitación a 3',         2501985.67],
        ['LO-099KDH999-N20-2015',    new Date('2015-05-14'),              1,      'Licitación',             5844840.96],
        ['LO-099KDH999-T15-2015',    new Date('2015-05-29'),              3,      'Licitación',             13514000],
        ['LO-009KDH999-N46-2015',    new Date('2015-07-21'),              18,      'Licitación',            16684244.272],
        ['LO-009KDH999-N42-2015',    new Date('2015-07-21'),              18,      'Licitación',             13832891.6792],
        ['LO-009KDH999-N45-2015',    new Date('2015-07-21'),              18,      'Licitación',             21963669.4016],
        ['IO-009KDH999-N41-2015',    new Date('2015-07-29'),              2,      'Invitación a 3',         38949488.17],
        ['IO-009KDH999-N54-2015',    new Date('2015-08-28'),              3.5,      'Invitación a 3',         3812525.54],
        ['LO-009KDH999-N47-2015',    new Date('2015-09-10'),              7,      'Licitación',             129973731.2],
        ['LO-009KDH999-N50-2015',    new Date('2015-10-09'),              4,      'Licitación',             223329692.62],
        ['LO-009KDH999-T52-2015',    new Date('2015-10-23'),              48,      'Licitación',             158629469.03],
        ['LO-009KDH999-N79-2015',    new Date('2015-12-14'),              12,      'Licitación',             2044851759.9544],
        ['LO-009KDH999-N80-2015',    new Date('2015-12-31'),              13,      'Licitación',             705599669.9],
        ['LO-009KDH999-N78-2015',    new Date('2015-12-31'),              9,      'Licitación',             572943111],
        ['LO-009KDH999-N86-2015',    new Date('2015-12-31'),              12,      'Licitación',             11276263.6272],
        ['LO-009KDH999-N87-2015',    new Date('2015-12-31'),              12,      'Licitación',             13970275.444],
        ['AO-009KDH999-E26-2016',    new Date('2016-01-14'),              6,      'Adjudicación directa',   4286458.44],
        ['AO-009KDH999-E20-2016',    new Date('2016-01-21'),              6,      'Adjudicación directa',   8909803.13],
        ['IO-009KDH999-E15-2016',    new Date('2016-03-10'),              3,      'Invitación a 3',         12715541.31],
        ['IO-009KDH999-E96-2015',    new Date('2016-03-23'),              8,      'Invitación a 3',         91640000]
    ]);

    var options = {
        //'legend': 'left',
        //title: 'Contrataciones en el tiempo',
        chartArea:{
            width: '75%',
            heigth: '90%',
            left: '75',
            right: '10',
            top: '30'
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
            title: 'Vigencia en meses',
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
            }},
        series: {

            'Licitación': {
                color: '#00cc99',
                //fontName: 'Open Sans'
            },
            'Invitación a 3': {color: '#ff4d4d'},
            'Adjudicación directa': {color: '#673AB7'}

        },
        legend: {
            position: 'bottom',
            textStyle : {
                fontName: 'Open Sans'
            }
        }
    };

    var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
    chart.draw(data, options);
}

function createCustomHTMLContent(flagURL, totalGold, totalSilver, totalBronze) {

}