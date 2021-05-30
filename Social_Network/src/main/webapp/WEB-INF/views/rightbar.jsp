<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="rightbar">
	<div class="post">
		<div class="post-header"
			style="border-bottom: 2px solid #e5e7eb; background-color: #f9fafb;">
			<h3 style="color: #333; margin: 5px;">Who to follow</h3>
		</div>

		<c:forEach items="${suggestFollowing}" var="sf" begin="1" end="4"
			varStatus="loop">
			<div class="right-bar-item">
				<img src="<c:url value="${sf.avatar}"/>"
					style="border-radius: 100%; width: 40px; height: 40px;">
				<div
					style="padding: 0px 0px 0px 15px; width: 800px; margin-top: -5px;">
					<a href="/School_Social_Network/profile?userId=${sf.userId}">${sf.nameShowed}</a>
					<p style="color: #666; font-size: 13px; margin-top: -4px;">${sf.address}</p>
				</div>

				<a class="follow-btn"
					href="/School_Social_Network/follow?userId=${sf.userId}">Follow</a>
			</div>
			<c:if test="${loop.index != 4}">
				<hr class="hr-right">
			</c:if>
		</c:forEach>
	</div>

	<div class="post">
		<div class="post-header"
			style="border-bottom: 2px solid #e5e7eb; background-color: #f9fafb;">
			<h3 style="color: #333; margin: 5px;">Trending now</h3>
		</div>
		<c:forEach items="${trendingContent}" var="tc" begin="0" end="3"
			varStatus="loop">
			<div class="right-bar-item">
				<a href="/School_Social_Network/trend?content=${tc}" style="padding-left: 20px;">#${tc}</a>
			</div>
			<c:if test="${loop.index != 3}">
				<hr class="hr-right">
			</c:if>
			<c:if test="${loop.index == 3}">
				<br>
			</c:if>
		</c:forEach>
	</div>
</div>