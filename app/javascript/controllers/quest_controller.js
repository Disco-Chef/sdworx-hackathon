import { Controller } from "stimulus"
import { initSweetalert } from '../plugins/init_sweetalert';
export default class extends Controller {
  static targets = [ "text", "submit" ]

  slide(event){
    this.textTarget.innerText = "Completion Rate: " + event.currentTarget.value + "%"
    if(event.currentTarget.value == "100"){
      swal("Are you sure?", {
          dangerMode: true,
          buttons: {
            cancel: {
              text: "Cancel",
              value: null,
              visible: true,
              className: "btn btn-default",
              closeModal: true,
            },
            confirm: {
              text: "OK",
              value: true,
              visible: true,
              className: "btn btn-primary",
              closeModal: true
            }
          }
        })
        .then((value) => {
          if(value){ this.submitTarget.click() }
        })
    } else {
    this.submitTarget.click()
   }
  }
}
