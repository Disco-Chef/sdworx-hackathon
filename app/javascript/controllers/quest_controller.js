import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "text", "submit" ]

  slide(event){
    this.textTarget.innerText = "Completion Rate: " + event.currentTarget.value + "%"
    this.submitTarget.click()
  }
}
