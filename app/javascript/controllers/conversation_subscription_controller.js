import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { conversationId: Number, userId: Number }
  static targets = ["messages", "form"]

  connect() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    this.channel = consumer.subscriptions.create(
      { channel: "ConversationChannel", id: this.conversationIdValue },
      { received: data => this.#insertMessageScrollDownAndResetForm(data) }
    )
    console.log(`Subscribe to the conversation with the id ${this.conversationIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  #insertMessageScrollDownAndResetForm(data) {
    var htmlObject = document.createElement('div');
    htmlObject.innerHTML = data;
    var firstDiv = htmlObject.firstChild;
    if (firstDiv.id != this.userIdValue) {
      var lines = data.split("\n")
      lines[0] = "  <div>"
      lines[1] = "    <div class=\"message-bubble\">"
      data = lines.join("\n")
    }

    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    if (firstDiv.id == this.userIdValue) {
      this.formTarget.reset()
    }
  }
}
