const inst = new mdui.Drawer('#drawer');
document.getElementById("folder").addEventListener('click', function () {
    inst.toggle();
});
const drawer = document.getElementById('drawer');
drawer.addEventListener('open.mdui.drawer', function () {
    console.log('open');
});
drawer.addEventListener('opened.mdui.drawer', function () {
    console.log('opened');
});
drawer.addEventListener('close.mdui.drawer', function () {
    console.log('close');
});
drawer.addEventListener('closed.mdui.drawer', function () {
    console.log('closed');
});

$$('.viewsource').on('click', function () {
    let $this = $$(this);
    $this.parents('.doc-example').eq(0).toggleClass('doc-example-showcode');
});
const setCookie = function (key, value) {
    var date = new Date();
    date.setTime(date.getTime() + 365 * 24 * 3600 * 1000);
    document.cookie = key + '=' + value + '; expires=' + date.toGMTString() + '; path=/';
};

function getCookie(name) {
    let arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    return (arr = document.cookie.match(reg)) ? unescape(arr[2]) : null;
}