import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data =>  this.#insertMessageAndScrollDown(data) }
    )
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    this.channel.unsubscribe()
  }

  #insertMessageAndScrollDown(data) {
    //debugger;
    //this.inputTarget.value;
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    //window.location.reload();
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)

    //this.messagesTarget.lastChild.previousElementSibling.classList.remove("sent-message");
    //this.messagesTarget.lastChild.previousElementSibling.classList.add("received-message");
  }
}
