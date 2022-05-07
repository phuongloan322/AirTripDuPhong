/**
 * @license
 * Copyright 2019 Google LLC. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */
// @ts-nocheck TODO(jpoehnelt) remove when fixed
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

    const submitButton = document.createElement("input");

    submitButton.type = "button";
    submitButton.value = "Tìm kiếm";
    submitButton.classList.add("button", "button-primary");

    const clearButton = document.createElement("input");

    clearButton.type = "button";
    clearButton.value = "Clear";
    clearButton.classList.add("button", "button-secondary");

    const instructionsElement = document.createElement("p");

    map.controls[google.maps.ControlPosition.TOP_LEFT].push(submitButton);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(clearButton);
    marker = new google.maps.Marker({
        map,
    });
    map.addListener("click", () => {
        const inputText = document.getElementById("inputaddress").value;
        console.log(inputText);
        geocode({ address: inputText })
    });
    submitButton.addEventListener("click", () => {
        const inputText = document.getElementById("inputaddress").value;
        console.log(inputText);
        geocode({ address: inputText })
    });
    clearButton.addEventListener("click", () => {
        clear();
    });
    clear();
}

function clear() {
    marker.setMap(null);
}

function geocode(request) {
    clear();
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
            alert("Không tìm thấy địa chỉ trên bản đồ! Vui lòng thực hiện lại!");
        });
}

window.initMap = initMap;
