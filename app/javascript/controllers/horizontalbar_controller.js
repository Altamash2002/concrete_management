import { Controller } from "@hotwired/stimulus";

export default class HorizontalbarController extends Controller {
  connect() {
    console.log('Connected to horizontal bar chart controller');
    this.render();
  }

  render() {
    const config = {
      type: 'bar',
      data: JSON.parse(this.element.dataset.bardata),
      options: {
        responsive: true,
        indexAxis: 'y',
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    };

    // Render chart
    const ctx = this.element.getContext('2d');
    new Chart(ctx, config);
  }
}
