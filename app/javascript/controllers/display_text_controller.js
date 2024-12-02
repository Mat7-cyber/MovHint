import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-text"
export default class extends Controller {

static targets = ["text"]
static values = {
  text: String
}

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
    rootMargin: "0px 0px -10% 0px"
  })
  window.onload = () => {
    observer.observe(this.textTarget)
  }
  }

  reveal() {
    this.textTarget.innerHTML= `<em><i class="fa-solid fa-quote-left"></i> ${this.textValue} <i class="fa-solid fa-quote-left fa-mirror"></i></em>`
    this.textTarget.classList.add("tagline")
  }
}
