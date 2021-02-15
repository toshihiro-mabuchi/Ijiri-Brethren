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
//= require jquery3
//= require summernote/summernote-bs4.min
//= require summernote-init
// load specific locale(ja-JP)
//= require summernote/lang/summernote-ja-JP
//= require activestorage
// layout関連
//= require libs/hero-slider
//= require libs/mobile-menu
//= require libs/scroll
//= require libs/text-animation
//= require main
//= require vendors/scroll-polyfill
//= require vendors/swiper.min
//= require vendors/TweenMax.min
// layout関連ここまで
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
// require_treeは無効にします。
// require_tree .

document.addEventListener("turbolinks:load", function() {
  // location.reload();
})
// 'page:restore'

// flashメッセージをフェードアウトで消す。
$(function(){
  setTimeout("$('.alert').fadeOut('slow')", 7000);
});