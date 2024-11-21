import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["navbar"];

  connect() {
    this.lastScrollTop = 0;
    this.navbar = this.element; // The navbar element
    this.navbar.style.top = "0"; // Ensure navbar is visible on load

    window.addEventListener("scroll", this.handleScroll.bind(this));
  }

  disconnect() {
    window.removeEventListener("scroll", this.handleScroll.bind(this));
  }

  handleScroll() {
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;

    if (scrollTop > this.lastScrollTop) {
      // Scrolling down
      this.navbar.classList.remove("navbar-visible");
      this.navbar.style.top = "-100px";
    } else {
      // Scrolling up
      this.navbar.classList.add("navbar-visible");
      this.navbar.style.top = "0";
    }

    // Ensure navbar stays visible at the top of the page
    if (scrollTop === 0) {
      this.navbar.classList.add("navbar-visible");
      this.navbar.style.top = "0";
    }

    this.lastScrollTop = scrollTop <= 0 ? 0 : scrollTop; // Prevent negative scroll
  }
}
