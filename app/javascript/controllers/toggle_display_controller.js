import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'togglable'];
  toggleDiv(event) {
    this.togglableTargets.forEach(div => div.classList.toggle('d-none'));
  }
}
