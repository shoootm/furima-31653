import consumer from "./consumer"
consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    //const comment = XHR.response.comment;
    //const user = XHR.response.user;
    const commentDestroy = document.getElementById('comment-destroy');
    const html =
      `<div class="comment-list" >
      <div class="comment-list-user">ユーザー名：${data.user.nickname}</div>
      <div class="comment-list-text">
        <div>コメント：${data.content.text}</div>
      </div>
    </div>`
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment-text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value = '';
  }
});

