import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="transaction-history"
export default class extends Controller {
  static targets = ["items", "form"];

  send(e) {
    e.preventDefault();
    const form = e.currentTarget;
    const url = form.action;
    const formData = new FormData(form);

    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: formData,
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data)
        if (data.id) {
          const newItemHTML = `
            <p>Transferred ${data.amount} from account ${data.account_from_id}</p>
            <p>The current account balance is ${data.account_balance}</p>
          `;
          this.itemsTarget.insertAdjacentHTML("beforebegin", newItemHTML);
          form.reset();
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
}
