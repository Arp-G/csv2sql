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

      this.handleEvent("save-config", ({ config }) => {
        localStorage.setItem("config", JSON.stringify(config));
      }
      )
    }
  }
};

let liveSocket = new LiveSocket(
  "/live",
  Socket,
  {
    hooks,
    params: {
      _csrf_token: csrfToken,
      localConfig: (JSON.parse(localStorage.getItem('config') || '{}'))
    }
  });

liveSocket.connect();
window.liveSocket = liveSocket;

// Listen for phx "scroll-to-bottom" events and scroll to end of given element id
window.addEventListener(
  "phx:scroll-to-bottom",
  e => {
    const element = document.getElementById(e.detail.id);
    element.scrollTop = element.scrollHeight;
  }
)

// Listen for phx "scroll-into-view" events and scroll the given element id into view
window.addEventListener(
  "phx:scroll-into-view",
  e => {
    const element = document.getElementById(e.detail.id);
    element.scrollIntoView({ behavior: "smooth", block: "nearest" });
  }
)
