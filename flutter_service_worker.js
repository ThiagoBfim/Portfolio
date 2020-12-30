'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"favicon.ico": "b0ff1587af5ee8e369e93727dc6b8487",
"manifest.json": "9d14ee444d9af0521b34b1b55aaddd39",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b14fcf3ee94e3ace300b192e9e7c8c5d",
"assets/NOTICES": "e1fac5a3ef37a85fe0c8872f188ae95d",
"assets/assets/about/gitlab.png": "d13bef02a7454ec7fc1a406ed303e8d7",
"assets/assets/about/favicon.ico": "b0ff1587af5ee8e369e93727dc6b8487",
"assets/assets/about/kaggle.png": "199ad3c93cf438a31bc673b94eb85c7b",
"assets/assets/about/github.png": "ca1ef68de99bb1c21b54a2de9c2f5603",
"assets/assets/about/stackoverflow.png": "6b99b3bbe6bc99a25625f112a43953bd",
"assets/assets/about/favicon.png": "524ef3f0699006b6dffedb822c2e93cf",
"assets/assets/about/linkedin.png": "3449314c619dd6aca8200889ac622115",
"assets/assets/conhecimentos/sql.png": "1a350423b8ca9640930797207d6d457a",
"assets/assets/conhecimentos/spring.jpg": "0bd70207a3e712c2af47a85b061d10fa",
"assets/assets/conhecimentos/html.png": "664a8c00ef526bf33edf55808601d461",
"assets/assets/conhecimentos/docker.png": "5366d192e889e5d8300cc4e3593958f7",
"assets/assets/conhecimentos/javascript.png": "4e60a68a42b5726ba930a16b8b0c2fdb",
"assets/assets/conhecimentos/bootstrap.png": "d197999ea5b1d901d655d51d05663a7a",
"assets/assets/conhecimentos/java.png": "f145c78c78493cc609a4a28624fef279",
"assets/assets/conhecimentos/angular.png": "bf861c957269be290ba37a1b5f448eaf",
"assets/assets/conhecimentos/css.png": "6da40100479a712234db62027dab6692",
"assets/assets/conhecimentos/flutter.png": "0b5a2f8d3f4d173805affaf9f84f6c87",
"assets/assets/timeline/estudo.png": "a6c80702b0f09bd04c63a7a7f5aee7f0",
"assets/assets/timeline/mirante.png": "f35f436a1a219612f9dec292c1c8eb07",
"assets/assets/timeline/digital_innovation_one.png": "60ca0eacdff1eec9217dd2477829a1eb",
"assets/assets/timeline/singular.png": "9a8946f44c753bdca1d9d84924cf6667",
"assets/assets/timeline/igti.jpg": "d4c61eefec910587656ade20ad5b0e3a",
"assets/assets/timeline/ucb.jpg": "5b35ddabd6c510dfffc34037dba7d5cb",
"assets/assets/Thiago_Curriculo.pdf": "4ed7fadd52450d91562fc2fbac85490e",
"assets/AssetManifest.json": "98e5640cac82af0407f4ad3d07e6ebc5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"index.html": "67549b26eb885f4821310be0fdd002d9",
"/": "67549b26eb885f4821310be0fdd002d9",
"version.json": "d8e4ef9f0a2b9e9a19ec932e55c6d4b9",
"main.dart.js": "8f1a0c0a42bb4b5013235d0e21a024cf"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
