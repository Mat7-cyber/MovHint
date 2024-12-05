import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!
// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    userMarker: Object,
    user: Object,
    pickups: Array,

  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/navigation-night-v1",
      center: [3.046526, 50.635532],
      zoom: 12
    })
    console.log(this.pickupsValue)
    this.#addMarkerToMap()
    // this.#fitMapToMarkers()
    this.#addPickupMarkers()
  }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.userMarkerValue.lng, this.userMarkerValue.lat ])
    console.log(bounds)
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #addMarkerToMap() {
    new mapboxgl.Marker({color: "#FF204E"})
    .setLngLat([this.userMarkerValue.lng, this.userMarkerValue.lat])
    .addTo(this.map)
  }

  #addPickupMarkers() {
    this.pickupsValue.forEach((pickup) => {
      const nameAddress = pickup.name + ' -- ' + pickup.address
      const popup = new mapboxgl.Popup().setHTML(nameAddress)

      new mapboxgl.Marker()
        .setLngLat([pickup.longitude, pickup.latitude])
        .setPopup(popup)
        .addTo(this.map)
    })
  }



}
