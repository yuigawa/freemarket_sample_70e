$(function() {
  function buildHTML(comment) {
    var html = `
                <li class="main__content__main__comment-box__contents__content" data-id="${comment.id}">
                  <div class="main__content__main__comment-box__contents__content__name">
                    <a href="/users/${comment.user_id}">${comment.user_nickname}</a>
                  </div>
                  <div class="main__content__main__comment-box__contents__content__comment">
                    ${comment.message}
                    <div class="main__content__main__comment-box__contents__content__comment__delete" data-id="${comment.id}" data-item-id="${comment.item_id}" style="display: none;">
                      削除
                  </div>
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

  $(document).on({
    "mouseenter": function() {
      var id = $(this).data('id');
      $(`.main__content__main__comment-box__contents__content__comment__delete[data-id="${id}"]`).show();     
    },
    "mouseleave": function() {
      var id = $(this).data('id');
      $(`.main__content__main__comment-box__contents__content__comment__delete[data-id="${id}"]`).hide();  
    }
  }, '.main__content__main__comment-box__contents__content')

  $(document).on('click', '.main__content__main__comment-box__contents__content__comment__delete', function(e) {
    e.preventDefault();
    var id = $(this).data('id');
    var item_id = $(this).data('item-id');
    url = `/items/${item_id}/comments/${id}`;
    $.ajax({
      url: url,
      type: 'DELETE',
      data: {id: id},
      dataType: 'json'
    })
    .done(function() {
      $(`.main__content__main__comment-box__contents__content[data-id="${id}"]`).remove();
    })
    .fail(function() {
      alert("コメントの削除に失敗しました");
    });
  })
})