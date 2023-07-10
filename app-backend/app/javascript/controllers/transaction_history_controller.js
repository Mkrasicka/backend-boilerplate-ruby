import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="transaction-history"
export default class extends Controller {
  static targets = ["item", "form"]
  // connect() {
  //   console.log("Hello, I'm transaction history controller!");
  //   console.log(this.itemTarget);
  //   console.log(this.formTarget);
  // }

  // submitTransaction(event) {

  // }

  send(e) {
    e.preventDefault();
    fetch(this.formTarget.action, {
      method: "POST",
      headers: {"Accept": "application/json"},
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
    })
  }
}
