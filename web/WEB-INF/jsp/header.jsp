<%-- 
    Document   : header
    Created on : Apr 26, 2017, 1:33:11 AM
    Author     : linhphan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--header-->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="row">

        <div class="col-md-4">
            <div class="navbar-header">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/home.html">WebHust</a>
            </div>
            <!-- Main nav -->
            <ul class="nav navbar-nav">

                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Sản Phẩm<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <c:forEach var="item" items="${categoryList}">
                            <li><a href="${pageContext.request.contextPath}/product/productList?category=${item.categoryID}">${item.categoryName}</a></li>
                            </c:forEach>
                    </ul>
                </li>
                <li><a href="#">Giới Thiệu</a></li>
                <li><a href="#">Liên Hệ</a></li>
            </ul>
        </div> <!-- Col-md-5 -->
        <!--search-->
        <div class="col-md-4">
            <form action="${pageContext.request.contextPath}/search" method="POST" class="navbar-form navbar-left" role="search">
                <div class="form-group" >
                    <input type="text" class="form-control" placeholder="Search" id="searchText" name="text">
                </div>
                <input type="submit" class="btn btn-success" value="Tìm kiếm" name="search">
            </form>
            <ul id="searchAjax">

            </ul>
        </div> 


        <!-- Nav right -->
        <div class="col-md-4">
            <ul class="nav navbar-nav navbar-right">
                <li><a href ="#modal-signup" data-toggle="modal"><button type="button" class="btn btn-primary" id="sign-up"> <span class="glyphicon glyphicon-user"></span> Sign Up </button></a> </li>
                <li><a href ="#modal-login" data-toggle="modal"><button type="button" class="btn btn-success" id="log-in"> <span class="glyphicon glyphicon-log-in"></span> Log In</button> </a></li>
            </ul>
        </div>
    </div> <!-- End row -->
</nav> <!-- End nav -->

<!-- Log in modal -->
<div class="modal fade" id="modal-login">
    <form action="${pageContext.request.contextPath}/log/login" method="POST" role="form">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">Đăng nhập để tiếp tục</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="">Username</label>
                        <input type="text" class="form-control" id="" placeholder="Username" required="required" name="username1-submit">
                    </div>
                    <div class="form-group">
                        <label for="">Password</label>
                        <input type="password" class="form-control" id="" placeholder="Password" required="required" name="password1-submit">
                    </div>
                </div>

                <div class="modal-footer">
                    <!--  <a href="#modal-signup" class="text-right">Tạo tài khoản mới</a> -->
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <input type="submit" class="btn btn-primary" value="Đăng nhập" name="login">
                </div>
            </div>
        </div>
    </form>
</div> <!-- End Login modal -->

<!-- Sign Up modal -->
<div class="modal fade" id="modal-signup">
    <form action="${pageContext.request.contextPath}/signup/register" method="POST" role="form">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type ="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">Tạo tài khoản mới</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="">Tài khoản</label>
                        <input type="text" class="form-control"  placeholder="Tài khoản (bắt buộc)" required="required" name="username-submit">
                    </div>
                    <div class="form-group">
                        <label for="">Mật khẩu</label>
                        <input type="password" class="form-control"  placeholder="Mật khẩu (bắt buộc)" required="required" name="password-submit">
                    </div>
                    <div class="form-group">
                        <label for="">Nhập lại mật khẩu</label>
                        <input type="password" class="form-control" placeholder="Nhập lại mật khẩu (bắt buộc)" required="required" name="repassword-submit">
                    </div>
                    <div class="form-group">
                        <label for="">Họ và tên</label>
                        <input type="text" class="form-control"  placeholder="Họ tên (bắt buộc)" required="required" name="name-submit">
                    </div>
                    <div class="form-group">
                        <label for="">Email</label>
                        <input type="email" class="form-control"   placeholder="Email (bắt buộc)" required="required" name="email-submit"> 
                    </div>
                    <div class="form-group">
                        <label for="">Địa chỉ</label>
                        <input type="text" class="form-control"  placeholder="Địa chỉ (bắt buộc)" name="address-submit" required="required">
                    </div>
                    <div class="form-group">
                        <label for="">Số điện thoại</label>
                        <input type="number" class="form-control"   placeholder="Số điện thoại (bắt buộc)" name="phone-submit"  required="required">
                    </div>
                </div>

                <div class="modal-footer">
                    <!-- <a href="#modal-login" class="text-right">Đăng nhập</a> -->
                    <button type ="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <input type ="submit" class="btn btn-primary" value="Đăng ký" name="signup">
                </div>
            </div>
        </div>
    </form>
</div> <!-- End Sign UP Modal -->

<script>
    $(document).ready(function () {
        $("#searchText").keyup(function () {
            var key = $("#searchText").val();
            $.ajax({
                url: "${pageContext.request.contextPath}/search-ajax",
                type: "get",
                data: "key=" + key,
                async: true,
                success: function (resultAjax) {
                    $("#searchAjax").html(resultAjax);
                    $("#searchAjax").css("display", "block");
                }
            });
        });
    });
</script>