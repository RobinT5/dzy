<%@page import="Pojo.artical"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBUtils.GetStatementObject"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%
	Statement statement = new GetStatementObject().getStatementObject();
	String sql = "select * from artical";
	artical techartical;
	artical emotionartical;
	artical lifeartical;
	int cid;
	String title;
	ResultSet resultSet = statement.executeQuery(sql);
	ArrayList<artical> techlist = new ArrayList<artical>();
	ArrayList<artical> lifelist = new ArrayList<artical>();
	ArrayList<artical> emotionlist = new ArrayList<artical>();
	while (resultSet.next()) {
		techartical = new artical();
		cid = resultSet.getInt(1);
		title = resultSet.getString(3);
		if (resultSet.getInt(2) == 1) {
			techartical.setcid(cid);
			techartical.setTitle(title);
			techlist.add(techartical);
		}
		if (resultSet.getInt(2) == 2) {
			emotionartical = new artical();
			emotionartical.setcid(cid);
			emotionartical.setTitle(title);
			emotionlist.add(emotionartical);
		}
		if (resultSet.getInt(2) == 3) {
			lifeartical = new artical();
			lifeartical.setcid(cid);
			lifeartical.setTitle(title);
			lifelist.add(lifeartical);
		}
	}
	request.setAttribute("techlist", techlist);
	request.setAttribute("emotionlist", emotionlist);
	request.setAttribute("lifelist", lifelist);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>个人主页-唐豪</title>
<!-- CSS -->
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/index.css" rel="stylesheet">
</head>

<body>
	<div class="blog-masthead">
		<div class="container">
			<nav class="blog-nav">
				<a class="blog-nav-item active" href="">首页</a> <a
					class="blog-nav-item" href="#part1">生活</a> <a class="blog-nav-item"
					href="#part2">旅行</a> <a class="blog-nav-item" href="#part3">技术</a>
					<a class="blog-nav-item pull-right" href="/dzy/logout">注销</a>
			</nav>
		</div>
	</div>
	<div class="intr">
		<span class="avtar"></span>
		<p class="peointr">我叫唐豪</p>
		<p class="peointr">爱生活，爱旅行，爱技术。</p>
	</div>
	<div class="title" id="part1">爱生活</div>
	<div class="content">
		<a href="pageone.html">
			<div class="pic pic1">
				<img src="../image/h1.jpg" alt="">
				<p>家乡-笔锋塔下</p>
			</div>
		</a> <a href="pageone.html">
			<div class="pic pic2">
				<img src="../image/h2.jpg" alt="">
				<p>家乡-襄河河畔</p>
			</div>
		</a> <a href="pageone.html">
			<div class="pic pic3">
				<img src="../image/h3.jpg" alt="">
				<p>家乡-太平桥岸</p>
			</div>
		</a>
	</div>
	<div class="title" id="part2">爱旅行</div>
	<div class="content">
		<a href="pagetwo.html">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="../image/s1.jpg" alt="...">
					</div>
					<div class="item">
						<img src="../image/s2.jpg" alt="...">
					</div>
					<div class="item">
						<img src="../image/s3.jpg" alt="...">
					</div>
				</div>
			</div>
		</a>
	</div>
	<div class="title" id="part3">爱技术</div>
	<div class="content">
		<ul class="nav nav-tabs" role="tablist">
			<li class="active"><a href="#home" role="tab" data-toggle="tab">技术</a></li>
			<li><a href="#profile" role="tab" data-toggle="tab">感情</a></li>
			<li><a href="#messages" role="tab" data-toggle="tab">人生</a></li>
			<li style="height: 100%; line-height: 100%" class="pull-right"><a
				href="addartical.html">添加随笔</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="home">
				<c:forEach items="${techlist}" var="item" varStatus="status">
					<p class="text">
						<a href="/dzy/artical?cid=${item.cid}">${item.title}</a>
					</p>
				</c:forEach>

			</div>
			<div class="tab-pane" id="profile">
				<c:forEach items="${emotionlist}" var="item" varStatus="status">
					<p class="text">
						<a href="/dzy/artical?cid=${item.cid}">${item.title}</a>
					</p>
				</c:forEach>
			</div>
			<div class="tab-pane" id="messages">
				<c:forEach items="${lifelist}" var="item" varStatus="status">
					<p class="text">
						<a href="/dzy/artical?cid=${item.cid}">${item.title}</a>
					</p>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="blog-footer">
		<p>
			by <a href="#none">15220810017唐豪</a>.
		</p>
	</div>
	<a href="" class="btt">顶部</a>
	<!-- Js-->
	<script src="../javascript/jquery/2.0.0/jquery.min.js"></script>
	<script src="../javascript/bootstrap/3.3.6/bootstrap.min.js"></script>
	<script src="../javascript/plugin.js"></script>
</body>
</html>