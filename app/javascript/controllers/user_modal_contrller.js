import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    super.connect();
  }

  open(e) {
    if (this.preventDefaultActionOpening) {
      e.preventDefault();
    }

    e.target.blur();

    // Lock the scroll and save current scroll position
    this.lockScroll();

    // Unhide the modal
    document.addEventListener("userForm:load", () => {
      this.containerTarget.classList.remove(this.toggleClass);
    });
  }


}
