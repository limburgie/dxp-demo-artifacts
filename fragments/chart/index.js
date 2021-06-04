document.body.appendChild(Object.assign(document.createElement('script'), {
  type: 'text/javascript',
  src: 'https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js',
  onload: () => this.onScriptLoaded()
}));

var ctx = fragmentElement.getElementsByTagName('canvas')[0];
ctx.width = fragmentElement.offsetWidth;
ctx.height = configuration.height;
var myChart = new Chart(ctx, {
    type: configuration.type,
    data: {
        labels: configuration.labels.split(","),
        datasets: [{
            data: configuration.values.split(","),
            backgroundColor: [
							configuration.color1.rgbValue,
							configuration.color2.rgbValue,
							configuration.color3.rgbValue,
							configuration.color4.rgbValue,
							configuration.color5.rgbValue,
							configuration.color6.rgbValue
						]
        }]
    },
    options: {
				legend: {
					display: false
				},
        scales: {
        xAxes: [{
						ticks: {
							display: false
						},
            gridLines: {
                display:false
            }
        }],
        yAxes: [{
						ticks: {
							display: false,
							beginAtZero: true
						},
            gridLines: {
                display:false
            }   
        }]
    }
    },
		
});