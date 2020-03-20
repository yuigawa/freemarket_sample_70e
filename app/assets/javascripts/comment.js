$(function() {
  function buildHTML(comment) {
    var html = `
                <li class="main__content__main__comment-box__contents__content" data-id="${comment.id}">
                  <div class="main__content__main__comment-box__contents__content--name">
                    <a href="/users/${comment.user_id}">${comment.user_nickname}</a>
                  </div>
                  <div class="main__content__main__comment-box__contents__content--comment">
                    ${comment.message}
                  </div>
                </li>
                `;

    return html;
  }


  $('#new_comment').on('submit', function(e) {
    if ($('#comment-text').val() != "" ) {
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
      $.ajax({
        url: url,
        type: 'POST',
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data) {
        var html = buildHTML(data);
        $('#comments-box').append(html);
        console.log($('form'));
        $('#comment-text').val("");
      })
      .fail(function() {
        alert("コメントの送信に失敗しました");
      });
    } else {
      alert("コメントを記入してください");
      return false;
    }
  })
})