$(document).ready(function() {
  $("#highlightCode").click(function(){
    $.SyntaxHighlighter.init({
    'lineNumbers': false,
    'debug': true
    });
  });
});

  window.onload = function() {
    new WMD("input", "toolbar", { preview: "preview" });
  };