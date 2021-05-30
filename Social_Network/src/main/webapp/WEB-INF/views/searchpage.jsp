<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title> &nbsp; Search | SSN</title>
	<link rel = "icon" href = "<c:url value="/resources/images/icon-logo.ico"/>" type = "image/x-icon">
	<link rel="stylesheet" href="<c:url value="/resources/css/homepage.css"/>" />
	<script src="https://kit.fontawesome.com/64d58efce2.js"
	crossorigin="anonymous"></script>
	<link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="wrapper">
	
	<!-- UPLOAD POST -->

		<div id="post-form" class="post-form">
			<form action="/School_Social_Network/post" method="POST" enctype="multipart/form-data" modelAttribute="myFile">
				<div class="post-header" style="border-bottom: 2px solid #e5e7eb; background-color: #f9fafb;">
					<h3 style="color: #333; margin: auto; font-size: 20px; margin-top: 6px; padding-left: 170px;">Create post</h3>
					<a class="x-btn" onclick="closePost()">x</a>
				</div>
				<div class="post-user">
					<img src="<c:url value="${currentUser.avatar}"/>" style="border-radius: 100%; width: 40px; height: 40px;">
					<div class="username">
						<p>${currentUser.nameShowed}</p>
					</div>
				</div>
				<div class="post-content">
					<textarea placeholder="What's on your mind?" name="content"></textarea>
				</div>
				<div class="post-file">
					<input type="file" onchange="readURL(this);" id="postFile" name="multipartFile" style="width: 100%; margin: 10px 0px 0px 15px;">
					<div class="file-upload">
						<img id="file-upload" src="#" />
					</div>
				</div>
				<div class="post-button">
					<input type="submit" name="" class="submit-btn">
				</div>
			</form>
		</div>
	
	<!-- END UPLOAD POST -->
	
	<!--  RIGHT SIDEBAR -->
		
		<jsp:include page="sidebar.jsp"></jsp:include>
		
	<!-- END RIGHT SIDEBAR -->
		
		<div class="main_content">
		
	<!--  MAIN HEADER -->
			<jsp:include page="header.jsp"></jsp:include>

			<div class="content" style="max-width: 1000px;">
				<h1 style="font-size: 1.5rem; color: #000; margin-top: 0px; margin-left: 100px;">People</h1>
				<div class="content-main" style="display: flex; min-height: 100vh;">
					<div class="newfeed" style="margin-left: 100px;">
					
						<div class="post">
							<c:forEach items="${listUserSearch}" var="user" begin="1" end="4" varStatus="loop">
								<div class="post-header" style="padding-bottom: 1.2rem;">
									<div class="avatar-icon" style="width: 45px; height: 45px;">
										<div class="avatar-icon-1">
											<img src="<c:url value="${user.avatar}"/>" style="width: 100%; height: 100%; border-radius: 100%;">
										</div>
									</div>
								<div style="float: left; padding: 0px 0px 0px 15px;">
									<a href="/School_Social_Network/profile?userId=${user.userId}">${user.nameShowed}</a>
								</div>		
								<div style="float: right; margin-top: 8px; font-size: 14px;">
		                            <a class="follow-btn" href="/School_Social_Network/follow?userId=${user.userId}" style="padding: 0.3rem 1rem; background-color: #ec4899; color: #fff;">Follow</a>
		                        </div>
		                        <div style="width: 150px; font-size: 13px; position: relative; top: -6px; left: 15px;">
									<p style="color: #666; height: 0px;">${user.address}</p>
								</div>
								</div>
								<c:if test="${loop.index != 4}">
									<hr class="hr-right">
								</c:if>
							</c:forEach>
						</div>
					
					<!--  POSTS  -->
						<h1 style="font-size: 1.5rem; color: #000; margin-top: 0px;">Posts</h1>
						<c:forEach items="${listPostSearch}" var="postNF">
							<div class="post">
								<div class="post-header">
									<div class="avatar-icon">
										<div class="avatar-icon-1">
											<img src="<c:url value="${postNF.userPosted.avatar}"/>" style="width: 100%; height: 100%; border-radius: 100%;">
										</div>
									</div>
									<div style="float: left; padding: 0px 0px 0px 15px;">
										<a href="/School_Social_Network/userId=${postNF.userPosted.userId}">${postNF.userPosted.nameShowed}</a>
									</div>		
									<div style="float: right; margin-top: 5px; font-size: 20px;">
	                                	<i class="fas fa-ellipsis-h"></i>
	                                </div>
	                                <div style="width: 150px; font-size: 13px; position: relative; top: -6px; left: 15px;">
										<p style="color: #666; height: 0px;">${postNF.timeAgo}</p>
									</div>
								</div>
								<div class="caption">
									<p>${postNF.content}</p>
								</div>
								<img src="<c:url value="${postNF.image}"/>" style="width: 100%;">
								<div class="post-below" style="padding: 0.75rem 1rem;">
									<div class="post-action" style="height: 30px;">
											<input type="hidden" value="${postNF.postID}" id="postIDLike${postNF.postID}">
											<input type="hidden" value="${currentUser.userId}" id="userIDLike${postNF.postID}">
											<a class="likeBtn" id="${postNF.postID}" style="display: flex; width: 100px; 
											<c:if test="${postNF.likeYet == false}">
												color: rgb(51, 51, 51); 
											</c:if>
											<c:if test="${postNF.likeYet == true}">
												color: rgb(5, 113, 237);
											</c:if>
											float: left; padding-left: 10px;"> 
		                                		                                
		                                        <div>
		                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
		                                                <path d="M2 10.5a1.5 1.5 0 113 0v6a1.5 1.5 0 01-3 0v-6zM6 10.333v5.43a2 2 0 001.106 1.79l.05.025A4 4 0 008.943 18h5.416a2 2 0 001.962-1.608l1.2-6A2 2 0 0015.56 8H12V4a2 2 0 00-2-2 1 1 0 00-1 1v.667a4 4 0 01-.8 2.4L6.8 7.933a4 4 0 00-.8 2.4z" />
		                                            </svg>
		                                        </div>
		                                        <div style="margin-left: 15px; font-weight: bold;"> Like</div>
		                                    </a>
	                                    <a href="#" style="display: flex; width: 100px; color: #333; float: left;">
	                                        <div class="p-2 rounded-full text-black">
	                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
	                                                <path fill-rule="evenodd" d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z" clip-rule="evenodd" />
	                                            </svg>
	                                        </div>
	                                        <div style="margin-left: 15px; font-weight: bold;"> Comment</div>
	                                    </a>
	                                    <a href="#" style="display: flex; width: 100px; color: #333; float: right;">
	                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="22" height="22" class="dark:text-gray-100">
	                                            <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
	                                        </svg>
	                                        <div style="margin-left: 15px; font-weight: bold;"> Share</div>
	                                    </a>
									</div>
									<div style="margin: 8px 0px 15px 10px;">
										<input type="hidden" id="numOfLike${postNF.postID}" value="${postNF.liked}"/>
										<input type="hidden" id="currentName${postNF.postID}" value="${currentUser.nameShowed}"/>
										<p style="color: #666; letter-spacing: 0.3px;" id="likeBy${postNF.postID}">
										<c:if test="${postNF.latestLikeUser != null && postNF.liked > 1}">
											Liked by <strong>${postNF.latestLikeUser}</strong> and <strong>${postNF.liked - 1} Others</strong>
										</c:if>
										<c:if test="${postNF.liked == 1}">
											Liked by <strong>${postNF.latestLikeUser}</strong>
										</c:if>
										</p>
									</div>
									<hr style="border: none; background-color: #e5e7eb; height: 1px;"> 
									
								</div>
							</div>
						</c:forEach>
						
					<!--  END POSTS  -->
						
					</div>			

					
				</div>
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/js/homepage.js"/>" src="app.js"></script>
</body>
</html>