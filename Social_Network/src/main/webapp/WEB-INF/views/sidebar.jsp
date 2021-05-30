<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="sidebar">
	<div class="logo"
		style="background-image: url('<c:url value="/resources/images/logo.jpg"/>');">

	</div>
	<div class="sidebar_inner">
		<div class="sidebar_content">
			<div class="my_profile">
				<div class="left_avatar">
					<div
						style="width: 91%; height: 91%; background-color: #fff; border-radius: 100%; padding: 3px; margin-top: 1px; margin-left: 1px;">
						<img src="<c:url value="${currentUser.avatar}"/>"
							style="width: 100%; height: 100%; border-radius: 100%;">
					</div>
				</div>
				<div class="avatar_item1">
					<p
						style="font-weight: bold; font-size: 1.25rem; margin-top: 0.7rem">${currentUser.nameShowed}</p>
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
				<li class="active"><a href="/School_Social_Network/homepage">
						<div class="icon-left">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none"
								viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z" />
                            </svg>
						</div> <span>News Feed 
				</a></span></li>
				<li><a href="#">
						<div class="icon-left">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none"
								viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                            	</svg>
						</div> <span>Search 
				</a></span></li>
				<li><a href="/School_Social_Network/trending">
						<div class="icon-left">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none"
								viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									d="M17.657 18.657A8 8 0 016.343 7.343S7 9 9 10c0-2 .5-5 2.986-7C14 5 16.09 5.777 17.656 7.343A7.975 7.975 0 0120 13a7.975 7.975 0 01-2.343 5.657z" />
                                <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									d="M9.879 16.121A3 3 0 1012.015 11L11 14H9c0 .768.293 1.536.879 2.121z" />
                            </svg>

						</div> <span>Trending 
				</a></span></li>
				<li><a href="">
						<div class="icon-left">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none"
								viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                                <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                            </svg>
						</div> <span>Setting 
				</a></span></li>
				<li><a href="/School_Social_Network/profile?userId=${currentUser.userId}">
						<div class="icon-left">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none"
								viewBox="0 0 24 24" stroke="currentColor">
	                                <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
	                            </svg>
						</div> <span>My Profile 
				</a></span></li>
				<li style="border-bottom: 2px solid #f0f2f5"><a href=""></a></li>
				<li><a href=""></a></li>
				<li><a href="/School_Social_Network/logout">
						<div class="icon-left">
							<svg xmlns="http://www.w3.org/2000/svg" fill="none"
								viewBox="0 0 24 24" stroke="currentColor">
	                                <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
	                            </svg>
						</div> <span>Log out 
				</a></span></li>
			</ul>
		</div>
	</div>
</div>
