json.id        @comment.id
json.message   @comment.message
json.user_id   @comment.user_id
json.item_id   @comment.item_id
json.user_nickname @comment.user.nickname
json.time @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")