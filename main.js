function is_ready() {
  document.querySelectorAll("pre code").forEach(function(element,n) {
    if (element.classList.contains("nuke-html")) {
      var text = element.innerHTML;
    } else {
      var text = element.innerText;
    }
    text = text.replace(/^\n/,'').trimRight();// goodbye starting whitespace
    var to_kill = Infinity;
    var lines = text.replace(/ ([^ ]+)=""/g," $1").split("\n");
    for (var i=0;i<lines.length;i++) {
      if (!lines[i].trim()) { continue; }
      to_kill = Math.min(lines[i].search(/\S/),to_kill);
    }
    out = [];
    for (var i=0;i<lines.length;i++) {
      out.push(lines[i].replace(new RegExp("^ {"+to_kill+"}","g"),""));
    }
    element.innerText = out.join("\n");
  });
  hljs.initHighlightingOnLoad();

  // Full list of configuration options available here:
  // https://github.com/hakimel/reveal.js#configuration
  Reveal.initialize({
    controls: true,
    progress: true,
    history: true,
    center: true,

    transition: 'slide', // none/fade/slide/convex/concave/zoom

    // Optional reveal.js plugins
    dependencies: [
      { src: 'dist/js/classList.js', condition: function() { return !document.body.classList; } },
      { src: 'plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
      { src: 'plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
      //{ src: 'plugin/highlight/highlight.js', async: true, condition: function() { return !!document.querySelector( 'pre code' ); }, callback: function() { hljs.initHighlightingOnLoad(); } },
      { src: 'plugin/zoom-js/zoom.js', async: true },
      { src: 'plugin/notes/notes.js', async: true },
      { src: 'plugin/accessibility-helper/js/accessibility-helper.js', async: true, condition: function() { return !!document.body.classList; } }
    ]
  });
}
var _WROTE = 0;
function write(url) {
  var _id = url.replace(/\./g,"").replace("/","");
  $.get(
    url,
    function(data) {
      $("#"+_id).text(data);
      window._WROTE++;
      if (window._WROTE == _write_urls.length) { is_ready(); }
    },
    "text"
  )
}
for (var url of _write_urls) {
  write(url);
}
