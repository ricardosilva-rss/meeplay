import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address", 'latt', 'longt']

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address",
      placeholder: 'search for location'
    });
    this.geocoder.addTo(this.element)

    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

  #setInputValue(event) {
    this.lattTarget.value = event.result['center'][1]
    this.longtTarget.value = event.result['center'][0]
    this.addressTarget.value = event.result["place_name"]
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }
}
