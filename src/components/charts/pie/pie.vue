<template>
  <div class="container">
    <div id="pie">
      <span class='reset' style='visibility: hidden;'>
          Current filter: <span class='filter'></span>
        </span>
    </div>
  </div>
</template>

<script>
  import * as dc from 'dc'
  import * as d3 from 'd3'
  import * as crossfilter from 'crossfilter'
  import morley from "./morley.csv"

    export default {
      name: "pie",
      data(){
        return {
        }
      },
      methods:{
        loadedData(){
          var chart = dc.pieChart("#pie")
          d3.csv(morley).then(function(experiments){
            var ndx = crossfilter(experiments)
            var runDimension = ndx.dimension(function(d) {
              return "run-"+d.Run
            })
            var speedSumGroup = runDimension.group().reduceSum(function(d) {
              return d.Speed * d.Run
            })
            chart
              .width(768)
              .height(480)
              .slicesCap(5)
              .innerRadius(100)
              .dimension(runDimension)
              .group(speedSumGroup)
              .legend(dc.legend())
              // workaround for #703: not enough data is accessible through .label() to display percentages
              .on('pretransition', function(chart) {
                chart.selectAll('text.pie-slice').text(function(d) {
                  return d.data.key + ' ' + dc.utils.printSingleValue((d.endAngle - d.startAngle) / (2*Math.PI) * 100) + '%'
                })
              })
            chart.render()
          })
        }
      },
      mounted:function (){
          this.$nextTick(function () {
            this.loadedData()
          })
        }
    }
</script>

<style scoped>

</style>
