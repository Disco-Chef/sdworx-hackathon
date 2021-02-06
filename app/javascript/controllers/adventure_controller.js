import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name", "story", "xp", "adventureBtnModal", "description" ]

  badGuyChosen(event){
    let div = this.element.querySelector(event.currentTarget.value)
    this.nameTarget.value = div.dataset.name
    this.storyTarget.value = div.dataset.story
    this.xpTarget.value = div.dataset.xp
    this.adventureBtnModalTarget.click()
  }

  questChosen(event){
    let div = this.element.querySelector(event.currentTarget.value)
    this.nameTarget.value = div.dataset.name
    this.descriptionTarget.value = div.dataset.description
    this.xpTarget.value = div.dataset.xp
    this.adventureBtnModalTarget.click()
  }
  powerUpChosen(event){
    this.questChosen(event)
  }
}
