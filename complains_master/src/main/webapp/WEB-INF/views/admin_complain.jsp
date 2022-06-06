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
                                <div class="col-lg-7 form-group">
                                    <label class="col-lg-4 control-label" for="query_bname">工单信息</label>
                                    <div class="col-lg-8">
                                        <input class="form-control" id="complainSth" name="complainSth" type="text" value="">
                                        <label class="control-label" for="query_bname" style="display: none;"></label>
                                    </div>
                                </div>
                                <div class="col-lg-3 form-group">

                                    <button type="submit" class="btn btn-primary" id="btn_query" onclick="">查询</button>
                                </div>
                                <div class="col-lg-3 form-group">

                                    <button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal" data-target="#addModal">添加工单</button>
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
                            <th>工单编号</th>
                            <th>工单来源</th>
                            <th>联系人</th>
                            <th>联系电话</th>
                            <th>工单状态</th>
                            <th>工单类型</th>
                            <th>工单详情</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <%
                            ArrayList<ComplainBean> complainData=null;
                            ArrayList<ComplainBean> complainBeanList2=(ArrayList<ComplainBean>) request.getAttribute("complainList2");
                            ArrayList<ComplainBean> complainBeanList=(ArrayList<ComplainBean>)  request.getAttribute("complainList");
                            complainData=complainBeanList2;
                            if (complainData==null){

                                complainData=complainBeanList;
                            }
                            else {
                                complainData=complainBeanList2;
                            }
                        %>

                        <c:forEach var="complains" items="<%=complainData%>">
                        <tbody>
                        <td>${complains.number}</td>
                        <td>${complains.income}</td>
                        <td>${complains.contact}</td>
                        <td>${complains.tel}</td>
                        <td>
                            <c:if test="${complains.status ==0}">未处理</c:if>
                            <c:if test="${complains.status ==1}">处理中</c:if>
                            <c:if test="${complains.status ==2}">已完成</c:if>
                        </td>
                        <td>${complains.type}</td>
                        <td>${complains.content}</td>
                        <td><button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#updateModal"
                                    id="btn_update" onclick="showInfo2('${complains.number}','${complains.income}','${complains.type}','${complains.contact}','${complains.tel}'
                                ,'${complains.content}',${complains.cid})">修改</button>
                            <button type="button" class="btn btn-danger btn-xs" onclick="deletebook(${complains.cid})">删除</button>
<%--                            <button type="button" class="btn btn-info btn-xs" onclick="showInfo2()">下发</button>--%>
                            <button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#sendModal"
                                    id="btn_send" onclick="showInfo3('${complains.number}','${complains.income}','${complains.type}','${complains.contact}','${complains.tel}'
                                    ,'${complains.content}',${complains.cid})">下发</button>
                        </td>
                        </tbody>
                        </c:forEach>
                    </table>
<%--                    <ul class="pagination">--%>
<%--                        <c:forEach var="pageNumber" begin="1" end="${pageInfo.pages} " step="1">--%>
<%--                            &lt;%&ndash;                        <ul class="pagination">&ndash;%&gt;--%>
<%--                            <li><a href="${pageContext.request.contextPath}/admin_complain?page=${pageNumber}$size=${pageInfo.pageSize}">${pageNumber}</a></li>--%>
<%--                            &lt;%&ndash;                        </ul>&ndash;%&gt;--%>
<%--                        </c:forEach>--%>
<%--                    </ul>--%>
                        <ul class="pagination">
                            <li><a href="#">«</a></li>
                            <li><a href="#">1</a></li>
                            <li><a class="active" href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">6</a></li>
                            <li><a href="#">7</a></li>
                            <li><a href="#">»</a></li>
                        </ul>
                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        function showInfo2(complainNum,complainIncome,complainType,complainContact,complainTel,complainContent,cid) {
            document.getElementById("updateComplainNum").value = complainNum;
            document.getElementById("updateIncome").value = complainIncome;
            document.getElementById("updateType").value = complainType;
            document.getElementById("updateContact").value = complainContact;
            document.getElementById("updateTel").value = complainTel;
            document.getElementById("updateContent").value = complainContent;
            document.getElementById("updateComplainId").value = cid;
        }
        function deletebook(cid) {
            con=confirm("是否删除?");
            if(con==true){
                location.href = "${pageContext.request.contextPath}/deleteComplains?cid="+cid;
            }
            <c:if test="${sessionScope.flag2!=0}">
            alert("删除成功!")
            </c:if>
        }

        function showInfo3(complainNum,complainIncome,complainType,complainContact,complainTel,complainContent,cid) {
            document.getElementById("sendComplainNum").value = complainNum;
            document.getElementById("sendIncome").value = complainIncome;
            document.getElementById("sendType").value = complainType;
            document.getElementById("sendContact").value = complainContact;
            document.getElementById("sendTel").value = complainTel;
            document.getElementById("sendContent").value = complainContent;
            document.getElementById("sendComplainId").value = cid;
        }
    </script>
    <!-- 修改模态框（Modal） -->
    <!-------------------------------------------------------------->

    <!-- 修改模态框（Modal） -->
    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/updateComplainsById">   <!--保证样式水平不混乱-->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="updateModalLabel">
                            修改工单信息
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">工单编号</label>
                            <div class="col-sm-7">
                                <input type="hidden" id="updateComplainId" name="complainId">
                                <input type="text" class="form-control" id="updateComplainNum" name="complainNum"  placeholder="请输入工单编号">
                                <label class="control-label" for="updateComplainNum" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">工单来源</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateIncome" name="complainIncome"  placeholder="请输入工单来源">
                                <label class="control-label" for="updateIncome" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">工单类型</label>
                            <div class="col-sm-7">
                                <select class="form-control" id="updateType" name="complainType" onPropertyChange="showValue(this.value)">
                                    <option value="0">请选择</option>
                                    <c:forEach var="type" items="${typeList}">
                                        <option value="${type.typename}">${type.typename}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label" for="updateType" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">联系人</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateContact" name="complainContact" placeholder="请输入联系人">
                                <label class="control-label" for="updateContact" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">联系电话</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateTel" name="complainTel"  placeholder="请输入联系电话">
                                <label class="control-label" for="updateTel" style="display: none;"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">工单详情</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="updateContent" name="complainContent"  placeholder="请输入工单详情">
                                <label class="control-label" for="updateContent" style="display: none;"></label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" onclick="isUpdata()" >
                            修改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </form>
    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/sendComplainsByName">   <!--保证样式水平不混乱-->
        <div class="modal fade" id="sendModal" tabindex="-1" role="dialog" aria-labelledby="sendModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="sendModalLabel">
                            下发工单
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">工单编号</label>
                            <div class="col-sm-7">
                                <input type="hidden" id="sendComplainId" name="sendcomplainId">
                                <input type="text" class="form-control" readonly="readonly" id="sendComplainNum" name="complainNum1"  placeholder="请输入工单编号">
                                <label class="control-label" for="sendComplainNum" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">工单来源新的表单</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" readonly="readonly" id="sendIncome" name="complainIncome1"  placeholder="请输入工单来源">
                                <label class="control-label" for="updateIncome" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">工单类型</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" readonly="readonly" id="sendType" name="complainType1" placeholder="请输入工单类型">
                                <label class="control-label" for="sendType" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">联系人</label>
                            <div class="col-sm-7">
                                <select class="form-control" id="sendContact" name="complainContact1" onPropertyChange="showValue(this.value)">
                                    <option value="0">请选择</option>
                                    <c:forEach var="commonAdmin" items="${commonAdminList}">
                                        <option value="${commonAdmin.realname}">${commonAdmin.realname}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label" for="sendContact" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">联系电话</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="sendTel" name="complainTel1"  placeholder="请输入联系电话">
                                <label class="control-label" for="sendTel" style="display: none;"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">工单详情</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="sendContent" readonly="readonly" name="complainContent1"  placeholder="请输入工单详情">
                                <label class="control-label" for="sendContent" style="display: none;"></label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-info" onclick="isSend()" >
                            下发
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </form>
    <script type="text/javascript">
        function isSend(){
            <c:if test="${sessionScope.flag11  != 0}">
            alert("下发成功!")
            </c:if>
        }

    </script>
    <!-------------------------------------------------------------->

    <!--------------------------------------添加的模糊框------------------------>
    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/addComplains">   <!--保证样式水平不混乱-->
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            添加新工单
                        </h4>
                    </div>
                    <div class="modal-body">

                        <!---------------------表单-------------------->

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">工单编号</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addISBN" required="required" name="complainNumber" placeholder="请输入工单编号">
                                <label class="control-label" for="addISBN" style="display: none;"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">工单来源</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addComplainsName" required="required" name="income"  placeholder="请输入工单来源">
                                <label class="control-label" for="addComplainsName" style="display: none;"></label>
                            </div>
                        </div>


<%--                        <div class="form-group">--%>
<%--                            <label for="firstname" class="col-sm-3 control-label">联系人员</label>--%>
<%--                            <div class="col-sm-7">--%>
<%--                                <input type="text" class="form-control" id="addContact" required="required" name="contact"  placeholder="请输入联系人员">--%>
<%--                                <label class="control-label" for="addContact" style="display: none;"></label>--%>
<%--                            </div>--%>
<%--                        </div>--%>


<%--                        <div class="form-group">--%>
<%--                            <label for="firstname" class="col-sm-3 control-label">联系电话</label>--%>
<%--                            <div class="col-sm-7">--%>
<%--                                <input type="text" class="form-control" id="addTel" required="required" name="tel"  placeholder="请输入联系电话">--%>
<%--                                <label class="control-label" for="addTel" style="display: none;"></label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">工单类型</label>
                            <div class="col-sm-7">
                                <select class="form-control" id="addComlainsType" name="type">
                                    <option value="无分类">请选择</option>
                                    <c:forEach var="type" items="${typeList}">
                                        <option value="${type.typename}">${type.typename}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label" for="addComlainsType" style="display: none;"></label>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="firstname" class="col-sm-3 control-label">工单详情</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="addContent" required="required" name="content" placeholder="请输入工单详情">
                                <label class="control-label" for="addContent" style="display: none;"></label>
                            </div>
                        </div>

                        <!---------------------表单-------------------->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" id="isaddComplain" onclick="isAddComplains()" >
                            添加
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <script type="text/javascript">
            function isAddComplains(){
                <c:if test="${sessionScope.flag != 0}">
                alert("添加工单成功!")
                </c:if>
            }
        </script>

    </form>
    <!--------------------------------------添加的模糊框------------------------>
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
