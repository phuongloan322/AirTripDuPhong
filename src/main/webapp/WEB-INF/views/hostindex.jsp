<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Become-a-host</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/asset/carousel/css/owl.carousel.min.css" />">
    <link rel="stylesheet" href="<c:url value="/asset/carousel/css/owl.theme.default.min.css" />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
    <link rel="stylesheet" href="<c:url value="/asset/carousel/css/style.css" />">
    <link rel="stylesheet" href="<c:url value="/asset/carousel/css/main.css" />">


    <%--	  RTE--%>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/asset/richtextediter/richtext.min.css">

    <style>
        .richText .richText-editor {
            height: 400px;
        }
        input[type="checkbox"] {
            transform: scale(2);
            margin-right: 10px;
        }
    </style>

    <style>
        /**
 * @license
 * Copyright 2019 Google LLC. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */
        /*
         * Always set the map height explicitly to define the size of the div element
         * that contains the map.
         */
        #map {
            height: 100%;
            width: 100%;
        }

        /*
         * Optional: Makes the sample page fill the window.
         */
        html,
        body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        input[type=text] {
            background-color: #fff;
            border: 0;
            border-radius: 2px;
            box-shadow: 0 1px 4px -1px rgba(0, 0, 0, 0.3);
            margin: 10px;
            padding: 0 0.5em;
            font: 400 18px Roboto, Arial, sans-serif;
            overflow: hidden;
            line-height: 40px;
            margin-right: 0;
            min-width: 25%;
        }

        input[type=button] {
            background-color: #fff;
            border: 0;
            border-radius: 2px;
            box-shadow: 0 1px 4px -1px rgba(0, 0, 0, 0.3);
            margin: 10px;
            padding: 0 0.5em;
            font: 400 18px Roboto, Arial, sans-serif;
            overflow: hidden;
            height: 40px;
            cursor: pointer;
            margin-left: 5px;
        }

        input[type=button]:hover {
            background: rgb(235, 235, 235);
        }

        input[type=button].button-primary {
            background-color: #1a73e8;
            color: white;
        }

        input[type=button].button-primary:hover {
            background-color: #1765cc;
        }

        input[type=button].button-secondary {
            background-color: white;
            color: #1a73e8;
        }

        input[type=button].button-secondary:hover {
            background-color: #d2e3fc;
        }

        /* Slideshow container */
        .slideshow-container {
            max-width: 1000px;
            position: relative;
            margin: auto;
        }

        /* Next & previous buttons */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 0;
            top: 50%;
            width: auto;
            margin-top: -22px;
            padding: 16px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover, .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        /* The dots/bullets/indicators */
        .dot {
            cursor: pointer;
            height: 13px;
            width: 13px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        .active, .dot:hover {
            background-color: #717171;
        }

        /* Fading animation */
        .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1.5s;
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @-webkit-keyframes fade {
            from {
                opacity: .4
            }
            to {
                opacity: 1
            }
        }

        @keyframes fade {
            from {
                opacity: .4
            }
            to {
                opacity: 1
            }
        }
    </style>
</head>
<body>


<section class="">
    <div class="">
        <div class="row" style="margin: 0">
            <div class="col-md-12" style="padding: 0">
                <form action="/become-a-host/add" method="post" id="myform" enctype="multipart/form-data">
                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img"
                                     style="background-image: url(asset/carousel/images/work-1.jpg);"></div>
                                <div
                                        class="text text-left p-4 px-xl-5 d-flex align-items-center">
                                    <div class="desc w-100">
                                        <h2>Trở thành Chủ nhà sau 10 bước dễ dàng</h2>
                                        <p4>Hãy tham gia cùng chúng tôi. Chúng tôi sẽ trợ giúp
                                            bạn qua từng bước của quy trình.
                                        </p4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img"
                                     style="background-image: url(asset/images/i122.jpeg);"></div>
                                <div
                                        class="text text-left p-4 px-xl-5 d-flex align-items-center">
                                    <div class="py-md-5">
                                        <h2 class="mb-4">Bạn sẽ cho thuê loại chỗ nào?</h2>
                                        <br>
                                        <div class="category ">
                                            <c:forEach var="item" items="${categoryList }">
                                                <input type="radio" name="category" class="setradio"
                                                       value="${item.categoryId }">
                                                <label>${item.name }</label>
                                                <br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img"
                                     style="background-image: url(asset/images/anh1.jpg);"></div>
                                <div
                                        class="text text-left  p-4 px-xl-5 d-flex align-items-center">
                                    <div class="py-md-5">
                                        <h2 class="mb-4">Điều nào sau đây mô tả chính xác nhất về
                                            nơi ở của bạn?</h2>
                                        <br>
                                        <div class="category">
                                            <c:forEach var="item" items="${litleList }">
                                                <div class="group-form">
                                                    <input type="radio" name="litleCategory" class="setradio"
                                                           value="${item.litleCategoryId }">
                                                    <label>${item.litleName }</label><br>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img chaadd"
                                     style="background-image: url(asset/images/i123.jpeg);">
                                    <h2 class="address">Hãy đặt tên cho chỗ ở của bạn</h2>
                                </div>
                                <div
                                        class="text text-left  p-4 px-xl-5 d-flex align-items-center">
                                    <div class="py-md-5">
                                        <h3>
                                            <b>Tạo tiêu đề</b>
                                        </h3>
                                        <br>
                                        <textarea name="tieude" rows="3" cols="27" class="ftd" id="title"
                                                  maxlength="100"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img chaadd"
                                     style="background-image: url(asset/images/nen13.jpg);"">
                                    <h2 class="address">Chỗ ở của bạn nằm ở đâu?</h2>
                                </div>
                                <div class="text text-left d-flex align-items-center setaddcha">
                                    <div id="map"></div>

                                    <input class="setaddress" type="text" name="address" id="inputaddress" style="border-radius: 20px !important;width: 60%;"
                                           placeholder="Nhập địa chỉ của bạn..."/>
                                    <%--											<input type="button" class="button button-primary" id="search" value="Tìm kiếm" />--%>
                                    <%--											<input type="button" class="button button-secondary" id="clear" value="Clear" />--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img chaadd "
                                     style="background-image: url(asset/images/anh2.jpg);">
                                    <h2 class="address">Tiếp theo, hãy thêm 5 ảnh chụp nổi bật
                                        chỗ ở của bạn</h2>
                                </div>
                                <div
                                     class="text text-left  p-4 px-xl-5 d-flex align-items-center">
                                    <div class="py-md-5">
                                        <img id="imgSrc1" style="display:none" width="200px" height="200px"
                                             src="<c:url value="" />"/>
                                        <img id="imgSrc2" style="display:none" width="200px" height="200px"
                                             src="<c:url value="" />"/>
                                        <img id="imgSrc3" style="display:none" width="200px" height="200px"
                                             src="<c:url value="" />"/>
                                        <img id="imgSrc4" style="display:none" width="200px" height="200px"
                                             src="<c:url value="" />"/>
                                        <img id="imgSrc5" style="display:none" width="200px" height="200px"
                                             src="<c:url value="" />"/>
                                        <img id="imgSrc6" style="display:none" width="200px" height="200px"
                                             src="<c:url value="" />"/>

                                        <input type="file" name="imageFile" id="imageFile"
                                               onchange="chooseFile(this)"
                                               accept="image/*" multiple="multiple" max="5" min="1">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img chaadd"
                                     style="background-image: url(/asset/images/nen10.jpg);">

                                </div>
                                <div
                                        class="text text-left  p-4 px-xl-5 d-flex align-items-center">
                                    <div class="py-md-5">
                                        <table class="bnkhach">
                                            <tr>
                                                <h3><b style="padding: 20px 50px; color: #445; font-size: 30px;">Bạn muốn chào đón bao nhiêu khách?</b></h3>
                                            </tr>
                                            <tr>
                                                <td><b>Khách </b></td>
                                                <td><input type="number" name="khach" value="1"
                                                           placeholder="Vui lòng nhập số khách"/></td>
                                            </tr>
                                            <tr>
                                                <td><b>Phòng ngủ </b></td>
                                                <td><input type="number" name="phongngu" value="1"
                                                           placeholder="Vui lòng nhập số khách"/></td>
                                            </tr>
                                            <tr>
                                                <td><b>Giường </b></td>
                                                <td><input type="number" name="giuong" value="1"
                                                           placeholder="Vui lòng nhập số khách"/></td>
                                            </tr>
                                            <tr>
                                                <td><b>Phòng vệ sinh </b></td>
                                                <td><input type="number" name="phongvs" value="1"
                                                           placeholder="Vui lòng nhập số khách"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img chaadd"
                                     style="background-image: url(/asset/images/i121.jpg);">
                                    <h2 class="address">Bạn muốn cho thuê bao nhiêu nhà/phòng?</h2>
                                </div>
                                <div class="text text-left  p-4 px-xl-5 d-flex align-items-center">
                                    <div class="py-md-5" style="margin: 0 auto">
                                        <h3>
                                            <b style="color: #1b1e21">Số lượng nhà phòng cho phép</b>
                                        </h3>
                                        <br>
                                        <div class="numberplace_added" style="text-align: center;">
                                            <input class="iminus iis-form" type="button" value="-">
                                            <input type="number" name="numberPlace" class="numberPlace" max="10000000"
                                                   min="0" value="1">
                                            <input class="iplus iis-form" type="button" value="+">
                                        </div>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        $('input.numberPlace').each(function () {
                            var $this = $(this),
                                qty = $this.parent().find('.iis-form'),
                                min = Number($this.attr('min')),
                                max = Number($this.attr('max'))
                            if (min == 0) {
                                var d = 0
                            } else d = min
                            $(qty).on('click', function () {
                                if ($(this).hasClass('iminus')) {
                                    if (d > min) d += -1
                                } else if ($(this).hasClass('iplus')) {
                                    var x = Number($this.val()) + 1
                                    if (x <= max) d += 1
                                }
                                $this.attr('value', d).val(d)
                            })
                        })
                    </script>

                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img chaadd"
                                     style="background-image: url(asset/images/anh2.jpg);">
                                    <h2 class="address">Bây giờ đến phần thú vị rồi đặt giá và ngày
                                        cho thuê nào?</h2>
                                </div>
                                <div s
                                     class="text text-left  p-4 px-xl-5 d-flex align-items-center">
                                    <div class="py-md-5" style="margin: 0 auto; ">
                                        <h3>
                                            <b>Hãy nhập giá phù hợp với chỗ ở của bạn<br> (USD/đêm)</b>
                                        </h3>
                                        <br>
                                        <div class="buttons_added" style="text-align: center;margin-left: 70px">
                                            <input class="minus is-form" type="button" value="-">
                                            <input class="input-qty" max="10000000"
                                                   min="0" name="price" type="number" value="1">
                                            <input class="plus is-form" type="button" value="+">
                                        </div>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img chaadd"
                                     style="background-image: url(asset/images/nen1.jpg);">
                                </div>
                                <div
                                     class="text text-left  p-4 px-xl-5 d-flex align-items-center">
                                    <div class="py-md-5" style="margin: 0 auto">
                                        <h3>
                                            <b>Thời gian bạn cho thuê</b>
                                        </h3>
                                        <br>
                                        <br>
                                        <table class="startdate">
                                            <tr>
                                                <td class="ngay"><b>Ngày bắt đầu </b></td>
                                                <td><input type="date" name="startDay" id="startDay"
                                                           placeholder="Chọn ngày bắt đầu cho thuế"/></td>
                                            </tr>
                                            <tr>
                                                <td class="ngay "><b >Ngày kết thúc </b></td>
                                                <td><input type="date" name="endDay" id="endDay"
                                                           placeholder="Chọn ngày kết thúc cho thuế"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img chaadd"
                                     style="background-image: url(asset/images/i121.jpg);">
                                    <h2 class="address">Bây giờ, hãy mô tả chỗ ở của bạn</h2>
                                </div>
                                <div class="text text-left p-4 px-xl-5 d-flex align-items-center">
                                    <div class="">
                                        <h3>
                                            <b>Tạo phần mô tả</b>
                                        </h3>
                                        <br>
                                        <textarea name="detail" rows="4" cols="60" class="ftd" maxlength="500"
                                                  id="content"
                                                  placeholder="Bạn sẽ rất thích thời gian ở tại địa điểm nghỉ dưỡng tươi tắn này."></textarea>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img chaadd"
                                     style="background-image: url(asset/images/anh5.jpg);">
                                    <h2 class="address">Cho khách biết chỗ ở của bạn có những
                                        gì?</h2>
                                </div>
                                <div
                                        class="text text-left  p-4 px-xl-5 d-flex align-items-center">
                                    <div class="">
                                        <div>
                                            <h4>Bạn có tiện nghi nào nổi bật không?</h4>
                                            <br>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Bể bơi">
                                                <label> Bể bơi</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Bồn tắm nước nóng">
                                                <label> Bồn tắm nước nóng</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Lò sưởng trong nhà">
                                                <label> Lò sưởng trong nhà</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Thiết bị tập thể dục">
                                                <label> Thiết bị tập thể dục</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Bếp đốt lửa trại">
                                                <label> Bếp đốt lửa trại</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi"
                                                       value="Khu vực ăn uống ngoài trời">
                                                <label> Khu vực ăn uống ngoài trời</label><br>
                                            </div>
                                        </div>
                                        <div>
                                            <h4 class="asa">Còn những tiện nghi yêu thích của khách
                                                sau đây thì sao?</h4>
                                            <br>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Wi-fi">
                                                <label> Wi-fi</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="TV">
                                                <label> TV</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Bếp">
                                                <label> Bếp</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Máy giặt">
                                                <label> Máy giặt</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Điều hòa nhiệt độ">
                                                <label> Điều hòa nhiệt độ</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi"
                                                       value="Không gian riêng để làm việc">
                                                <label> Không gian riêng để làm việc</label><br>
                                            </div>
                                        </div>
                                        <div>
                                            <h4 class="asa">Bạn có tiện nghi nào trong số những tiện
                                                nghi đảm bảo an toàn này không?</h4>
                                            <br>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Bộ sơ cứu">
                                                <label> Bộ sơ cứu</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Bình chữa cháy">
                                                <label> Bình chữa cháy</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Máy báo khói">
                                                <label> Máy báo khói</label><br>
                                            </div>
                                            <div class="group-form f20">
                                                <input type="checkbox" name="tiennghi" value="Khóa cửa phòng ngủ">
                                                <label> Khóa cửa phòng ngủ</label><br>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mySlides ">
                        <div class="item">
                            <div class="work-wrap d-md-flex">
                                <div class="img"
                                     style="background-image: url(asset/images/anh4.jpg);"></div>
                                <div
                                        class="text text-left p-4 px-xl-5 d-flex align-items-center">
                                    <div class="py-md-5">
                                        <h3>
                                            <b>Chào mừng bạn!</b>
                                        </h3>
                                        <h3>
                                            <b>Chỉ cần nhấn xác nhận là hoàn thành mục cho thuê mới</b>
                                        </h3>
                                        <button onclick="return validate()" class="finish" style="bottom: 50px">Hoàn thành</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

<%--slideshow-container--%>
                    <div class="">
                        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                        <a class="next" onclick="plusSlides(1)">&#10095;</a>
                    </div>
                    <div style="text-align:center">
                        <span class="dot" onclick="currentSlide(1)"></span>
                        <span class="dot" onclick="currentSlide(2)"></span>
                        <span class="dot" onclick="currentSlide(3)"></span>
                        <span class="dot" onclick="currentSlide(4)"></span>
                        <span class="dot" onclick="currentSlide(5)"></span>
                        <span class="dot" onclick="currentSlide(6)"></span>
                        <span class="dot" onclick="currentSlide(7)"></span>
                        <span class="dot" onclick="currentSlide(8)"></span>
                        <span class="dot" onclick="currentSlide(9)"></span>
                        <span class="dot" onclick="currentSlide(10)"></span>
                        <span class="dot" onclick="currentSlide(11)"></span>
                        <span class="dot" onclick="currentSlide(12)"></span>
                        <span class="dot" onclick="currentSlide(13)"></span>
                    </div>

                    <!-- The circles/dots -->
                    <div style="text-align:center">
                        <span class="dots" onclick="currentSlide(1)"></span>
                        <span class="dots" onclick="currentSlide(2)"></span>
                        <span class="dots" onclick="currentSlide(3)"></span>
                        <span class="dots" onclick="currentSlide(4)"></span>
                        <span class="dots" onclick="currentSlide(5)"></span>
                        <span class="dots" onclick="currentSlide(6)"></span>
                        <span class="dots" onclick="currentSlide(7)"></span>
                        <span class="dots" onclick="currentSlide(8)"></span>
                        <span class="dots" onclick="currentSlide(9)"></span>
                        <span class="dots" onclick="currentSlide(10)"></span>
                        <span class="dots" onclick="currentSlide(11)"></span>
                        <span class="dots" onclick="currentSlide(12)"></span>
                        <span class="dots" onclick="currentSlide(13)"></span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<script src="/asset/richtextediter/jquery.richtext.js"></script>
<script src="/asset/richtextediter/jquery.richtext.min.js"></script>

<script>
    $('#content').richText();
</script>

<script type="text/javascript">

    function validate() {
        var flag = true;

        if ($('input[name=category]:checked').length <= 0) {
            flag = false;
            alert("Vui lòng chọn loại nhà ở!");
        }
        if ($('input[name=litleCategory]:checked').length <= 0) {
            flag = false;
            alert("Vui lòng chọn loại nhà ở!");
        }
        if ($('#title').val() == '') {
            flag = false;
            alert("Vui lòng nhập tiêu đề!");
        }
        if ($('#inputaddress').val() == '') {
            flag = false;
            alert("Vui lòng nhập địa chỉ chính xác!");
        }
        if ($('#content').val() == '') {
            flag = false;
            alert("Vui lòng nhập thông tin mô tả nhà phòng!");
        }
        if ($('#imageFile').val() == '') {
            flag = false;
            alert("Vui lòng chọn ít nhất 5 ảnh!");
        }

        return flag;
    }

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imgSrc1').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
        if (input.files && input.files[1]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imgSrc2').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[1]);
        }
        if (input.files && input.files[2]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imgSrc3').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[2]);
        }
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imgSrc4').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[3]);
        }
        if (input.files && input.files[4]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imgSrc5').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[4]);
        }

    }

    $("#imageFile").change(function () {
        readURL(this);
        $("#imgSrc1").show();
        $("#imgSrc2").show();
        $("#imgSrc3").show();
        $("#imgSrc4").show();
        $("#imgSrc5").show();

    });
</script>

<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly"
        defer
></script>

<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
        integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
        crossorigin="anonymous"></script>

<script type="text/javascript">
    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        ;
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#goAdd').on('click', function () {
            var href = $(this).attr('href');
            jQuery.noConflict();
            $('#myform').attr('action', href);
        });
    });
</script>
<script src="asset/carousel/js/popper.js"></script>
<script src="asset/carousel/js/bootstrap.min.js"></script>
<script>//<![CDATA[
$('input.input-qty').each(function () {
    var $this = $(this),
        qty = $this.parent().find('.is-form'),
        min = Number($this.attr('min')),
        max = Number($this.attr('max'))
    if (min == 0) {
        var d = 0
    } else d = min
    $(qty).on('click', function () {
        if ($(this).hasClass('minus')) {
            if (d > min) d += -50
        } else if ($(this).hasClass('plus')) {
            var x = Number($this.val()) + 1
            if (x <= max) d += 50
        }
        $this.attr('value', d).val(d)
    })
})

document.getElementById("startDay").valueAsDate = new Date();
document.getElementById("endDay").valueAsDate = new Date();


//]]></script>

<script src="/asset/map/host.js"></script>
</body>
</html>