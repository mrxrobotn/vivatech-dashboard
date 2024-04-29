'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "ebf8a79c1bfd9b1595a9c8b6f179715e",
"assets/AssetManifest.smcbin": "26504bae13d8a41e4a117ca4afa94410",
"assets/assets/fonts/HelveticaNeue-Bold-Italic.ttf": "50ebaffda38591da934715cd8c22e99e",
"assets/assets/fonts/HelveticaNeue-Bold.ttf": "2493fdb67342e3ef0d98672a711f9ded",
"assets/assets/fonts/HelveticaNeue-Condensed-Black.ttf": "c99a48da5c4f4e39ac932c267673ab83",
"assets/assets/fonts/HelveticaNeue-Condensed-Bold.ttf": "ca6345e644cdb78446146737600c9ed0",
"assets/assets/fonts/HelveticaNeue-Italic.ttf": "c13f837a34b71ac8887cbb475bfa49fe",
"assets/assets/fonts/HelveticaNeue-Light-Italic.ttf": "704d3b2818c5e16ac5520094625bf87a",
"assets/assets/fonts/HelveticaNeue-Light.ttf": "9ce6b81d106aef68f9250c9247cf1d71",
"assets/assets/fonts/HelveticaNeue-Medium.ttf": "c2107c36ba0d9c5354ff6b5bf2332ef8",
"assets/assets/fonts/HelveticaNeue-Ultra-Light.ttf": "5317c1455a445e0b6069cf091c4dd64d",
"assets/assets/icons/Bell.svg": "9bc59ab4b881ce8834756d6efb9727e4",
"assets/assets/icons/BlogPost.svg": "1591f545f50891d42ea10d582104ed1e",
"assets/assets/icons/chat.svg": "6603c9da23d55c3ab75cf052cf2e5b53",
"assets/assets/icons/Comments.svg": "fe5526f5e201592904e18e0222463199",
"assets/assets/icons/Dashboard.svg": "9fe5ff508d43a7ab5e9e04cb95460e82",
"assets/assets/icons/Dribbble.svg": "ada20573b623c94cc622b680ba937148",
"assets/assets/icons/Facebook.svg": "e44d4dd6594e6ae6718a89059f29cdc7",
"assets/assets/icons/Form.svg": "35c7e04f2687ced05bcc02d2ad496b73",
"assets/assets/icons/google-plus.svg": "3f71987b1e86c1f980e19a685acd040c",
"assets/assets/icons/Linkedin.svg": "d9275f99a5109c6baa6a46cef6b99dbb",
"assets/assets/icons/login.svg": "a7711b1f104c98c8ae18420653074837",
"assets/assets/icons/Logout.svg": "72e70359d58453211e79bb6997fe8b16",
"assets/assets/icons/Message.svg": "37140f65978e0b67dc31bd815c72af9f",
"assets/assets/icons/Pages.svg": "b6036bea7a2a60a8cd0807d1edc0abd0",
"assets/assets/icons/Post.svg": "e6d121c4a6ec5cd00e9c56e647f5fe9b",
"assets/assets/icons/QrCode.svg": "e149e9c50e7b1a3ce21ab1402afe12be",
"assets/assets/icons/Setting.svg": "93dc419a0a2ee4ff7be14c7fabe39c0d",
"assets/assets/icons/signup.svg": "2fa408c0387578db0675dc11edc3e0fa",
"assets/assets/icons/Statistics.svg": "0853d0fbb5dce77eee9d45129b8c11c4",
"assets/assets/icons/Subscribers.svg": "b41a302e79395e32514c221029b7f035",
"assets/assets/icons/Twitter.svg": "7e145c9eb60da95379f070be9920eca5",
"assets/assets/images/details.png": "bf1ca96650f490f3944d174693589b99",
"assets/assets/images/login_bottom.png": "b473d9b1b30607e274348f114273a094",
"assets/assets/images/logo-dclic-oif.jpg": "3b1e2e9376e101744cbdb4cdd2b11789",
"assets/assets/images/logo-dclic-white.png": "87e26d49e0f004525919318392aaece5",
"assets/assets/images/logo-dclic.png": "2969914245103900c50d024b28c40fef",
"assets/assets/images/logo-oif-white.png": "692a867409d19e36858b8c1e52c84df7",
"assets/assets/images/logo-oif.png": "ddeecfe9f4bde7dcb6f608bbbc46c0bd",
"assets/assets/images/main_bottom.png": "322c8b4cda43fe21e0d78a1f30f387ce",
"assets/assets/images/main_top.png": "cd3220e276bb9dee0a1c7d18126aad72",
"assets/assets/images/profile.png": "7fc5a52672d97e532ae995083689c994",
"assets/assets/images/signup_top.png": "6eaad7a7b0febd05500366722015bd6d",
"assets/FontManifest.json": "c29d5dcafa70e4fb3827852f9d88346d",
"assets/fonts/MaterialIcons-Regular.otf": "a5e5d09d676cea70d3b4a1f7bcc8c88d",
"assets/NOTICES": "25073fd495e61fab591d30a8b2000b0c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "2969914245103900c50d024b28c40fef",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4d18e2805b48cb68c5f979acf71f70fb",
"/": "4d18e2805b48cb68c5f979acf71f70fb",
"main.dart.js": "69d9c121805e2a56f30dd9d2d440b104",
"manifest.json": "473e78bdb3ed20e890243d85590f3a88",
"version.json": "cd541de18b035f5e815df053df7f1585"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
