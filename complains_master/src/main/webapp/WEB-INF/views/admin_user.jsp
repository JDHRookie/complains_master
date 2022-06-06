<%@ page import="java.util.ArrayList" %>
<%@ page import="com.svtcc.bean.AdminBean" %>
<%--
  Created by IntelliJ IDEA.
  User: 蒋登禾
  Date: 2021/12/09
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
    <meta charset="UTF-8">
    <title>工单管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
    <link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/jQuery/jquery-3.1.1.min.js"></script>
    <script src="static/js/bootstrap-dropdown.min.js"></script>
    <script src="static/ajax-lib/ajaxutils.js"></script>
    <script src="static/js/adminUpdateInfo.js"></script>
    <script src="static/js/adminUpdatePwd.js"></script>

</head>



<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>


<body class="bootstrap-admin-with-small-navbar">
<nav class="navbar navbar-inverse navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small" role="navigation">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="collapse navbar-collapse main-navbar-collapse">
                    <a class="navbar-brand" href="admin.jsp"><strong>欢迎使用工单管理系统</strong></a>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" role="button" class="dropdown-toggle" data-hover="dropdown"> <i class="glyphicon glyphicon-user"></i> 欢迎您，管理员<i class="caret"></i></a>

                            <ul class="dropdown-menu">
                                <li><a href="#updateinfo" data-toggle="modal">个人资料</a></li>
                                <li role="presentation" class="divider"></li>
                                <li><a href="#updatepwd" data-toggle="modal">修改密码</a></li>
                                <li role="presentation" class="divider"></li>
                                <!-- href="#identifier"  来指定要切换的特定的模态框（带有 id="identifier"）。-->
                                <li><a href="login_out">退出</a></li>
                            </ul>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>

<div class="container">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <!-- left, vertical navbar -->
        <div class="col-md-2 bootstrap-admin-col-left">
            <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
                <li>
                    <a href="admin_complain"><i class="glyphicon glyphicon-chevron-right"></i> 工单管理</a>
                </li>
                <li>
                    <a href="admin_user"><i class="glyphicon glyphicon-chevron-right"></i> 人员管理</a>
                </li>
                <li>
                    <a href="admin_complaintype"><i class="glyphicon glyphicon-chevron-right"></i> 工单分类管理</a>
                </li>
                <li>
                    <a href="admin_complaininfo"><i class="glyphicon glyphicon-chevron-right"></i> 公告管理</a>
                </li>
                <li>
                    <a href="admin_history"><i class="glyphicon glyphicon-chevron-right"></i> 工单完结信息</a>
                </li>
            </ul>

        </div>

        <!-- content -->
        <div class="col-md-10">


            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default bootstrap-admin-no-table-panel">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">人员管理</div>
                        </div>
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <form class="form-horizontal" action="${pageContext.request.contextPath}/selectAdminByName" method="post">
                                    <input type="hidden" name="page" value="1">
                                    <div class="col-lg-7 form-group">
                                        <label class="col-lg-4 control-label" for="query_bname">用户名称</label>
                                        <div class="col-lg-8">
                                            <input class="form-control" id="AdminName" name="AdminName" type="text" value="">
                                            <label class="control-label" for="query_bname" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 form-group">

                                        <button type="submit" class="btn btn-primary" id="btn_query" onclick="">查询</button>
                                    </div>
                                    <div class="col-lg-3 form-group">

                                        <button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal" data-target="#addModal">添加人员</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>账号</th>
                            <th>姓名</th>
                            <th>密码</th>
                            <th>身份</th>
                            <th>联系电话</th>
                            <th>电子邮件</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <%
                            ArrayList<AdminBean> adminData=null;
                            ArrayList<AdminBean> adminBeanList2=(ArrayList<AdminBean>) request.getAttribute("adminList2");
                            ArrayList<AdminBean> adminBeanList=(ArrayList<AdminBean>)  request.getAttribute("adminList");
                            adminData=adminBeanList2;
                            if (adminData==null){

                                adminData=adminBeanList;
                            }
                            else {
                                adminData=adminBeanList2;
                            }
                        %>

                        <c:forEach var="user" items="<%=adminData%>">
                        <tbody>
                        <td>${user.username}</td>
                        <td>${user.realname}</td>
                        <td>${user.password}</td>
                        <td>
                            <c:if test="${user.status ==2}">管理员</c:if>
                            <c:if test="${user.status ==1}">普通用户</c:if>
                        </td>
                        <td>${user.tel}</td>
                        <td>${user.email}</td>
                        <td><button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#updateModal"
                                    id="btn_update" onclick="showInfo2('${user.aid}','${user.username}','${user.realname}','${user.password}','${user.tel}'
                                ,'${user.email}')">修改</button>
                            <button type="button" class="btn btn-danger btn-xs" onclick="deletebook(${user.aid})">删除</button>
                            <button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#authorityModal"
                                    id="btn_authority" onclick="">权限</button>
                        </td>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function showInfo2(aid,username,realname,password,phone,email) {
            document.getElementById("updateUserId").value = aid;
            document.getElementById("updateusername").value = username;
            document.getElementById("updaterealname").value = realname;
            document.getElementById("updateUpassword").value = password;
            document.getElementById("updatephone").value = phone;
            document.getElementById("updateemail").value = email;
        }
        function deletebook(aid) {
            con=confirm("是否删除?");
            if(con==true){
                location.href = "${pageContext.request.contextPath}/deleteAdmin?aid="+aid;
            }
            <c:if test="${sessionScope.flag7!=0}">
             alert("删除成功!")
            </c:if>
        }
        // function showInfo3(aid,status) {
        //     document.getElementById("authorityId").value = aid;
        //     document.getElementById("authority").value = status;
        // }
    </script>


    <!-- 修改模态框（Modal） -->
    <!-------------------------------------------------------------->

    <!-- 修改模态框（Modal） -->
    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/updateAdminById">   <!--保证样式水平不混乱-->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="updateModalLabel">
                            修改读者信息
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">账号</label>
                            <div class="col-sm-7">
                                <input type="hidden" id="updateUserId" name="aid">
                                <input type="text" class="form-control" id="updateusername" name="updateusername"  placeholder="">
                                <label class="control-label" for="updateusername" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updaterealname" name="updaterealname"  placeholder="">
                                <label class="control-label" for="updaterealname" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">密码</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateUpassword" name="updateUpasswrod" placeholder="">
                                <label class="control-label" for="updateUpassword" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">联系电话</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updatephone" name="updatephone"  placeholder="">
                                <label class="control-label" for="updatephone" style="display: none;"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">电子邮件</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateemail" name="updateemail"  placeholder="">
                                <label class="control-label" for="updateemail" style="display: none;"></label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" onclick="isUpdateAdmin()">
                            修改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </form>
    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/updateAdminById">   <!--保证样式水平不混乱-->
        <div class="modal fade" id="authorityModal" tabindex="-1" role="dialog" aria-labelledby="authorityModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="authorityModalLabel">
                            修改读者信息
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">身份</label>
                            <div class="col-sm-7">
                                <input type="hidden" id="authorityId" name="authorityId">
                                <select class="form-control" id="authority" name="userStatus" onPropertyChange="showValue(this.value)">
                                    <option value="0">请选择</option>
                                    <option value="admin">管理员</option>
                                    <option value="admin2">普通用户</option>
                                </select>
                                <label class="control-label" for="authority" style="display: none;"></label>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" onclick="isUpdateAdmin()">
                            修改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </form>
    <!-------------------------------------------------------------->
<script type="text/javascript">
    function isUpdateAdmin(){
        <c:if test="${sessionScope.flag9!=0}">
            alert("修改成功!")
        </c:if>
    }
</script>


    <!--------------------------------------添加的模糊框------------------------>
    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/addAdmin">   <!--保证样式水平不混乱-->
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            添加新用户
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">账号</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="addusername" id="addISBN" required="required" placeholder="请输入账号">
                                <label class="control-label" for="addISBN" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="addrealname" id="addBookName" required="required"  placeholder="请输入姓名">
                                <label class="control-label" for="addBookName" style="display: none;"></label>
                            </div>
                        </div>



                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">密码</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="addpassword" id="addAutho" required="required"  placeholder="请输入密码">
                                <label class="control-label" for="addAutho" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">联系电话</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="addtel" id="addPress" required="required"  placeholder="请输入联系电话">
                                <label class="control-label" for="addPress" style="display: none;"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">电子邮件</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="addemail" id="addPress" required="required"   placeholder="请输入电子邮件">
                                <label class="control-label" for="addPress" style="display: none;"></label>
                            </div>
                        </div>

<%--                        <div class="form-group">--%>
<%--                            <label for="firstname" class="col-sm-3 control-label">可借阅天数</label>--%>
<%--                            <div class="col-sm-7">--%>
<%--                                <input type="text" class="form-control" name="lend_num" id="updatelend_num" required="required"  placeholder="请输入可借阅天数">--%>
<%--                                <label class="control-label" for="addNum" style="display: none;"></label>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="firstname" class="col-sm-3 control-label">最大可借数</label>--%>
<%--                            <div class="col-sm-7">--%>
<%--                                <input type="text" class="form-control" name="max_num" id="updatemax_num" required="required" placeholder="请输入最大可借数">--%>
<%--                                <label class="control-label" for="addPress" style="display: none;"></label>--%>
<%--                            </div>--%>
<%--                        </div>--%>


                        <!---------------------表单-------------------->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" onclick="isaddAdmin()">
                            添加
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </form>
    <!--------------------------------------添加的模糊框------------------------>
<SCRIPT type="text/javascript">
    function isaddAdmin(){
        <c:if test="${sessionScope.flag8!=0}">
            alert("添加人员成功!")
        </c:if>
        <c:if test="${sessionScope.flag10!=0}">
        alert("该用户已近存在!")
        </c:if>
    }
</SCRIPT>






    <!-------------------------------------------------------------->

    <form class="form-horizontal" method="post" action="infoedit">   <!--保证样式水平不混乱-->
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="updatepwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            修改密码
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!--正文-->
                        <input type="hidden" name="tip" value="1">
                        <input type="hidden" name="url" value="admin_user">
                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">原密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="password" id="oldPwd"  placeholder="请输入原密码">
                                <label class="control-label" for="oldPwd" style="display: none"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">新密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="password2" id="newPwd"  placeholder="请输入新密码">
                                <label class="control-label" for="newPwd" style="display: none"></label>
                            </div>
                        </div>

                        <!--正文-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" >
                            修改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </form>
    <!-------------------------------------------------------------->

    <!-------------------------个人资料模糊框------------------------------------->

    <form class="form-horizontal" method="post" action="infoedit">   <!--保证样式水平不混乱-->
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="updateinfo" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="ModalLabel">
                            个人资料
                        </h4>
                    </div>

                    <div class="modal-body">

                        <!--正文-->
                        <input type="hidden" name="tip" value="2">
                        <input type="hidden" name="url" value="admin_user">
                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">真实姓名</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="name" name="name" placeholder="请输入您的真实姓名" value=''>
                                <label class="control-label" for="name" style="display: none"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">手机号</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入您的手机号" value=''>
                                <label class="control-label" for="phone" style="display: none"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">邮箱</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="email" name="email"  placeholder="请输入您的邮箱" value=''>
                                <label class="control-label" for="email" style="display: none"></label>
                            </div>
                        </div>

                        <!--正文-->


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" >
                            修改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </form>
    <!-------------------------------------------------------------->





    <div class="modal fade" id="modal_info" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="infoModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12" id="div_info"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btn_info_close" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<script>

</script>
