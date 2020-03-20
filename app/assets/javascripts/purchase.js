$(function() {
  $('.main-flame-all-box-choice-buy-button').on('click', '.button', function(e) {
    if ($('.main-flame-all-box-choice-payment-info').text() != "") {
      var result = window.confirm('購入しますか？');  
      if( result ) {
      }
      else {
        return false;
      }
    } else {
      alert("カード情報を登録してください");
      return false;
    }
  })
})