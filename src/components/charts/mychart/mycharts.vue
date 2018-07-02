<template>
    <div>
      <h2>Airline on-time performance</h2>

      <div id="hour-chart">
        <div class="title">Time of Day
          <a class="reset" href="javascript:;" style="visibility: hidden;">reset</a>
        </div>
      </div>

      <div id="delay-chart">
        <div class="title">Arrival Delay (min.)
          <a class="reset" href="javascript:;" style="visibility: hidden;">reset</a>
        </div>
      </div>

      <div id="distance-chart">
        <div class="title">Distance (mi.)
          <a class="reset" href="javascript:;" style="visibility: hidden;">reset</a>
        </div>
      </div>

      <div style="clear: both;"></div>

      <div id="date-chart">
        <div class="title">Date
          <a class="reset" href="javascript:dateChart.filterAll();dc.redrawAll();" style="visibility: hidden;">reset</a>
        </div>
      </div>

      <div style="clear: both;"></div>

      <div id="flight-table" style="float: left;">
        <table></table>
      </div>

      <div id="data-count" style="float: left; margin: 30px;"></div>

      <div id="flights-csv" style="display: none;">
      </div>

    </div>
</template>

<script>

  import * as dc from 'dc'
  import * as d3 from 'd3'
  import * as crossfilter from 'crossfilter'
  import data from './data.csv'
  import moment from "moment"

    export default {
      name: "",
      mounted() {
        this.$nextTick( () => {
          this.loaddata()
        } )
      },
      methods: {
        loaddata() {
          d3.csv(data).then( (flights) => {

            flights.forEach( (d) => {
              d.date = moment('2001' + d.date, 'YYYYMMDDHHmm').toDate()
              d.delay = +d.delay
              d.distance = +d.distance
            })

            let flight = crossfilter(flights)
            let hour = flight.dimension((d) => d.date.getHours() + d.date.getMinutes() / 60)
            let hours = hour.group(Math.floor)
            let delay = flight.dimension((d) => Math.max(-60, Math.min(149, d.delay)) / 10)
            let delays = delay.group(Math.floor)
            let distance = flight.dimension((d) => Math.min(1999, d.distance) / 50)
            let distances = distance.group(Math.floor)
            let date = flight.dimension((d) => d.date)
            let dates = date.group(d3.timeDay)

            let hourChart = dc.barChart('#hour-chart')
            hourChart.width(350)
              .height(150)
              .dimension(hour)
              .group(hours)
              .x(d3.scaleLinear()
                .domain([0, 23])
                .rangeRound([0, 10 * 24]))
              .controlsUseVisibility(true)
            hourChart.yAxis().tickFormat(d3.format('s'))

            let delayChart = dc.barChart('#delay-chart')
            delayChart
              .width(350)
              .height(150)
              .dimension(delay)
              .group(delays)
              .x(d3.scaleLinear()
                .domain([-6, 15])
                .rangeRound([0, 10 * 21]))
              .controlsUseVisibility(true)
            delayChart.xAxis().tickFormat((d) => d * 10)
            delayChart.yAxis().tickFormat(d3.format('s'))

            let distanceChart = dc.barChart('#distance-chart')
            distanceChart
              .width(450)
              .height(150)
              .dimension(distance)
              .group(distances)
              .x(d3.scaleLinear()
                .domain([0, 2000 / 50])
                .rangeRound(0, 10 * 40))
              .controlsUseVisibility(true)
            distanceChart.xAxis().tickFormat((d) => d * 50)
            distanceChart.yAxis().tickFormat(d3.format('s'))

            let dateChart = dc.barChart('#date-chart')
            dateChart
              .width(1150)
              .height(180)
              .dimension(date)
              .group(dates)
              .x(d3.scaleTime()
                .domain([new Date(2001, 0, 1), new Date(2001, 3, 1)])
                .rangeRound([0, 10 * 90]))
              .round(d3.timeDay.round)
              .xUnits(d3.timeDays)
              .controlsUseVisibility(true)
            dateChart.margins().left = 50

            let flightTable = dc.dataTable('#flight-table table')
              .dimension(date)
              .group((d) => moment(d.date).format('MMMM D, YYYY'))
              .size(20)
              .columns([
                {
                  label: 'Time',
                  format(d) {
                    let time = moment(d.date).format('HH:mm A')
                    return `<font color="gray">${time}</font>`
                  }
                },
                'origin',
                'destination',
                {
                  label: 'Distance',
                  format(d) {
                    return d.distance + ' mi.'
                  }
                },
                {
                  label: 'Delay',
                  format(d) {
                    if (d.delay < 0) {
                      return `<font color="green">${d.delay} min.</font>`
                    } else {
                      return `+${d.delay} min.`
                    }
                  }
                }
              ])
              .sortBy((d) => d.date)
              .order(d3.descending)

            let flightCount = dc.dataCount('#data-count')
              .dimension(flight)
              .group(flight.groupAll())
              .html({
                some: '%filter-count of %total-count flights selected. | <a href="javascript:dc.filterAll(); dc.redrawAll();">Reset All</a>',
                all: 'all %total-count flights select.'
              })

            dc.renderAll()

            _.forEach(['hour', 'delay', 'distance'], name => {
              document.querySelector(`#${name}-chart .reset`).addEventListener('click', () => {
                eval(`${name}Chart`).filterAll()
                dc.redrawAll()
              })
            })
          })
        }
      }
    }
</script>

<style scoped>
  #flight-table table {
    border-collapse: collapse;
  }

  #flight-table table .dc-table-head {
    display: none;
  }

  #flight-table table .dc-table-label {
    padding: 5px;
  }

  #flight-table table .dc-table-row {
    background-color: #eee;
    border-bottom: 2px solid white;
  }

  #flight-table table .dc-table-column {
    width: 100px;
    padding: 5px;
  }

  #flight-table table .dc-table-column._3 {
    text-align: right;
  }

  #flight-table table .dc-table-column._4 {
    text-align: right;
  }
</style>
