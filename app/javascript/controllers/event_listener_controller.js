import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-listener"
export default class extends Controller {

  connect() {
  }

  enable() {
    this.element.innerHTML = 'Added to the favorites! <i class="fa-solid fa-thumbs-up"></i>';
    this.element.classList.toggle("button-js");
  }
}
