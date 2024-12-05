import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    liked: { type: Boolean, default: undefined },
    movieId: String,
  };

  connect() {
    console.log("test",typeof this.likedValue !== undefined );
    console.log("test2",typeof this.likedValue);
    console.log("test2",this.likedValue);
    
    if (typeof this.likedValue == "boolean") {
      this.displayPreference(this.likedValue);
    }
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
    const movieId = this.movieIdValue;
    const method = this.likedValue ? "DELETE" : "POST";

    this.request(movieId, method);
    this.likedValue = !this.likedValue;
    this.displayPreference(this.likedValue);
  }

  removePreference() {
    const movieId = this.movieIdValue;
    this.request(movieId, "DELETE");
    this.element.remove();
  }

  request(movieId, method) {
    fetch(`/preferences/toggle/${movieId}`, {
      // Second argument allows to precise verb, headers and body
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ method: method }),
    });
  }
}
