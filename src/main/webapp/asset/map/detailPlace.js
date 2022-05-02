
let map;
let marker;
let geocoder;

function initMap() {
    map = new google.maps.Map(document.getElementById("map"), {
        zoom: 8,
        center: { lat: -34.397, lng: 150.644 },
        mapTypeControl: false,
    });
    geocoder = new google.maps.Geocoder();

    marker = new google.maps.Marker({
        map,
    });
    map.addListener("click", (e) => {
        geocode({ location: e.latLng });
    });
    const inputText = document.getElementById("inputaddress").innerText;
    window.addEventListener("load", () => {
        geocode({ address: inputText })
    });
}


function geocode(request) {
    geocoder
        .geocode(request)
        .then((result) => {
            const { results } = result;

            map.setCenter(results[0].geometry.location);
            marker.setPosition(results[0].geometry.location);
            marker.setMap(map);
            return results;
        })
        .catch((e) => {
            alert("Geocode was not successful for the following reason: " + e);
        });
}

window.initMap = initMap;
