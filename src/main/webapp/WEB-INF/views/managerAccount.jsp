<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manager Account</title>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/asset/css/stylenew.css">
    <%@ include file="/WEB-INF/views/layouts/head2.jsp" %>
<%--Hien thi Modal--%>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<%----%>
</head>
<body style="background: #fff !important">
<header id="header"><!--header-->

    <div class="header-middle"><!--header-middle-->
        <div class="container" style="width: 1300px !important;">
            <div class="row">
                <div class="col-sm-3">
                    <div class="logo pull-left">
                        <div style="margin-top: 10px">
                            <a href="<c:url value="/index" />"><b class="head3" style="color: #ef4365; ">
                                <i class="fas fa-cannabis" style="margin-right: 10px;margin-top: -5px"></i>AirTrip</b>
                            </a>
                        </div>
                    </div>
                </div >
                <div class="col-sm-6 pull-left">

                </div>
                <%@ include file="/WEB-INF/views/layouts/menu.jsp" %>
            </div>
        </div>
    </div><!--/header-middle-->
</header>

<div class="w-detail">
    <div class="container" style="max-width: 1400px !important">
        <h3><b>${detailPlace.name }</b></h3>
        <div class="ileft">
            <div class="tomtat">
                <div class="anhdaidien">
                    <c:choose>
                        <c:when test="${accLogin.image != null }">
                            <img width="200px" height="200px" class="anhdaidien" alt=""
                                 src="<c:url value="/asset/images/${accLogin.image }" />">
                        </c:when>
                        <c:otherwise>
                            <img width="200px" height="200px" class="anhdaidien" alt=""
                                 src="<c:url value="/asset/images/a1.jpg" />">
                        </c:otherwise>
                    </c:choose>
                    <br><br>
                    <a class="capnhatanh" href="" data-toggle="modal" data-target="#modalThem">C???p nh??t ???nh</a>
                    <hr>
                    <c:if test="${accLogin.isIdentity == false}">
                        <h4>
                            <i class="fas fa-exclamation"></i>
                                ${accLogin.name } ch??a x??c nh???n danh t??nh</h4>
                        <a href="/identity?email=${accLogin.email}" data-email="${accLogin.email}" id="identity">X??c nh???n danh t??nh</a>
                    </c:if>
                    <c:if test="${accLogin.isIdentity == true}">
                        <h4>
                            <i class="fas fa-check"></i>
                                ${accLogin.name } ???? x??c nh???n danh t??nh</h4>
                    </c:if>

                </div>
            </div>
        </div>
        <div class="iright">
            <h2>Xin ch??o, ${accLogin.name }</h2>

            <hr>

            <h3>Th??ng tin c?? b???n</h3>
            <br>
            <p class="error">${error }</p>
            <p class="success">${success }</p>
            <form action="<c:url value="/manager-account" />" method="post">

                <div class="form-group">
                    <label>H??? v?? t??n</label><br>
                    <input class="nhap" value="${accLogin.name }" name="name"/>
                </div>
                <br>

                <div class="form-group">
                    <label>T??n ????ng nh???p</label><br>
                    <input class="nhap" value="${accLogin.username }" type="text" name="username" readonly/>
                </div>
                <br>

                <div class="form-group">
                    <label>Email</label><br>
                    <input class="nhap" value="${accLogin.email }" type="email" name="email"/>
                </div>
                <br>

                <div class="form-group">
                    <label>S??? ??i???n tho???i</label><br>
                    <input class="nhap" value="${accLogin.phone }" type="text" name="phone"/>
                </div>
                <br>

                <div class="form-group">
                    <label>?????a ch???</label><br>
                    <input class="nhap" value="${accLogin.address }" type="text" name="address"/>
                </div>
                <br>

                <div class="form-group">
                    <label>Gi???i thi???u</label><br>
                    <textarea class="nhap" type="text" style="height: 100px; background-color: #fff" name="introduce">${accLogin.introduce }</textarea>
                </div>
                <br>

                <p class="changepass" id="change">Thay ?????i m???t kh???u</p>

                <div id="changepass" class="form-group">
                    <div class="form-group">
                        <label>Nh???p m???t kh???u c??</label><br>
                        <input class="nhap" type="password" name="password" value="" autocomplete="new-password"/>
                    </div>
                    <br>
                    <div class="form-group">
                        <label>Nh???p m???t kh???u m???i</label><br>
                        <input class="nhap" type="password" name="passwordnew"/>
                    </div>
                    <br>
                    <div class="form-group">
                        <label>Nh???p l???i m???t kh???u m???i</label><br>
                        <input class="nhap" type="password" name="repasswordnew"/>
                    </div>
                    <br>
                </div>
                <br>

                <div class="form-group"><br>
                    <button class="save">L??u</button>
                </div>
            </form>
        </div>

    </div>
</div>


    <!-- Modal ADD-->
    <div class="modal fade" id="modalThem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <p class="modal-title" id="exampleModalLabel">C???p nh???t ???nh</p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="preview">
                        <img id="imgSrc" class="anhdaidien borderavt" width="200px" height="200px"
                             src="<c:url value="/asset/images/${accLogin.image }" />"/></div>
                    <span class="wrap hotness">
						 <form id="newHotnessForm" action="<c:url value="/manager-account/edit-image" />" method="post"
                               enctype="multipart/form-data">
						 	<div id="uploadCover" class="thumb-cover can20">     
						        <input type="file" name="imageFile" id="imgUpload" accept="image/*"
                                       title="Click ????? thay ?????i h??nh ???nh!">
						      </div>
							<br>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Tho??t</button>
								<button type="submit" class="btn review">L??u</button>
							</div>        
						</form>
					</span>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="identityModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <p class="modal-title">X??c nh???n danh t??nh</p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
					<p><h5>Vui l??ng ki???m tra email v?? nh???p m?? x??c nh???n t??i kho???n</h5></p>
                    <input class="nhap" name="otp" id="otp">
                    <br>
                    <p style="color:darkred" id="error"></p>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">????ng</button>
                    <button type="submit" class="btn" id="confirm" style="background-color: #ef4365; color: #fff">X??c nh???n</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        jQuery.noConflict();
		jQuery('#identity').click(function(evt) {
			evt.preventDefault();
            var email = jQuery(this).attr("data-email");
            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "/identity",
                data: {
                    email: email,
                },
                success: function (otp) {
                    console.log("SUCCESS: ");
                },
                error: function (e) {
                    console.log("ERROR: ", e);
                }
            });
			$('#identityModal').modal();

		});

        jQuery('#confirm').click(function(evt) {
            evt.preventDefault();
            var otp = document.getElementById("otp").value;
            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "/confirm-identity",
                data: {
                    otp: otp
                },
                success: function (data) {
                    console.log("SUCCESS: ");
                    location.reload();
                },
                error: function (e) {
                    console.log("ERROR: ", e);
                    document.getElementById("error").innerHTML = "X??c nh???n m?? kh??ng ch??nh x??c!";
                }
            });
        });


		function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgSrc').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#imgUpload").change(function () {
            readURL(this);
        });
    </script>
    <script>
        document.getElementById("change").onclick = function () {
            var x = document.getElementById('changepass');
            if (x.style.display === 'none') {
                x.style.display = 'block';
            } else {
                x.style.display = 'none';
            }
        }
    </script>
    <br><br>
<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
</body>
</html>