function searchbykeyword ( keyword, table ){
    $.post('/contrataciones-abiertas/find-contracts', { keyword: keyword }, function (contracts) {
        table.html(contracts);
    });
}

var ctable = $('#ctable');

$('#buscar').keyup(function () {
    searchbykeyword($(this).val(), ctable);
});


//donut chart
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

    //bar chart
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
                /* tickOptions:{
                 show: false,
                 //textColor: 'white'
                 },*/
                /*
                 rendererOptions: {
                 drawBaseline: false
                 }*/
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
    })

});