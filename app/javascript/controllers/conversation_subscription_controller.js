import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { conversationId: Number }
  static targets = ["messages", "form"]

  connect() {
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
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    this.formTarget.reset()
  }
}
