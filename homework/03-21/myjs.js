function main(){
    var svg  = d3.select("svg"),
    margin = 200,
    width = svg.attr("width") - margin,
    height = svg.attr("height") - margin;

    var xScale = d3.scaleBand().range([0,width]).padding(0.4),
        yScale = d3.scaleLinear().range([height,0]);

    var g = svg.append("g").attr("transform","translate("+100+","+100+")");
    d3.csv("HW6.csv").then(function(data){
        xScale.domain(data.map(function(d){return d.Country;}));
        yScale.domain([0,d3.max(data, function(d){return d.Population;})]);

        g.append("g").attr('transform','translate(0,'+height+'0)')
            .call(d3.axisBottom(xScale))

        g.append("g").call(d3.axisLeft(yScale).tickFormat(function(d){
                return "thousands" + d
        }).ticks(10));
        
        g.selectAll(".bar")
            .data(data)
            .enter().append("rect")
            .attr("class","bar")
            .attr("x",function(d){return xScale(d.Country);})
            .attr("y",function(d){return yScale(d.Population)})
            .attr("width", xScale.bandwidth())
            .attr("height", function(d){return height-yScale(d.value);});
    });    
}