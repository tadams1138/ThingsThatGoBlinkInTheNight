function GetResource(url, OnSuccess) {
    const request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            OnSuccess(this.responseText);
        }
    };
    request.open("GET", url, true);
    request.send();
}

function LoadTOC(url) {
    let navigationDiv = document.getElementById("navigation");
    if (navigationDiv !== null) {
        GetResource(url, function (responseText) {
            navigationDiv.innerHTML = responseText;
        });
    }
}

