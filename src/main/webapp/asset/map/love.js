
let map;
let marker;
let geocoder;

function initMap() {
    map = new google.maps.Map(document.getElementById("map"), {
        zoom: 10,
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

    var addressList = [...document.getElementsByClassName('loveplace')];
    addressList.forEach(item => {
        item.addEventListener('click', function () {
            const address1 = item.getElementsByClassName('address')[0].innerText;
            console.log(address1);
            geocode({ address: address1 })
        });
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
