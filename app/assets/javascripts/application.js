// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require_tree .

(function() {
    var ripple, ripples, RippleEffect,loc, cover, coversize, style, x, y, i, num;

    //クラス名rippleの要素を取得
    ripples = document.querySelectorAll('.ripple');

    //位置を取得
    RippleEffect = function(e) {
        ripple = this;//クリックされたボタンを取得
        cover = document.createElement('span');//span作る
        coversize = ripple.offsetWidth;//要素の幅を取得
        loc = ripple.getBoundingClientRect();//絶対座標の取得
        x = e.pageX - loc.left - window.pageXOffset - (coversize / 2);
        y = e.pageY - loc.top - window.pageYOffset - (coversize / 2);
        pos = 'top:' + y + 'px; left:' + x + 'px; height:' + coversize + 'px; width:' + coversize + 'px;';

        //spanを追加
        ripple.appendChild(cover);
        cover.setAttribute('style', pos);
        cover.setAttribute('class', 'rp-effect');//クラス名追加

        //しばらくしたらspanを削除
        setTimeout(function() {
            var list = document.getElementsByClassName( "rp-effect" ) ;
            for(var i =list.length-1;i>=0; i--){//末尾から順にすべて削除
                list[i].parentNode.removeChild(list[i]);
            }}, 2000)};
    for (i = 0, num = ripples.length; i < num; i++) {
        ripple = ripples[i];
        ripple.addEventListener('mousedown', RippleEffect);
    }
}());
