<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="main_header">
	<div class="header_inner">
		<div class="left_side">
			<div class="header_search">
			<form action="/School_Social_Network/search">
				<input class="search_bar" type="text" placeholder="Search..." name="input">
				<div class="icon">
					<svg xmlns="http://www.w3.org/2000/svg" fill="none"
						viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"
							d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                                </svg>
				</div>
			</form>	
			</div>
		</div>
		<div class="right_side">
			<button class="upload_btn" onclick="uploadPost()">Upload</button>
			<a onclick="showNotifiFunction()" href="#" class="header-links-item"
				style="color: #464646; width: 30px; height: 37px; padding: 8px 30px 0px 35px;">
				<svg xmlns="http://www.w3.org/2000/svg" fill="none"
					viewBox="0 0 24 24" stroke="currentColor">
                                	<path stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2"
						d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                            	</svg>
			</a>
			<div id="notifi-header" class="mess-header" style="left: 1050px;">
				<h4 class="message-title">Notification</h4>
				<ul class="dropdown_scrollbar" data-simplebar
					style="margin-top: 0.5rem;">
					<c:forEach items="${listNoti}" var="noti" begin="0" end="3">
					<li><a href="/School_Social_Network/postDetail?postID=${noti.postID}" style="display: flex;">
							<div class="drop_avatar">
								<img class="avatar-mess" src="<c:url value="${noti.avatar}"/>" alt="">
							</div>
							<div class="drop_content">
								<p class="message-drop-content">
									<strong>${noti.nameShowed}</strong> ${noti.content}
								</p>
								<span class="time-ago-2"> ${noti.timeAgo} </span>
							</div>
					</a></li>
					</c:forEach>
				</ul>
			</div>
			<a onclick="showMessFunction()" href="#" class="header-links-item"
				style="color: #464646; width: 30px; height: 37px; padding: 8px 20px 0px 0px;">
				<svg xmlns="http://www.w3.org/2000/svg" fill="none"
					viewBox="0 0 24 24" stroke="currentColor">
                                	<path stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2"
						d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z" />
                            	</svg>
			</a>
			<div id="mess-header" class="mess-header">
				<h4 class="message-title">Messages</h4>
				<ul class="dropdown_scrollbar" data-simplebar
					style="margin-top: 0.5rem;">
					<li><a href="#" style="display: flex;">
							<div class="drop_avatar">
								<img class="avatar-mess" src="<c:url value="/resources/images/avatar2.jpg"/>" alt="">
							</div>
							<div class="drop_content">
								<p class="message-drop-content">
									<strong>Barack Obama</strong>
									<time class="time-ago"> 6:43 PM </time>
									<br> Trà đá hông?
								</p>
							</div>
					</a></li>
					<li><a href="#" style="display: flex;">
							<div class="drop_avatar">
								<img class="avatar-mess" src="<c:url value="/resources/images/avatar2.jpg"/>" alt="">
							</div>
							<div class="drop_content">
								<p class="message-drop-content">
									<strong>Barack Obama</strong>
									<time class="time-ago"> 6:43 PM </time>
									<br> Trà đá hông?
								</p>
							</div>
					</a></li>
					<li><a href="#" style="display: flex;">
							<div class="drop_avatar">
								<img class="avatar-mess" src="<c:url value="/resources/images/avatar2.jpg"/>" alt="">
							</div>
							<div class="drop_content">
								<p class="message-drop-content">
									<strong>Barack Obama</strong>
									<time class="time-ago"> 6:43 PM </time>
									<br> Trà đá hông?
								</p>
							</div>
					</a></li>
					<li><a href="#" style="display: flex;">
							<div class="drop_avatar">
								<img class="avatar-mess" src="<c:url value="/resources/images/avatar2.jpg"/>" alt="">
							</div>
							<div class="drop_content">
								<p class="message-drop-content">
									<strong>Barack Obama</strong>
									<time class="time-ago"> 6:43 PM </time>
									<br> Trà đá hông?
								</p>
							</div>
					</a></li>
				</ul>
			</div>
			<a href="/School_Social_Network/profile?userId=${currentUser.userId}" class="avatar"> <img
				src="<c:url value="${currentUser.avatar}"/>" class="avatar-img">
			</a>
		</div>
	</div>
</div>