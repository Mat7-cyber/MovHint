import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!
// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    userMarker: Object,
    user: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/navigation-night-v1",
      center: [3.066667, 50.633333],
      zoom: 10
    })

    this.#addMarkerToMap()
    this.#fitMapToMarkers()
  }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.userMarkerValue.lng, this.userMarkerValue.lat ])
    console.log(bounds)
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #addMarkerToMap() {
    new mapboxgl.Marker()
    .setLngLat([this.userMarkerValue.lng, this.userMarkerValue.lat])
    .addTo(this.map)
  }
}
