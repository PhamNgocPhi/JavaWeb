<%-- 
    Document   : inbangdiem
    Created on : Nov 25, 2016, 12:40:54 AM
    Author     : ThuCuc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-beta.17/angular.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<p:adminLayout title="Trang quản lý lớp học" pageHeader="IN BẢNG ĐIỂM" styleAD="dataTablesbootstrap" >
    <jsp:attribute name="contentAD">
        <div class="panel-body" ng-app="myApp" ng-controller="LopController" ng-init="loadKhoas()">
            <div class="col-md-6 col-md-offset-3">
                <label for="maKH">Chọn khóa học</label>
                <select id="maKH" class="form-control" name="maKH" ng-change="loadLop(value)">
                <c:forEach var="kh" items="${listKH}" >
                     <option value="${kh.getMaKH()}">${kh.getTenKH()}</option>
                </c:forEach>
            </select> 
            </div>
            <div class="col-md-6 col-md-offset-3"> 
                <label for="maLH">Chọn lớp học</label>
            </div>
            <!--            <script>
                            $("#maKH").selectbox({
                                onChange: function (val, inst) {
            
                                    // Run the ajax call to refresh the content of the second selectbox
                                    $.ajax({
                                        type: "GET",
                                        data: {maKH: val},
                                        url: "admin/inbangdiem.jsp",
                                        dataType: 'json',
                                        success: function (data) {
            
                                            // Remove previous content of your second selectbox
                                            $("#maLH").empty();
            
                                            // Append default option
                                            $("#maLH").append($('<option value="">1</option>'));
            
                                            // Loop on your data (which is an array)
                                            for (var i = 0; i < data.length; i++)
                                            {
                                                $("#maLH").append($(document.createElement("option"))
                                                        .val(data[i])
                                                        .html(data[i]));
                                            }
                                        }
                                    });
                                }
                            });
                        </script>-->
            <div class="table-responsive">


<!--                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Mã lớp</th>
                            <th>Mã Học viên</th>
                            <th>Điểm</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="kq" items="${listKQ}">
                            <tr>
                                <td>${kq.getMaLH()}</td>
                                <td>${kq.getMaHV()}</td>
                                <td>${kq.getDiem()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
             /.table-responsive -->
        </div>

        <script  src="${pageContext.request.contextPath}/templates/angularjs/app.js" />
        <script  src="${pageContext.request.contextPath}/templates/angularjs/serviceLop.js"></script>
        <script  src="${pageContext.request.contextPath}/templates/angularjs/controllerLop.js"></script>
    </jsp:attribute>
</p:adminLayout>
