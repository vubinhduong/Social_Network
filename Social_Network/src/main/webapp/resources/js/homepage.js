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
        reader.onload = function (e) {
            $('#file-upload')
                .attr('src', e.target.result)
                .height(150);
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