'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "43a11764c78c1f7ef180207117208c68",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/images/icons/BTN_menu.png": "76cfb113124b43681cf7920baf0da6b9",
"assets/images/icons/btn_next_left.png": "d70c035906f9f53e70de35cca37cdf21",
"assets/images/icons/btn_next_right.png": "a412c2022a2d90979d3949e72684bfeb",
"assets/images/icons/estrelas%2520avaia%25C3%25A7%25C3%25A3o%25201.png": "44131de83a9657371dfc5fe28d3381c2",
"assets/images/icons/iconCategorias.png": "667b1f08b9887295b4633ee7e193f1e0",
"assets/images/icons/icon_facebok.png": "959891a5df53674841e3a4103cfb8f8a",
"assets/images/icons/icon_gmail.png": "96eb80e60c172b32d7e42310f8e46a2f",
"assets/images/icons/icon_instragram.png": "bf341baf52a37b05eb9bef121471f217",
"assets/images/icons/icon_whatsapp.png": "c3ba740ff5dd2d669c566c964dd382f0",
"assets/images/icons/logo.png": "f4eede4708525daadae3a83ac76c7a61",
"assets/images/imag_receita.png": "100981747198379be41d4a336e88e045",
"assets/images/img1_carrossel.png": "f9344760ddf5909561970e9aa59b753a",
"assets/images/img2_carrossel.png": "6817b4ab458adc9d5818c5e4196522fa",
"assets/images/img3_carrossel.png": "e380b8d0eeb0657687b0ade886e2ed4f",
"assets/images/img_categoria1.png": "19f783aee2801284176f093001b2e6fa",
"assets/images/img_categoria2.png": "7fb1f5a62f5a04556ce3508216fafbcb",
"assets/images/img_categoria3.png": "ad7d7aa455954719c132c0b801b9549d",
"assets/images/img_chef.png": "d842b7ce3bb90ea62709b54a943f9bbb",
"assets/images/layout/prototipo1_home.png": "e556695f0f8e7e26599156e85afa1446",
"assets/images/layout/prototipo1_receitas.png": "87f031cc3403166753dfffeab4782d24",
"assets/images/layout/prototipo2_home.png": "107aa987b83d6f5c1a919de350af3819",
"assets/images/README.md": "00670f79a6ca84fd7b07de29d443d915",
"assets/NOTICES": "840be74d3c7c11d2a45c6f1897e65530",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/chromium/canvaskit.js": "bb94a852d3e952894bc175262a9f3a1a",
"canvaskit/chromium/canvaskit.wasm": "8d7ff20bf7fad9dff04c759b8c0138d2",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/skwasm.js": "8f5c33d58a38bab350f7289b3b3f0ad3",
"canvaskit/skwasm.wasm": "acea79c56f8501c74307bf8054ac3435",
"canvaskit/skwasm.worker.js": "b3863a3012fce5442e482648e7f6e763",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "35cd29a3a6571ff844bc7242d5580a74",
"/": "35cd29a3a6571ff844bc7242d5580a74",
"main.dart.js": "bfc09c7442d540b8ebbc9d05925f4818",
"manifest.json": "95c738015afae2279cb1ce07573969d4",
"version.json": "10a0c7ffb74cdde7af7d50682ba066b5"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
  for (var resourceKey of Object.keys(RESOURCES)) {
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
