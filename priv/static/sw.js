// csv2sql service worker: cache-first for hashed static assets,
// network-first for documents. Never intercepts LiveView transport.
const CACHE = "csv2sql-v1";

self.addEventListener("install", (event) => {
  self.skipWaiting();
});

self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches
      .keys()
      .then((keys) => Promise.all(keys.filter((k) => k !== CACHE).map((k) => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

self.addEventListener("fetch", (event) => {
  const url = new URL(event.request.url);

  // LiveView websocket/longpoll and non-GET requests pass straight through.
  if (event.request.method !== "GET") return;
  if (url.pathname.startsWith("/live")) return;
  if (url.pathname.startsWith("/phoenix")) return;

  // Content-hashed assets: cache-first.
  if (url.pathname.startsWith("/assets/") || url.pathname.startsWith("/images/")) {
    event.respondWith(
      caches.open(CACHE).then((cache) =>
        cache.match(event.request).then(
          (hit) =>
            hit ||
            fetch(event.request).then((response) => {
              if (response.ok) cache.put(event.request, response.clone());
              return response;
            })
        )
      )
    );
    return;
  }

  // Documents: network-first, cached shell as offline fallback.
  event.respondWith(
    fetch(event.request)
      .then((response) => {
        if (response.ok && event.request.mode === "navigate") {
          const clone = response.clone();
          caches.open(CACHE).then((cache) => cache.put(event.request, clone));
        }
        return response;
      })
      .catch(() => caches.match(event.request))
  );
});
