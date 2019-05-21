<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta content="" name="description" />
    <meta content="webthemez" name="author" />
<title>广东教育工委党建工作信息管理系统登录</title>
    <!-- Bootstrap Styles-->
    <link href="${pageContext.request.contextPath}/assets/school/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="${pageContext.request.contextPath}/assets/school/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="${pageContext.request.contextPath}/assets/school/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="${pageContext.request.contextPath}/assets/school/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

<style>
        body{
            background-color: #eee;

        }
        .container{
               /*background-color: #eee;*/
               height:260px;
               display:table;
               
            }
        .row{
             display: table-cell;
             vertical-align: middle;
        }
        #login-form{
            /*margin-top:10px;*/
        }
        #title1{
            color:#c9302c;
            font-size:30px;
            line-height: 25px;
            font-weight:bold;
            text-align: center;
            padding-top:60px;
            
        }
    </style>
    
</head>
<body>
     <div class="row" id="title1">
        <div style="margin-left:460px;width:460px;margin-bottom:24px;">
             
                广&nbsp;东&nbsp;省&nbsp;高&nbsp;校&nbsp;党&nbsp;建&nbsp;信&nbsp;息&nbsp;管&nbsp;理&nbsp;系&nbsp;统
        </div>
    </div>
    <div style="width:860px;height:400px;background-color: white;margin:0 auto;padding-right:10px;">
                <table>
                    <tr>
                        <th style="height: 400px;width:480px;">
                            <div style="background-color: #fff;">
                                <img src="${pageContext.request.contextPath}/assets/school/img/bg4.png" height="400" width="480">
                            </div>
                        </th>
                        <th style="height: 280px;width:250px;padding-left:50px;">
                            <div style="background-color: #fff;">
                                <form action="${pageContext.request.contextPath}/login" method="post" class="form-horizontal" role="form" id="login-form" style="width:210px;">
                                    <div class="form-group">
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon" id="sizing-addon1">
                                            <i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" id="userid" name="userid" value="${cookie.userid.value}" placeholder="请输入用户ID"/>
                                            </br>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-lock"></i></span>
                                            <input type="password" class="form-control" id="password" name="password" value="${cookie.password.value}" placeholder="请输入密码"/>
                                        </div>
                                        <div class="checkbox">
                                           <div class="checkbox3 checkbox-round">
                                            <label>
                                                <input type="checkbox" name="remFlag" id="remFlag" onclick="remember();"/>记住密码
                                            </label>
                                           </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn-sm btn-danger btn-block">登录</button>
                                    </div>
                                     <div class="form-group"> 
                                        <a href="#"> ${reason}</a>
                                    </div>
                                </form>
                            </div>
                        </th>
                    </tr>
                </table>
    </div>
<!-- container -->

   <script src="${pageContext.request.contextPath}/assets/school/js/jquery-1.10.2.js"></script>
    <!-- Bootstrap Js -->
    <script src="${pageContext.request.contextPath}/assets/school/js/bootstrap.min.js"></script>
	 
    <!-- Metis Menu Js -->
    <script src="${pageContext.request.contextPath}/assets/school/js/jquery.metisMenu.js"></script>
    <!-- Custom Js -->
    <script src="${pageContext.request.contextPath}/assets/school/js/custom-scripts.js"></script>

 	<script type="text/javascript">
 	$(document).ready(function(){
        //记住密码功能
        var str = getCookie("loginInfo");
        
        str = str.substring(1,str.length-1);
        var userid = getCookie("userid");//str.split(",")[0];
        var password = getCookie("password");//str.split(",")[1];
        //自动填充用户名和密码
        $("#userid").val(userid);
        $("#password").val(password);
});

//获取cookie
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
    }
    return "";
}

//记住密码功能
function remember(){
    var remFlag = $("input[type='checkbox']").is(':checked');
    if(remFlag==true){ //如果选中设置remFlag为1
        //cookie存用户名和密码,回显的是真实的用户名和密码,存在安全问题.
        var conFlag = confirm("记录密码功能不宜在公共场所(如网吧等)使用,以防密码泄露.您确定要使用此功能吗?");
        if(conFlag){ //确认标志
            $("#remFlag").val("1");
        }else{
            $("input[type='checkbox']").removeAttr('checked');
            $("#remFlag").val("");
        }
    }else{ //如果没选中设置remFlag为""
        $("#remFlag").val("");
    }
}
	</script>
</body>
</html>