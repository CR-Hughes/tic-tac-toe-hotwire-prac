import { Controller } from "@hotwired/stimulus"

const COLORS = ["#f43f5e", "#3b82f6", "#22c55e", "#eab308", "#a855f7"]

export default class extends Controller {
  celebrate() {
    for (let i = 0; i < 80; i++) this.launchPiece()
  }

  launchPiece() {
    const piece = document.createElement("div")
    piece.className = "confetti-piece"
    piece.style.left = `${Math.random() * 100}vw`
    piece.style.backgroundColor = COLORS[Math.floor(Math.random() * COLORS.length)]
    piece.style.animationDuration = `${1 + Math.random()}s`
    piece.style.transform = `rotate(${Math.random() * 360}deg)`

    document.body.appendChild(piece)
    piece.addEventListener("animationend", () => piece.remove())
  }
}