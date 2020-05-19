const setCookie = function (key, value) {
    let date = new Date();
    date.setTime(date.getTime() + 365 * 24 * 3600 * 1000);
    document.cookie = key + '=' + value + '; expires=' + date.toGMTString() + '; path=/';
};

function getCookie(name) {
    let arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    return (arr = document.cookie.match(reg)) ? unescape(arr[2]) : null;
}

function checkIfEmpty() {
    let input = document.getElementsByClassName("mdui-textfield-input")
    for (i = 0; i < input.length; i++) {
        if (input[i].value.length !== 0) {
            input[i].parentElement.classList.add("mdui-textfield-not-empty");
        }
    }
}