var width    = 1200;
var height   = 450;
var maxLabel = 150;
var duration = 500;
var radius   = 3;

// Set the dimensions of the canvas / graph
var margin = {top: 30, right: 20, bottom: 30, left: 50},
    width = 1500 - margin.left - margin.right,
    height = 670 - margin.top - margin.bottom;

var data = [];
for (var i = 0; i < 3000; i++) {
    data[i] = Math.random();
}

var svgContainer = d3.select("#small-balls").append("svg")
      .attr("width",  2000)
      .attr("height", 300);

var col_col = function(){
    var circ = d3.select(this);
    var  c_class  = circ.attr('class');
    var x = circ.attr('x');
    var y = circ.attr('y');
    // Agregamos distorsión.
    var sig_x = Math.pow(-1, Math.floor(Math.random() * 10) % 2);
    var sig_y = Math.pow(-1, Math.floor(Math.random() * 10) % 2);
    var new_x = +x + +Math.random()*50*sig_x;
    var new_y = +y + +Math.random()*50*sig_y;
    circ.attr('x',new_x)
        .attr('y',new_y);
    if(c_class == 'circle'){
        circ.attr('fill', scale_c_2)
            .attr('class','circ_b');
    }else if(c_class == 'circ_b'){
        circ.attr('fill', scale_c_3)
            .attr('class','circ_r');
    }else if(c_class == 'circ_r'){
        circ.attr('fill', scale_c_4)
            .attr('class','circ_g');
    }else if(c_class == 'circ_g'){
        circ.attr('fill', scale_c_5)
            .attr('class','circ_p');
    }else if(c_class == 'circ_p'){
        circ.attr('fill', scale_c_1)
            .attr('class','circle');
    }
};
// Elaboramos escalas para los distintos atributos
// de los circángulos.
var scale_h = d3.scale.linear()
    .domain([0, d3.max(data)])
      .range([margin.top, window.innerHeight - margin.bottom]);

var scale_w = d3.scale.linear()
    .domain([0, 2000])
      .range([margin.left, window.innerWidth - margin.right]);

var scale_s = d3.scale.linear()
    .domain([0, d3.max(data)])
      .range([0, 20]);

var scale_c_1 = d3.scale.linear()
    .domain([0,d3.max(data)])
      .range(['#E0E0E0','#E0E0E0']);

var scale_c_2 = d3.scale.linear()
    .domain([0,d3.max(data)])
      .range(['#00cc99','#00cc99']);

var scale_c_3 = d3.scale.linear()
    .domain([0,d3.max(data)])
      .range(['#FF6666','#FF6666']);

var scale_c_4 = d3.scale.linear()
    .domain([0,d3.max(data)])
      .range(['#E0E0E0','#E0E0E0']);

var scale_c_5 = d3.scale.linear()
    .domain([0,d3.max(data)])
      .range(['#00cc99','#00cc99']);


// Generamos cuadrados
var rects = svgContainer.selectAll("rect")
    .data(data)
    .enter()
    .append("rect")
    .attr({
        rx: scale_s,

        ry: scale_s,

        x: function(d, i) {
          return scale_w(i * 2);
        },
        y: function(d, i) {
          return scale_h(Math.random());
        },
        width: scale_s,
        height: scale_s,
        fill: scale_c_1,
        class: 'circle'
    })
      .on('mouseover', col_col);
