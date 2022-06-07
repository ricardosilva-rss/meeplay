import { Controller } from "@hotwired/stimulus"
import $ from 'jquery';

export default class extends Controller {
  static targets = ['name', 'total'];

  connect() {
    const $select2 = $(this.nameTarget).select2()
    $select2.on('change', (event) => {
      const selectedGameId = event.target.value;
    });
  }
}
