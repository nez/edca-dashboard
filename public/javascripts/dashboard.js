// DONUT CHART
$(document).ready(function () {

    $.get('/contratacionesabiertas/donut-chart-data', function (data) {

        var newData = [];

        for (var i = 0; i < data.length; i++) {
            newData.push([data[i].procurementmethod, Number(data [i].count)]);
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
                    '#673AB7',
                    '#ff4d4d',
                    '#00cc99',
                    'yellow'
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
                    return "<div class='col-sm-2'><p style='color: black'><b>" + newData[index][0] + ": " + newData[index][1] + "</b></p></div>";
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

    //FIND CONTRACTS EVENT
    var ob = $('#orderby');
    var ctable = $('#ctable');
    var buscar = $('#buscar');
    var filter = $('#filtrar');

    buscar.keyup(function () {
        searchbykeyword($(this).val(), ctable, ob.val(), filter.val());
    });


    filter.change(function () {
        searchbykeyword(buscar.val(), ctable, ob.val(), filter.val());
    });

    ob.change(function () {
        searchbykeyword(buscar.val(), ctable, ob.val(), filter.val());
    });


});


// BUBBLE CHART (GCHART)
google.charts.load('current', {'packages': ['corechart'], 'language': 'es'});
google.charts.setOnLoadCallback(drawSeriesChart);

function drawSeriesChart() {

    $.get('/contratacionesabiertas/bubble-chart-data', function (data) {

        var newData = [['ID', 'Fecha de firma', 'Vigencia (días naturales)', 'Tipo', 'Monto MXN']];

        for (i = 0; i < data.length; i++) {
            newData.push([ data[i].title , new Date(data[i].datesigned), Math.abs(data[i].vigencia.days), data[i].procurementmethod, Number(data[i].value_amount)]);
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

                'Licitación pública': {color: '#00cc99'},
                'Invitación a cuando menos tres personas': {color: '#ff4d4d'},
                'Adjudicación directa': {color: '#673AB7'},
                'Convenio de colaboración': {color: 'yellow'}

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

// BAR CHART
/*
var margin = {top: 40, right: 20, bottom: 40, left: 70},
    width = 1100 - margin.left - margin.right,
    height = 350 - margin.top - margin.bottom;

var x0 = d3.scale.ordinal()
    .rangeRoundBands([0, width], .1);

var x1 = d3.scale.ordinal();

var y = d3.scale.linear()
    .range([height, 0]);

var color = d3.scale.ordinal()
    .range(['#00cc99', '#673AB7']);//, "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

var xAxis = d3.svg.axis()
    .scale(x0)
    .orient("bottom")
    .tickValues({})
    .tickSize(0);


var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left")
    .tickFormat(d3.format(".0%"));
//.tickFormat(d3.format(".2s"));

var tip = d3.tip()
    .attr('class', 'd3-tip')
    .offset([-10, 0])
    .html(function (d) {
        return "<p>Contrato</p><strong>" + d.product + "</strong><br><br><p>" + d.name + "</p> <strong>" + d3.format(".0%")(d.value) + "</strong>";
    });

var svg = d3.select("#d3bar").append("svg")
    .attr("preserveAspectRatio", "xMinYMin meet")
    .attr("viewBox", "0 0 1100 350")
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

svg.call(tip);


d3.csv("/data.csv", function (error, data) {
    if (error) throw error;

    var ageNames = d3.keys(data[0]).filter(function (key) {
        return key !== "Producto";
    });

    // SORT!!!
    data.sort(function (a, b) {
        return d3['descending'](a['Avance físico'], b['Avance físico']);
    });

    data.forEach(function (d) {
        d.ages = ageNames.map(function (name) {
            return {name: name, value: +d[name], product: d['Producto']};
        });
    });

    x0.domain(data.map(function (d) {
        return d.Producto;
    }));
    x1.domain(ageNames).rangeRoundBands([0, x0.rangeBand()]);
    y.domain([0, 1]);//d3.max(data, function(d) { return d3.max(d.ages, function(d) { return d.value; }); })]);

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis)
        .append("text")
        .style("text-anchor", "middle")
        .attr("y", 30)
        .attr("x", width / 2)
        .text("Contratos");

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)
        .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 0 - margin.left)
        .attr("x", 0 - (height / 2))
        .attr("dy", "1em")
        .style("text-anchor", "middle")
        .text("Avance");

    // grid
    function make_x_axis() {
        return d3.svg.axis()
            .scale(x0)
            .orient("bottom")
            .ticks(5)
    }

    function make_y_axis() {
        return d3.svg.axis()
            .scale(y)
            .orient("left")
            .ticks(5)
    }

    svg.append("g")
        .attr("class", "grid")
        .call(make_y_axis()
            .tickSize(-width, 0, 0)
            .tickFormat("")
        );

    //end grid code
    var producto = svg.selectAll(".producto")
        .data(data)
        .enter().append("g")
        .attr("class", "producto")
        .attr("transform", function (d) {
            return "translate(" + x0(d.Producto) + ",0)";
        });


    producto.selectAll("rect")
        .data(function (d) {
            return d.ages;
        })
        .enter().append("rect")
        .attr("width", x1.rangeBand())
        .attr("x", function (d) {
            return x1(d.name);
        })
        .attr("y", function (d) {
            return y(d.value);
        })
        .attr("height", function (d) {
            return height - y(d.value);
        })
        .style("fill", function (d) {
            return color(d.name);
        })
        .text(function (d) {
            return d.Producto;
        })
        //.on('mouseover', tip.show)
        //.on('mouseout', tip.hide)
        .on("mouseover", function (d) {
            tip.show(d);
            d3.select(this).style({opacity: '0.7'});
        })
        .on("mouseout", function (d) {
            tip.hide(d);
            d3.select(this).style({opacity: '1.0'});
        });


    svg.append("text")
        .attr("x", (width / 2))
        .attr("y", 0 - (margin.top / 2))
        .attr("text-anchor", "middle")
        .style("font-size", "16px")
        //.style("text-decoration", "underline")
        .text("Avances al 7 de julio de 2016");

    var legend = svg.selectAll(".legend")
        .data(ageNames.slice().reverse())
        .enter().append("g")
        .attr("class", "legend")
        //.attr("transform","translate(50,30)")
        .attr("transform", function (d, i) {
            return "translate(0," + i * 20 + ")";
        });

    legend.append("rect")
        .attr("x", width - 18)
        .attr("width", 18)
        .attr("height", 18)
        .style("fill", color);

    legend.append("text")
        .attr("x", width - 24)
        .attr("y", 9)
        .attr("dy", ".35em")
        .style("text-anchor", "end")
        .text(function (d) {
            return d;
        });

});*/