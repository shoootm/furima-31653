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
    const html = `<p class="comment-list">ユーザー名：${data.user.nickname}<br>コメント：${data.content.text}</p>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment-text');
    //const commentlist = document.getElementById('comment-list');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value = '';
  }
});

