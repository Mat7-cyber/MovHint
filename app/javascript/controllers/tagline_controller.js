import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tagline"
export default class extends Controller {
  static targets = ["tagline"];

  connect() {
    console.log("Hello");
  }

  reveal() {
  }
}
