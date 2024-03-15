import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

window.onbeforeunload = function() {
    // Show the loader before the navigation starts
    document.getElementById("loader").style.display = "block";
};
  
window.onload = function() {
    // Hide the loader after the page is fully loaded
    document.getElementById("loader").style.display = "none";
};