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

function LoadTOC() {
    let navigationDiv = document.getElementById("navigation");
    if (navigationDiv !== null) {
        GetResource("../../toc.txt", function (responseText) {
            navigationDiv.innerHTML = responseText;
        });
    }
}

document.addEventListener('DOMContentLoaded', () => {
    LoadTOC();
});

