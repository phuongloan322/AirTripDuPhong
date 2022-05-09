
let map;
let marker;
let geocoder;
let addList = [];
let nameList = [];
let priceList = [];
let imageList = [];
let placeIdList = [];
let list = [];

function initMap() {
    var geocoder = new google.maps.Geocoder();
    var itemList = [...document.getElementsByClassName('item')];
    itemList.forEach(item => {
        const title = item.getElementsByClassName('title')[0].innerText;
        const address = item.getElementsByClassName('address')[0].innerText;
        const place = item.getElementsByClassName('placeId')[0].innerText;
        const price = item.getElementsByClassName('price')[0].innerText;
        const image = item.getElementsByClassName('image')[0].innerText;
        addList.push(address);
        nameList.push(title);
        placeIdList.push(place);
        priceList.push(price);
        imageList.push(image);
    });

    if(addList.length == 0) {
        alert("Không tìm thấy nhà phòng cho thuê nào!");
        window.location="/show-map";
    }

    for (let i = 0; i < addList.length; i++) {
        console.log(addList[i]);
    }

    var delay = 100;
    var infowindow = new google.maps.InfoWindow();
    var latlng = new google.maps.LatLng(21.0000, 78.0000);
    var mapOptions = {
        //zoom: 8,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }

    map = new google.maps.Map(document.getElementById("map"), mapOptions);
    var bounds = new google.maps.LatLngBounds();

    function geocodeAddress(address, image, placeId, name, price, next) {
        geocoder.geocode({address:address}, function (results,status)
            {
                if (status == google.maps.GeocoderStatus.OK) {
                    var p = results[0].geometry.location;
                    var lat=p.lat();
                    var lng=p.lng();

                    createMarker(address,image, placeId, name, price,lat,lng);
                }
                else {
                    if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
                        nextAddress--;
                        delay++;
                    } else {
                    }
                }
                next();
            }
        );
    }

    function createMarker(address,image, placeId, name, price,lat,lng) {

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(lat,lng),
            map: map,
        });

        google.maps.event.addListener(marker, 'click', function() {
             infowindow.setContent('<div><img width="250px" src="/asset/images/'+image+'"/></div>'
            +'<br><p style="font-size: 14px; width: 250px"><b>'+name+'</b></p>'
            +'<br><p style="font-size: 14px; width: 250px">'+address+'</p>'
            +'<br><p style="font-size: 14px; width: 250px"><b>'+price+'</b></p>'
            +'<br><a href="/detailplace/'+placeId+'" ><u style="font-size: 14px">Xem chi tiết</u></a>'
            +'<a style="margin-left: 30px" href="/AddLovePlace/'+placeId+'" ><u style="font-size: 14px">Yêu thích</u></a>'
            +'<script>console.log("LoanLoan")</script>');
            map.setCenter(new google.maps.LatLng(lat, lng));
            map.setZoom(17);
            infowindow.open(map,marker);

            google.maps.event.addListener(infowindow, 'closeclick', function() {
                map.panTo(this.getPosition());
                map.setZoom(10);
            });
        });

        bounds.extend(marker.position);


    }



    var nextAddress = 0;
    function theNext() {
        if (nextAddress < addList.length) {
            setTimeout(geocodeAddress(addList[nextAddress], imageList[nextAddress]
                , placeIdList[nextAddress], nameList[nextAddress], priceList[nextAddress], theNext), delay);
            nextAddress++;
        } else {
            map.fitBounds(bounds);
        }
    }
    theNext();

}
window.initMap = initMap;
