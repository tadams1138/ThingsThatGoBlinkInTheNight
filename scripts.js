const request = new XMLHttpRequest();
request.onreadystatechange = function() {
    if (this.readyState === 4 && this.status === 200) {
        document.getElementById("navigation").innerHTML = this.responseText;
    }
};
request.open("GET", "../../toc.html", true);
request.send();