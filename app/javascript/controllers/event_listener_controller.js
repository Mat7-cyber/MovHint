import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-listener"
export default class extends Controller {

  connect() {
  }

  enable() {
    const notLiked = 'Add to my favorites: <i class="fa-solid fa-plus"></i>'
    const liked = '<i class="fa-solid fa-thumbs-up"></i>'
    
    if( this.element.classList.contains("button-liked")) {
      this.element.innerHTML = notLiked
      
    } else {
      this.element.innerHTML = liked
    }
    
    this.element.classList.toggle("button-liked");
  }
}
