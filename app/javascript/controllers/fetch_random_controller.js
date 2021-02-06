
import { Controller } from "stimulus"
import { fetchWithToken } from "../utils/fetch_with_token";

export default class extends Controller {
  static targets = [ "inputName", "inputStory" ]

  fetch(event){
  event.preventDefault();
  fetchWithToken(event.currentTarget.dataset.url, {})
    .then(response => response.json())
    .then((data) => {
      this.inputNameTarget.value = data.name
    });
  }

  fetchStory(event){
  event.preventDefault();
  let url = event.currentTarget.dataset.url
  let nickname = this.inputNameTarget.value
  url = url + `?nickname=${nickname}`
  fetchWithToken(url, {})
    .then(response => response.json())
    .then((data) => {
      this.inputStoryTarget.value = data.story
    });
  }
}
