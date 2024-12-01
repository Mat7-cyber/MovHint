import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-text"
export default class extends Controller {

static targets = ["text"]

  connect() { 
    this.reveal()
    const observer = new IntersectionObserver((entries)=>{
      console.log(entries)
    for (const entry of entries) {
      if (entry.isIntersecting) {
        this.reveal()
        observer.unobserve(entry.target)
      }
    }
  },{
    threshold: 1,
    rootMargin: "0px 0px -50px 0px"
  })
  window.onload = () => {
    observer.observe(this.textTarget)
  }
  }

  reveal() {
    this.textTarget.classList.add("tagline")
  }
}
