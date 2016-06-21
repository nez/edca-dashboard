var width    = 1200;
var height   = 450;
var maxLabel = 150;
var duration = 500;
var radius   = 3;

// Set the dimensions of the canvas / graph
var margin = {top: 30, right: 20, bottom: 30, left: 50},
    width = 1200 - margin.left - margin.right,
    height = 260 - margin.top - margin.bottom;

var data = [];
for (var i = 0; i < 100; i++) {
  data[i]  = {'height':(height - Math.random()*height % height), 'x': i};
}

var svgContainer = d3.select("#bars").append("svg")
      .attr("width",  width)
      .attr("height", 200);


// Generamos cuadrados
var rects = svgContainer.selectAll("rect")
      .data(data)
      .enter()
      .append("rect");

var rectsAttributes = rects
      .attr("x", function (d,i) { return d.x*(width/data.length); })
      .attr("y", "0")
      .attr("height", function (d,i) { return d.height; })
      .attr("width", "5")
      .attr("class", "rect")
      .style("fill", "#E0E0E0")
      .on('mouseover', function(d){
        d3.select(this).style('fill','#00cc99');
        d3.select(this).style('width','8');
      })
      .on('mouseout', function(d){
        d3.select(this).style('fill','#E0E0E0');
        d3.select(this).style('width','5');
      });
