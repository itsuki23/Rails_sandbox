
// jquery でのスクロール時の画像表示

$(function () {
   $(window).scroll(function () {
       $('.fadein').each(function () {
           let targetElement = $(this).offset().top;
           let scroll = $(window).scrollTop();
           let windowHeight = $(window).height();
           if (scroll > targetElement - windowHeight + 200){
               $(this).css('opacity', '1');
               $(this).css('transform','translateY(0)');
           }
       });
   });
});


// js でのスクロール時の画像表示

// const scrollAnimationElm = document.querySelectorAll('.sa');
// const scrollAnimationFunc = function() {
//     for(let i = 0; i < scrollAnimationElm.length; i++) {
//         const triggerMargin = 300;
//         if (window.innerHeight > scrollAnimationElm[i].getBoundingClientRect().top + triggerMargin) {
//             scrollAnimationElm[i].classList.add('show');
//         }
//     }
// };
// window.addEventListener('load', scrollAnimationFunc);
// window.addEventListener('scroll', scrollAnimationFunc);

// 参考
// http://noze.space/archives/415
// querySelectorAll セレクタのリストを集める
// ブラウザウインドウのビューポートの高さ
// getBoundingClient cssの境界ボックスを取得
// a.classList querySelectorAllで集めたリスト
// add classListのメソッド