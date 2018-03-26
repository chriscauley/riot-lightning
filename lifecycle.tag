<greeting>
  <h1>Hello { username }!</h1>
  <div class="messages">
    <a each={ msg, i in messages} href={ msg.url }>{ msg.text }</a>
  </div>

  <script>
    this.on("before-mount",function() {
      this.messages = [];
      if (window.user) {
        this.username = window.user.username;
        var tag = this;
        getMessages.then(function(response) {
          tag.messages = response.messages;
          tag.update();
        });
      } else {
        this.username = "nobody";
      }
    });
  </script>
</greeting>
