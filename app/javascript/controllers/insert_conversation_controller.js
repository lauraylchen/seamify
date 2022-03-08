import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["conversation", "messages"]

  // static values = { id: Number }

  connect() {
    // console.log(this.element)
    console.log(this.conversationTargets)
    // console.log(this.messagesTarget)
  }

  display (event) {
    console.log(event.params.cvid)

  }
}
