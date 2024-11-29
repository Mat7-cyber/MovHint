import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="avatar"
export default class extends Controller {
  static targets = ["input","form"]

  connect() {
    console.log("coucou")
    console.log(this.inputTarget)
    console.log(this.formTarget)
  }


  changeavatar(){
    this.inputTarget.click()
  }

  upload(){
    this.formTarget.submit()
  }
}
