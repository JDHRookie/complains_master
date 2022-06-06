<%@ page import="java.util.ArrayList" %>
<%@ page import="com.svtcc.bean.ComplainBean" %>
<%@ page import="com.svtcc.dao.ComplainDao" %>
<%@ page import="com.svtcc.service.Imp.ComplainServiceImp" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.ui.Model" %>
<%--
  Created by IntelliJ IDEA.
  User: 蒋登禾
  Date: 2021/12/10
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
    <meta charset="UTF-8">
    <title>图书馆管理系统</title>
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
    <style>
        ul.pagination {
            display: inline-block;
            padding: 0;
            margin: 0;
        }

        ul.pagination li {display: inline;}

        ul.pagination li a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
            margin: 0 4px;
        }

        ul.pagination li a.active {
            background-color: #1759c3;
            color: white;
            border: 1px solid #1759c3;
        }

        ul.pagination li a:hover:not(.active) {background-color: #ddd;}
    </style>

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
                            <div class="text-muted bootstrap-admin-box-title">查询</div>
                        </div>
                        <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                            <form class="form-horizontal" action="${pageContext.request.contextPath}/selectComplainsBySth" method="post">
                                <input type="hidden" name="page" value="1">
                                <div class="col-lg-3 form-group">

                                    <button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal" data-target="#addAnnounce">添加公告</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>标题</th>
                            <th>内容</th>
                            <th>发布时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <c:forEach var="announceList" items="${announceBeanList}">
                            <tbody>
                            <td>${announceList.title}</td>
                            <td>${announceList.content}</td>
                            <td>${announceList.announcetime}</td>
                            <td><button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#updateModal"
                                        id="btn_update" onclick="showInfo2('${announceList.title}','${announceList.content}','${announceList.announcetime}','${announceList.mid}')">修改</button>
                                <button type="button" class="btn btn-danger btn-xs" onclick="deletebook(${announceList.mid})">删除</button>
                            </td>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        function showInfo2(AnnoTitle,AnnoContent,AnnoTime,AnnoId) {
            document.getElementById("updateAnnoTitle").value = AnnoTitle;
            document.getElementById("updateAnnoContent").value = AnnoContent;
            document.getElementById("updateAnnoTime").value = AnnoTime;
            document.getElementById("updateAnnoId").value = AnnoId;
        }
        function deletebook(mid) {
            con=confirm("是否删除?");
            if(con==true){
                location.href = "${pageContext.request.contextPath}/deleteAnnounce?mid="+mid;
            }
            <c:if test="${sessionScope.flag19!=0}">
            alert("删除成功!")
            </c:if>
        }
    </script>

    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/updateAnnounce">

        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel2" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="updateModalLabel2">
                            修改工单信息
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">标题</label>
                            <div class="col-sm-7">
                                <input type="hidden" id="updateAnnoId" name="annoId">
                                <input type="text" class="form-control" id="updateAnnoTitle" name="upannotitle"  placeholder="请输入公告标题">
                                <label class="control-label" for="updateAnnoTitle" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">内容</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateAnnoContent" name="upannocontent"  placeholder="请输入公告内容">
                                <label class="control-label" for="updateAnnoContent" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">发布时间</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateAnnoTime" name="upannotime"  placeholder="请输入发布时间">
                                <label class="control-label" for="updateAnnoTime" style="display: none;"></label>
                            </div>
                        </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" onclick="isUpdateAnno()" >
                            修改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        </div>
    </form>
    <script type="text/javascript">
        function isUpdateAnno(){
            <c:if test="${sessionScope.flag20!=0}">
            alert("修改成功!")
            </c:if>
        }
    </script>
    <!-------------------------------------------------------------->

    <!--------------------------------------添加的模糊框------------------------>
    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/addAnnounce">   <!--保证样式水平不混乱-->
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="addAnnounce" tabindex="-1" role="dialog" aria-labelledby="MessageLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="MessageLabel">
                            添加公告
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">标题</label>
                            <div class="col-sm-7">
                                <input type="hidden" id="AnnoId2" name="annoId2">
                                <input type="text" class="form-control" id="updateAnnoTitle2" name="annotitle"  placeholder="请输入公告标题">
                                <label class="control-label" for="updateAnnoTitle2" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">内容</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateAnnoContent2" name="annocontent"  placeholder="请输入公告内容">
                                <label class="control-label" for="updateAnnoContent2" style="display: none;"></label>
                            </div>
                        </div>

<%--                        <div class="form-group">--%>
<%--                            <label for="firstname" class="col-sm-3 control-label">发布时间</label>--%>
<%--                            <div class="col-sm-7">ch>--%>
<%--                                </select>--%>
<%--                                <input type="text" class="form-control" id="updateAnnoTime2" name="annotime"  placeholder="请输入发布时间">--%>
<%--                                <label class="control-label" for="updateAnnoTime2" style="display: none;"></label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

                        <!---------------------表单-------------------->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" id="isaddComplain" onclick="isAddAnno()" >
                            添加
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <script type="text/javascript">
            function isAddAnno(){
                <c:if test="${sessionScope.flag18 != 0}">
                alert("添加公告成功!")
                </c:if>
            }
        </script>

    </form>
    <!--------------------------------------添加的模糊框------------------------>
    <!-------------------------------------------------------------->

    <form class="form-horizontal" method="post" action="infoedit">   <!--保证样式水平不混乱-->
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="updatepwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel1">
                            修改密码
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!--正文-->
                        <input type="hidden" name="tip" value="1">
                        <input type="hidden" name="url" value="admin_book">
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
                        <input type="hidden" name="url" value="admin_book">
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
</div>
</body>
</html>
