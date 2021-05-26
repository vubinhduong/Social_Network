<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" href="<c:url value="/resources/css/homepage.css"/>" />
	<script src="https://kit.fontawesome.com/64d58efce2.js"
	crossorigin="anonymous"></script>
	<link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
	<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
</head>
<body>
	<div class="wrapper">
	
	<!-- UPLOAD POST -->

		<div id="post-form" class="post-form">
			<form>
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
					<textarea placeholder="What's on your mind?"></textarea>
				</div>
				<div class="post-file">
					<input type="file" onchange="readURL(this);" id="postFile" name="filename" style="width: 100%; margin: 10px 0px 0px 15px;">
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
	
		<div class="sidebar">
			<div class="logo" style="background-image: url('<c:url value="/resources/images/logo.jpg"/>');">
				
			</div>
			<div class="sidebar_inner">
				<div class="sidebar_content">
					<div class="my_profile">
						<div class="left_avatar">
							<div style="width: 91%; height: 91%; background-color: #fff; border-radius: 100%; padding: 3px; margin-top: 1px; margin-left: 1px;">
								<img src="<c:url value="${currentUser.avatar}"/>" style="width: 100%; height: 100%; border-radius: 100%;">
							</div>
						</div>
						<div class="avatar_item1">
							<p style="font-weight: bold; font-size: 1.25rem; margin-top: 0.7rem">${currentUser.nameShowed}</p>
						</div>
						<div class="avatar_item2">
							<div class="avatar_item3">
								<p>
									<strong>Post</strong>
									<div>${numPost}</div>
								</p>
							</div>
							<div style="margin-left: -10px;" class="avatar_item3">
								<p>
									<strong>Following</strong>
									<div>${currentUser.following}</div>
								</p>
							</div>
							<div class="avatar_item3">
								<p>
									<strong>Followers</strong>
									<div>${currentUser.follower}</div>
								</p>
							</div>
						</div>
					</div>
					<ul>
						<li class="active"><a href="">
							<div class="icon-left">
								<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z" />
                            </svg>
                            </div>
							<span>News Feed</a></span>
						</li>
						<li><a href="">
							<div class="icon-left">
								<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                            	</svg>
							</div>
							<span>Search</a></span>
						</li>
						<li><a href="">
							<div class="icon-left">
								<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M17.657 18.657A8 8 0 016.343 7.343S7 9 9 10c0-2 .5-5 2.986-7C14 5 16.09 5.777 17.656 7.343A7.975 7.975 0 0120 13a7.975 7.975 0 01-2.343 5.657z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M9.879 16.121A3 3 0 1012.015 11L11 14H9c0 .768.293 1.536.879 2.121z" />
                            </svg>

							</div>
							<span>Trending</a></span>
						</li>
						<li><a href="">
							<div class="icon-left">
								<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                            </svg>
                            </div>
							<span>Setting</a></span>
						</li>
						<li><a href="">
							<div class="icon-left">
								<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
	                                stroke="currentColor">
	                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
	                                    d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
	                            </svg>
                            </div>
							<span>My Profile</a></span>
						</li>
						<li style="border-bottom: 2px solid #f0f2f5"><a href=""></a></li>
						<li><a href=""></a></li>
						<li><a href="">
							<div class="icon-left">
								<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
	                                stroke="currentColor">
	                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
	                                    d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
	                            </svg>
                            </div>
							<span>Log out</a></span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main_content">
			<div class="main_header">
				<div class="header_inner">
					<div class="left_side">
						<div class="header_search">
							<input class="search_bar" type="text" placeholder="Search...">
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                    stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                                </svg>
                            </div>
						</div>
					</div>
					<div class="right_side">
						<button class="upload_btn" onclick="uploadPost()">Upload</button>
							<a onclick="showNotifiFunction()" href="#" class="header-links-item" style="color: #464646; width: 30px; height: 37px; padding: 8px 30px 0px 35px;">
                            	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor">
                                	<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                            	</svg>
                        	</a>
                        	<div id="notifi-header" class="mess-header" style="left: 1050px;">
                        		<h4 class="message-title">Notification</h4>
                        		<ul class="dropdown_scrollbar" data-simplebar style="margin-top: 0.5rem;">
	                                <li>
	                                    <a href="#" style="display: flex;">
	                                        <div class="drop_avatar"> <img class="avatar-mess" src="avatar2.jpg" alt="">
	                                        </div>
	                                        <div class="drop_content">
	                                            <p class="message-drop-content"> <strong>Barack Obama</strong>
	                                            	Trà đá hông?
	                                            </p>
	                                            <span class="time-ago-2"> 2 hours ago </span>
	                                        </div>
	                                    </a>
	                                </li>
	                                <li>
	                                    <a href="#" style="display: flex;">
	                                        <div class="drop_avatar"> <img class="avatar-mess" src="avatar2.jpg" alt="">
	                                        </div>
	                                        <div class="drop_content">
	                                            <p class="message-drop-content"> <strong>Barack Obama</strong>
	                                            	Trà đá hông?
	                                            </p>
	                                            <span class="time-ago-2"> 2 hours ago </span>
	                                        </div>
	                                    </a>
	                                </li>
	                                <li>
	                                    <a href="#" style="display: flex;">
	                                        <div class="drop_avatar"> <img class="avatar-mess" src="avatar2.jpg" alt="">
	                                        </div>
	                                        <div class="drop_content">
	                                            <p class="message-drop-content"> <strong>Barack Obama</strong>
	                                            	Trà đá hông?
	                                            </p>
	                                            <span class="time-ago-2"> 2 hours ago </span>
	                                        </div>
	                                    </a>
	                                </li>
	                                <li>
	                                    <a href="#" style="display: flex;">
	                                        <div class="drop_avatar"> <img class="avatar-mess" src="avatar2.jpg" alt="">
	                                        </div>
	                                        <div class="drop_content">
	                                            <p class="message-drop-content"> <strong>Barack Obama</strong>
	                                            	Trà đá hông?
	                                            </p>
	                                            <span class="time-ago-2"> 2 hours ago </span>
	                                        </div>
	                                    </a>
	                                </li>
	                            </ul>
                        	</div>
                        	<a onclick="showMessFunction()" href="#" class="header-links-item" style="color: #464646; width: 30px; height: 37px; padding: 8px 20px 0px 0px;">
                            	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                stroke="currentColor">
                                	<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z" />
                            	</svg>
                        	</a>
                        	<div id="mess-header" class="mess-header">
                        		<h4 class="message-title">Messages</h4>
                        		<ul class="dropdown_scrollbar" data-simplebar style="margin-top: 0.5rem;">
	                                <li>
	                                    <a href="#" style="display: flex;">
	                                        <div class="drop_avatar"> <img class="avatar-mess" src="avatar2.jpg" alt="">
	                                        </div>
	                                        <div class="drop_content">
	                                            <p class="message-drop-content"> <strong>Barack Obama</strong>
	                                            <time class="time-ago"> 6:43 PM </time>
	                                            <br>
	                                            Trà đá hông?
	                                            </p>
	                                        </div>
	                                    </a>
	                                </li>
	                                <li>
	                                    <a href="#" style="display: flex;">
	                                        <div class="drop_avatar"> <img class="avatar-mess" src="avatar2.jpg" alt="">
	                                        </div>
	                                        <div class="drop_content">
	                                            <p class="message-drop-content"> <strong>Barack Obama</strong>
	                                            <time class="time-ago"> 6:43 PM </time>
	                                            <br>
	                                            Trà đá hông?
	                                            </p>
	                                        </div>
	                                    </a>
	                                </li>
	                                <li>
	                                    <a href="#" style="display: flex;">
	                                        <div class="drop_avatar"> <img class="avatar-mess" src="avatar2.jpg" alt="">
	                                        </div>
	                                        <div class="drop_content">
	                                            <p class="message-drop-content"> <strong>Barack Obama</strong>
	                                            <time class="time-ago"> 6:43 PM </time>
	                                            <br>
	                                            Trà đá hông?
	                                            </p>
	                                        </div>
	                                    </a>
	                                </li>
	                                <li>
	                                    <a href="#" style="display: flex;">
	                                        <div class="drop_avatar"> <img class="avatar-mess" src="avatar2.jpg" alt="">
	                                        </div>
	                                        <div class="drop_content">
	                                            <p class="message-drop-content"> <strong>Barack Obama</strong>
	                                            <time class="time-ago"> 6:43 PM </time>
	                                            <br>
	                                            Trà đá hông?
	                                            </p>
	                                        </div>
	                                    </a>
	                                </li>
	                            </ul>
                        	</div>
                        	<a href="#" class="avatar">
                        		<img src="<c:url value="${currentUser.avatar}"/>" class="avatar-img">
                        	</a>
					</div>
				</div>
			</div>

			<div class="content">
				<h1 style="font-size: 1.5rem; color: #000; margin-top: 0px;">Newfeed</h1>
				<div class="content-main" style="display: flex; min-height: 100vh;">
					<div class="newfeed">
					
					<!--  POSTS  -->
						<c:forEach items="${listPostNF}" var="postNF">
							<div class="post">
								<div class="post-header">
									<div class="avatar-icon">
										<div class="avatar-icon-1">
											<img src="<c:url value="${postNF.userPosted.avatar}"/>" style="width: 100%; height: 100%; border-radius: 100%;">
										</div>
									</div>
									<div style="float: left; padding: 0px 0px 0px 15px;">
										<a href="#">${postNF.userPosted.nameShowed}</a>
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
										<a href="#" style="display: flex; width: 100px; color: #333; float: left; padding-left: 10px;"> 
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
										<p style="color: #666; letter-spacing: 0.3px;">Liked by <strong>${postNF.latestLikeUser}</strong> and <strong>${postNF.liked - 1} Others</strong></p>
									</div>
									<hr style="border: none; background-color: #e5e7eb; height: 1px;"> 
									
									<c:forEach items="${postNF.comments}" var="cmt">
										<div class="post-comment">
											<img src="<c:url value="${cmt.userComment.avatar}"/>" style="border-radius: 100%; width: 40px; height: 40px;">
											<div class="comment">
												<p>${cmt.detail}</p>
												<div class="rotate45"></div>
											</div>
										</div>
									</c:forEach>
									
									<div class="comment-bar">
										<input class="comment-input" type="text" placeholder="Add your comment.." name="">
										<div class="send-icon">
											<i class="far fa-paper-plane"></i>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						
					<!--  END POSTS  -->
						
					</div>

					

					<div class="rightbar">
						<div class="post">
							<div class="post-header" style="border-bottom: 2px solid #e5e7eb; background-color: #f9fafb;">
								<h3 style="color: #333; margin: 5px;">Who to follow</h3>
							</div>
							
							<% for(int i = 0; i < 4; i++) { %>
							<div class="right-bar-item">
								<img src="<c:url value="/resources/images/avatar2.jpg"/>" style="border-radius: 100%; width: 40px; height: 40px;">
								<div style="padding: 0px 0px 0px 15px; width: 500px; margin-top: -5px;">
									<a href="#">Barack Obama</a>
								</div>		
                                <div style="width: 150px; font-size: 13px; position: relative; top: 15px; left: -122px;">
									<p style="color: #666;">America</p>
								</div>
								<a class="follow-btn">Follow</a>
							</div>
							<% if(i != 3) { %>
							<hr class="hr-right">
							<% } %>
							<% } %>
						</div>

						<div class="post">
							<div class="post-header" style="border-bottom: 2px solid #e5e7eb; background-color: #f9fafb;">
								<h3 style="color: #333; margin: 5px;">Trending now</h3>
							</div>
							<% for(int i = 0; i < 4; i++) { %>
							<div class="right-bar-item">
								<a href="" style="padding-left: 20px;">#Giải tích III</a>
							</div>
							<% if (i != 3) { %>
							<hr class="hr-right">
							<% } %>
							<% } %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/js/homepage.js"/>" src="app.js"></script>
</body>
</html>