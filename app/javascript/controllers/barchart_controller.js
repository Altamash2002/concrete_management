import { Controller } from "@hotwired/stimulus";
// import Chart from 'chart.js/auto';

export default class BarchartController extends Controller {
    connect() {
        console.log('Connected to bar chart controller');
        this.render();
    }
    render(){    
        // config
        const config = {
          type: 'bar',
          data: JSON.parse(this.element.dataset.bardata),
          options: {
            plugins: {
              datalabels: {
                display: true,
                anchor: 'end',
                align: 'top',
                color: 'red',
                font: {
                  weight: 'bold'
                }
              },
              annotation: !this.element.dataset.annotation ? {} : JSON.parse(this.element.dataset.annotation),
            },
            scales: {
              x: {
                grid: {
                  display: false // Remove vertical grid lines
                },
                title: {
                    display: true,
                    text: this.element.dataset.xtitle,
                    font: {
                      weight: 'bold',
                      size: '16px'
                    }
                  }
              },
              y: {
                grid: {
                  drawBorder: false, // Remove vertical grid lines
                  display: false // Remove horizontal grid lines
                },
                // beginAtZero: true,
                // max: 50,
                // stepSize: 10,
                
                title: {
                  display: true,
                  text: this.element.dataset.ytitle,
                  font: {
                    weight: 'bold',
                    size: '16px'
                  }
                }
              }
            }
          }
        };

        Chart.register(ChartDataLabels); // Register the plugin
    
        // Render chart
        const ctx = this.element;
        new Chart(ctx, config);
    }

    
}