
import { Controller } from "stimulus"
import { fetchWithToken } from "../utils/fetch_with_token";

export default class extends Controller {
  static targets = [ "input" ]

  fetch(event){
  event.preventDefault();
  fetchWithToken(event.currentTarget.dataset.url, {})
    .then(response => response.json())
    .then((data) => {
      this.inputTarget.value = data.name
    });
  }

  fetchStory(event){
  event.preventDefault();
  let url = event.currentTarget.dataset.url
  console.log(url)
  let nickname = this.inputTarget.value
  url = url + `?nickname=${nickname}`
  fetchWithToken(url, {})
    .then(response => response.json())
    .then((data) => {
      this.inputTarget.value = data.name
    });
  }
}
