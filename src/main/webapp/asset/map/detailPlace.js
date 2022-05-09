//
// let map;
// let marker;
// let geocoder;
//
// function initMap() {
//     map = new google.maps.Map(document.getElementById("map"), {
//         zoom: 8,
//         center: { lat: -34.397, lng: 150.644 },
//         mapTypeControl: false,
//     });
//     geocoder = new google.maps.Geocoder();
//
//     marker = new google.maps.Marker({
//         map,
//     });
//     map.addListener("click", (e) => {
//         geocode({ location: e.latLng });
//     });
//     const inputText = document.getElementById("inputaddress").innerText;
//     window.addEventListener("load", () => {
//         geocode({ address: inputText })
//     });
// }
//
//
// function geocode(request) {
//     geocoder
//         .geocode(request)
//         .then((result) => {
//             const { results } = result;
//
//             map.setCenter(results[0].geometry.location);
//             marker.setPosition(results[0].geometry.location);
//             marker.setMap(map);
//             return results;
//         })
//         .catch((e) => {
//             alert("Geocode was not successful for the following reason: " + e);
//         });
// }
//
// window.initMap = initMap;



function initMap2() {
    const geocoder = new google.maps.Geocoder();
    const directionsRenderer = new google.maps.DirectionsRenderer();
    const directionsService = new google.maps.DirectionsService();
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 7, center: {lat: 41.85, lng: -87.65}, disableDefaultUI: true,
    });

    directionsRenderer.setMap(map);
    directionsRenderer.setPanel(document.getElementById("sidebar"));
    // calculateAndDisplayRoute(geocoder, directionsService, directionsRenderer);
    getLocation(geocoder, directionsService, directionsRenderer);
}



function getLocation(geocoder, directionsService, directionsRenderer) {
    if (navigator.geolocation) {
        let lat;
        let long;
        navigator.geolocation.getCurrentPosition(position => {
            lat = position.coords.latitude;
            long = position.coords.longitude;

            console.log("Vĩ độ: " + lat);
            console.log("Kinh độ: " + long);

            const latlng = {
                lat: parseFloat(lat), lng: parseFloat(long),
            };

            geocoder
                .geocode({location: latlng})
                .then((response) => {
                    if (response.results[0]) {
                        const start = response.results[0].formatted_address;
                        calculateAndDisplayRoute(start, directionsService, directionsRenderer);
                    } else {
                        window.alert("No results found");
                    }
                })
                .catch((e) => window.alert("Geocoder failed due to: " + e));
        });

    } else {
        console.log("Geolocation không được hỗ trợ bởi trình duyệt này.");
    }
}


function calculateAndDisplayRoute(start,directionsService, directionsRenderer) {
    const end = document.getElementById("inputaddress").innerText;

    directionsService
        .route({
            origin: start, destination: end, travelMode: google.maps.TravelMode.DRIVING,
        })
        .then((response) => {
            directionsRenderer.setDirections(response);
        })
        .catch((e) => window.alert("Directions request failed due to " + status));
}


window.initMap = initMap2;

