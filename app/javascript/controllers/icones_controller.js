import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="icones"
export default class extends Controller {
  connect() {
    console.log("coucou")

   const homeview = document.getElementsByClassName("navbar-btn-home")
   const home = document.getElementsByClassName("navbar-btn-home d-none")
   const dashboards = document.getElementsByClassName("navbar-btn-profile d-none")
   const homes = document.getElementsByClassName("navbar-btn-profile")
  }



}
