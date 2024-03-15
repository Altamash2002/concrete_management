import { Controller } from "@hotwired/stimulus";
// import Chart from 'chart.js/auto';

export default class DoughnutController extends Controller {
    connect() {
        console.log('Connected to doughnut controller');
        this.render();
    }
    render(){    
      const labels = ['grey','red', 'green']
    
      const config3 = {
        type: 'doughnut',
        data: JSON.parse(this.element.dataset.bardata),
        options: {
          responsive: true,
          plugins: {
            legend: {
              display: true,
              position: 'bottom'
            },
          },
          onClick: (evt, item) => {
            const activeIndex = item[0].index;
            window.location.href = `/zone/${labels[activeIndex]}`;
            console.log(activeIndex)
          }
        },
      };
    
      const ctx3 = this.element;
      new Chart(ctx3, config3);
    }

    
}