import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="stars"
export default class extends Controller {
  static targets = ["ratingNumber"];

  static values = {
    count: Number
  }

  connect() {
    const observer = new IntersectionObserver((entries)=>{
      for (const entry of entries) {
        if (entry.isIntersecting) {
          this.display_stars()
          observer.unobserve(entry.target)
        }
      }
    },{
      threshold: 1,
      rootMargin: "0px 0px -50px 0px"
    })
    document.addEventListener("DOMContentLoaded",
      observer.observe(this.ratingNumberTarget)
    )
  }

  display_stars() {
    const count = Math.round(this.countValue)
    const starsContainer = this.element
    const starsFull = '<i class="fa-solid fa-star active"></i>'
    const starsEmpty = '<i class="fa-solid fa-star"></i>'

    let index = 0
    const addStars = setInterval(() => {
      if (index < count) {
        starsContainer.insertAdjacentHTML("beforeend",starsFull)
      } else if (index < 10) {
        starsContainer.insertAdjacentHTML("beforeend",starsEmpty)
      } else {
        clearInterval(addStars)
      }
      index++
    }, 175);
  }
}
