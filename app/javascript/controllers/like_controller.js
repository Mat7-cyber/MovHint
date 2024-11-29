import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like"
export default class extends Controller {
  static targets = ["heartpref"]

  connect() {
    console.log("coucou")
  }
  likeintodislike() {

console.log("coucou")
this.heartprefTarget.remove()

  }

}
