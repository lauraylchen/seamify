import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["conversation", "messages", "url"]

  // static values = { id: Number }

  connect() {
    // console.log(this.urlTargets)
    // console.log(this.conversationTargets)
    // console.log(this.messagesTarget)
    this.defaultClick()
  }

  display (event) {
    // console.log(event.params.cvid)

    // target link to get url
    const url = `${this.urlTarget.origin}/conversations/${event.params.cvid}`
    // console.log(url)
    // fetch to conversation show method GET
    fetch(url, { headers: { "Accept": "text/plain" } })
    .then(response => response.text())
    .then((data) => {
      // console.log(data)
      // send back the partial of conversation with id = event.params.cvid
      // inject said partial in this.messagesTarget
      this.messagesTarget.outerHTML = data
    })

  }

  defaultClick () {
    const params = Array.from(new URLSearchParams(window.location.search))[0]
    const targets = Array.from(this.conversationTargets)
    if (params == undefined) {
      this.conversationTarget.click()
    }
    else {
      targets.forEach(target => {
        const conversation_id = target.dataset.insertConversationCvidParam
        if (params[1] == conversation_id) {
          target.click()
        }
      })
    }
  }
}
