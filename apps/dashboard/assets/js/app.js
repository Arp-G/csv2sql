import * as bootstrap from 'bootstrap';
window.bootstrap = bootstrap;
import "phoenix_html";
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let hooks = {
  // When ever a new tooltip is mounted, initialize it
  initTooltipPopup: {
    mounted() {
      // Initialize bootstrap tooltips
      // Ref: https://getbootstrap.com/docs/5.2/components/tooltips/#enable-tooltips
      new bootstrap.Tooltip(this.el);
    }
  }
};

let liveSocket = new LiveSocket("/live", Socket, { hooks, params: { _csrf_token: csrfToken } });
liveSocket.connect();

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket;

// Listen for scroll events and auto scroll to end
window.addEventListener(
  "phx:scroll-to-bottom",
  e => {
    const element = document.getElementById(e.detail.id);
    element.scrollTop = element.scrollHeight;
  }
)
