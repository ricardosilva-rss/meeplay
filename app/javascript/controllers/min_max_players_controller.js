import { Controller } from "@hotwired/stimulus"
import $ from 'jquery';
import 'select2';

export default class extends Controller {
  static targets = ['name', 'total'];

  connect() {
    const $select2 = $(this.nameTarget).select2()
    $select2.on('change', (event) => {
      const selectedGameId = event.target.value;
      fetch(`/boardgames/${selectedGameId}.json`)
        .then(response => response.json())
        .then(data => {
          this.removeAllOptionsFromTotal();
          this.addOptionsToTotal(data.min_players, data.max_players);
        });
    });
  }

  removeAllOptionsFromTotal() {
    while (this.totalTarget.options.length > 0) {
      this.totalTarget.remove(0);
    }
  }

  addOptionsToTotal(min, max) {
    for (let i=min; i<=max; i++) {
      let newOption = new Option(i, i);
      this.totalTarget.add(newOption, undefined);
    }
  }
}
