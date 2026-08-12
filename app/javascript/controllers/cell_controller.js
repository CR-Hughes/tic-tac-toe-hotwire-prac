import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.classList.add("cell--pop")
    setTimeout(() => this.element.classList.remove("cell--pop"), 200)
  }
}