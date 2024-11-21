import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["section"]; // Define scrollable sections

  connect() {
    this.currentIndex = 0; // Start at the first section
    this.isScrolling = false; // Prevent multiple scrolls at once
  }

  scroll(event) {
    event.preventDefault(); // Prevent default scrolling

    if (this.isScrolling) return; // Prevent multiple simultaneous scrolls

    // Determine scroll direction
    if (event.deltaY > 0 && this.currentIndex < this.sectionTargets.length - 1) {
      // Scroll down
      this.currentIndex++;
    } else if (event.deltaY < 0 && this.currentIndex > 0) {
      // Scroll up
      this.currentIndex--;
    } else {
      return; // No movement if at the top or bottom
    }

    // Scroll to the current section
    this.scrollToSection(this.currentIndex);

    // Add a delay before allowing the next scroll
    this.isScrolling = true;
    setTimeout(() => {
      this.isScrolling = false;
    }, 1200); // Adjust timing (1200ms for slower scrolling)
  }

  scrollToSection(index) {
    this.sectionTargets[index].scrollIntoView({
      behavior: "smooth", // Smooth scrolling
    });
  }
}
