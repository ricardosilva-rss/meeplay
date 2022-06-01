import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "options"];

  dropdownMenu() {
    this.optionsTarget.classList.remove("d-none")
  }
}
