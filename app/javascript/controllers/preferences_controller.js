import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="event-listener"
export default class extends Controller {
  static values = {
    liked: Boolean,
  };

  connect() {
    console.log(this.likedValue);
    this.displayPreference(this.likedValue);
    this.togglePreference
  }

  displayPreference(isLiked) {
    const notLiked = '<i class="fa-solid fa-plus"></i>';
    const liked = '<i class="fa-solid fa-thumbs-up"></i>';
    if (isLiked) {
      this.element.innerHTML = liked;
    } else {
      this.element.innerHTML = notLiked;
    }
  }

togglePreference() {
  const movieId = this.formTarget.dataset.movieId;
  this.displayPreference(!this.likedValue);


  fetch(this.formTarget.action, {
    method: "POST",
    headers: { "Accept": "application/json" },
    body: new FormData(this.formTarget)
  })
  .then(response => {
    return response.json();
  })
  .then(data => {

    return fetch("http://localhost:3000/dashboard/preferences", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({ movie_id: movieId })
    });
  })
  .then(response => response.json())
}
}
