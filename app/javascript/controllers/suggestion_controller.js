import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="suggestion"
export default class extends Controller {
  static targets = ["carousel", "card"];

  connect() {
  }




  showCarousel(e) {
    e.preventDefault()
    // Afficher le carousel au clic
    this.cardTarget.classList.add('d-none');
    this.carouselTarget.classList.remove('d-none');
  }
}

// def qui appele ia
// suggest()
// def qui appele l api
// find_movie_id(title)
