<%-- 
    Document   : userheader
    Created on : Apr 18, 2017, 8:43:49 PM
    Author     : linhphan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="row">

              <div class="col-md-4">
                <div class="navbar-header">
                  <a class="navbar-brand" href="${pageContext.request.contextPath}/home">WebHust</a>
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
                  <li><a href="#">Xin chào: ${user.fullName}</a></li>
                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Tài khoản<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li class="active"><a href="#">${user.username}</a></li>
                      <li><a href="${pageContext.request.contextPath}/user/user-infor">Thông tin tài khoản</a></li>
                      <li id="logout1" ><a href="${pageContext.request.contextPath}/log/logout">Đăng xuất</a></li>
                    </ul>
                  </li>
                  
                </ul>
              </div>
            </div> <!-- End row -->
          </nav> <!-- End nav -->
    <script> 
        $(document).ready(function(){
            $("#searchText").keyup(function(){
                var key = $("#searchText").val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/search-ajax" ,
                    type: "get" ,
                    data: "key=" +key , 
                    async: true,
                    success: function(resultAjax){
                        $("#searchAjax").html(resultAjax) ;
                        $("#searchAjax").css("display", "block") ;
                    }
                }) ;
            }) ;
        }) ;
    </script>

