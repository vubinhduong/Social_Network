$('.send-icon').on('click', function() {
	var thisID = jQuery(this).attr("id");
	var content = $('#' + thisID + 'content').val();
	var userID = $('#currentUserID').val();
	var postID = $('#post' + thisID).val();
	var currentName = $('#currentUserNameShowed').val();
	var currentAvatar = $('#currentUserAvatar').val();
	var x = document.getElementById('new' + thisID);
	var oldValue = x.innerHTML;
	var newValue = oldValue + "<div class='post-comment'> <img src='/School_Social_Network" + currentAvatar + "' style='border-radius: 100%; width: 40px; height: 40px;'> <div class='comment'> <p>" + content + "</p> <div class='rotate45'></div> </div> </div>";
	x.innerHTML = newValue;
	$.ajax({
		url : "/School_Social_Network/ajax/comment",
		method : "POST",
		data : {
			postID : postID,
			userID : userID,
			content : content
		}
	});
});
	
	
$('.likeBtn').on('click', function() {
	var thisID = jQuery(this).attr("id");
	var userID = $('#userIDLike' + thisID).val();
	var postID = $('#postIDLike' + thisID).val();
	var numOfLike = $('#numOfLike' + thisID).val();
	var currentName = $('#currentName' + thisID).val();
	var x = document.getElementById(postID);
	if (x.style.color == "rgb(51, 51, 51)") {
		x.style.color = "rgb(5, 113, 237)";
		if(numOfLike == 0)
			document.getElementById("likeBy" + thisID).innerHTML = "Liked by <strong>" + currentName + "</strong>";
		else
			document.getElementById("likeBy" + thisID).innerHTML = "Liked by <strong>" + currentName + "</strong> and <strong>" + numOfLike + " Others</strong>";
	}
	else {
		x.style.color = "rgb(51, 51, 51)";	
		if(numOfLike <= 1)
			document.getElementById("likeBy" + thisID).innerHTML = "";
		else 
			document.getElementById("likeBy" + thisID).innerHTML = "Liked by <strong>" + (numOfLike - 1) + " people</strong>";
	}
	$.ajax({
		url : "/School_Social_Network/ajax/like",
		method : "POST",
		data : {
			userID : userID,
			postID : postID
		}
	});
});

function showMessFunction() {
	var x = document.getElementById("mess-header");
	var y = document.getElementById("notifi-header");
	if (x.style.display === "none") {
		x.style.display = "block";
	} else {
		x.style.display = "none";
	}
	if (y.style.display === "block") {
		y.style.display = "none";
	}
}

function showNotifiFunction() {
	var x = document.getElementById("notifi-header");
	var y = document.getElementById("mess-header");
	if (x.style.display === "none") {
		x.style.display = "block";
	} else {
		x.style.display = "none";
	}
	if (y.style.display === "block") {
		y.style.display = "none";
	}
}

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#file-upload').attr('src', e.target.result).height(150);
		};
		reader.readAsDataURL(input.files[0]);
	}
}

function closePost() {
	var x = document.getElementById("post-form");
	x.style.display = "none";
}

function uploadPost() {
	var x = document.getElementById("post-form");
	if (x.style.display === "none") {
		x.style.display = "block";
	} else {
		x.style.display = "none";
	}
}
