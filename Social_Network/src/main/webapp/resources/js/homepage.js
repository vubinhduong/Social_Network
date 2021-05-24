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