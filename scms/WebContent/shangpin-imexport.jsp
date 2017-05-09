<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
    <title>商品进出货</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.jsp" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="index.jsp">首页</a></li>
            </ul>
        </div>
                
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
			
                <li>
                    <ul class="sub-menu">
                        <li><a href="shangpin-insert.jsp"><i class="icon-font">&#xe008;</i>添加商品</a></li>
                        <li><a href="shangpin-design.jsp"><i class="icon-font">&#xe005;</i>查看商品</a></li>
						<li><a href="shangpin-rule.jsp"><i class="icon-font">&#xe006;</i>商品销售规律</a></li>
<%--						shangpin-imexport.jsp--%>
						<li><a href="${pageContext.request.contextPath}/product/findProductList"><i class="icon-font">&#xe017;</i>商品进出货</a></li>
                    </ul>
                </li>
                
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">商品进出货</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="/jscss/admin/design/index" method="post">
                    <table class="search-tab">
                        <tr>
                            
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th>ID</th>
                            <th>商品名称</th>
                            <th>库存</th>
                            <th>进价</th>
                            <th>售价</th>                           
                            <th>已售</th>
							<th>利润</th>                           
                            <th>进出货</th>
                        </tr>
                        <c:forEach items="${list}" var="item">
	                       	<tr>
	                            <td>${item.productId}</td>
	                            <td>${item.name}</td>
	                            <td>${item.count}</td>
	                            <td>${item.bid}</td>
	                            <td>${item.price}</td>
								<td>${item.salecount}</td>
	                            <td>${item.profit}</td>
	                            <td>                            
	                                <input type="button" name="export" value="出货" onclick="reduceProduct(${item.productId});"></input>
									<input type="text" name="number" id="number${item.productId}" count="${item.count}" value=""></input>
									<input type="button" name="import" value="进货" onclick="addProduct(${item.productId});"></input>
	                            </td>
	                        </tr>
                        </c:forEach>
<%--                        <tr>--%>
<%--                            <td>59</td>--%>
<%--                            <td>发哥经典</td>--%>
<%--                            <td>0</td>--%>
<%--                            <td>2</td>--%>
<%--                            <td>1</td>--%>
<%--							<td>2</td>--%>
<%--                            <td>1</td>--%>
<%----%>
<%--                            <td>                            --%>
<%--                                <input type = "submit" name = "export" value = "出货"></input>--%>
<%--								<input type = "text" name = "number" value = ""></input>--%>
<%--								<input type = "submit" name ="import" value ="进货"></input>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>                          --%>
<%--                            <td>58</td>--%>
<%--                            <td >黑色经典</td>--%>
<%--                            <td>0</td>--%>
<%--                            <td>35</td>--%>
<%--							<td>2</td>--%>
<%--                            <td>1</td>--%>
<%--							<td>2</td>--%>
<%--                            <td>--%>
<%--                                <input type = "submit" name = "export" value = "出货"></input>--%>
<%--								<input type = "text" name = "number" value = ""></input>--%>
<%--								<input type = "submit" name ="import" value ="进货"></input>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
                    </table>
<%--                    <div class="list-page"> 2 条 1/1 页</div>--%>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
<script type="text/javascript">
	function reduceProduct(productId){
		var number = $('#number'+productId).val();
		var count = $('#number'+productId).attr('count');
		if(parseInt(number) != number){
			alert("不是数字，请重新输入");
			$('#number'+productId).val('');
			return;
		}
		if(count < number){
			alert("出货数量应该小于出货数");
			$('#number'+productId).val('');
			return;
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/product/reductProductNumber",
			type:"post",
			dataType:"text",
			data:{
				productId:productId,
				number:number
			},
			success:function(data){
				console.log(data);
				if(data == "success"){
					window.location.href="${pageContext.request.contextPath}/product/findProductList";
				}else{
					alert("系统异常，请稍后再试");
				}
				
			}			
		});
	}
	
	function addProduct(productId){
		var number = $('#number'+productId).val();
		if(parseInt(number) != number){
			alert("不是数字，请重新输入");
			$('#number'+productId).val('');
			return;
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/product/addProductNumber",
			type:"post",
			dataType:"text",
			data:{
				productId:productId,
				number:number
			},
			success:function(data){
				console.log(data);
				if(data == "success"){
					window.location.href="${pageContext.request.contextPath}/product/findProductList";
				}else{
					alert("系统异常，请稍后再试");
				}
				
			}			
		});
	}
</script>
</body>
</html>