// Turbo is available globally as soon as @hotwired/turbo-rails loads
// (it assigns itself to window.Turbo), so no import needed here.
Turbo.StreamActions.celebrate = function () {
    document.dispatchEvent(new CustomEvent("game:celebrate"))
  }