<!-- somewhere in body -->
<message-list show="unread"></message-list>
<messag-list></message-list>

<!-- after body, with other javascript-->
<script type="tag/riot" src="message-list.tag"></script>
<script>
  riot.mount("message-list", {
    show: "all",
    messages: window.user.messages,
  });
</script>
