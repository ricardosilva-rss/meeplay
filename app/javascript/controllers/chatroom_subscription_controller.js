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
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    this.channel.unsubscribe()
  }

  #insertMessageAndScrollDown({ user, message }) {
    const myId = parseInt(this.messagesTarget.dataset.userId);

    if (parseInt(user) !== myId) {
      message = message.replace('sent-message', 'received-message');
    }

    this.messagesTarget.insertAdjacentHTML("beforeend", message)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
