import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="stars"
export default class extends Controller {
  static targets = ["rating-number", "fa-star"];

  static values = {
    count: Number
  }

  connect() {
    this.display_stars()
  }

  display_stars() {
    const count = Math.round(this.countValue)
    const starsContainer = this.element
    const starsFull = '<i class="fa-solid fa-star active"></i>'
    const starsEmpty = '<i class="fa-solid fa-star"></i>'

    for (let index = 0; index < 10; index++) {

      setInterval(add_star(index), 100000)
    }
    function add_star(index) {
      if (index < count) {
        starsContainer.insertAdjacentHTML("beforeend", starsFull)
      } else {
        starsContainer.insertAdjacentHTML("beforeend", starsEmpty)
      }
    }
  }
}
