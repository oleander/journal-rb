$(document).ready(function() {
  $("#highlightCode").click(function(){
    $.SyntaxHighlighter.init({
    'lineNumbers': false,
    'debug': true
    });
  });
  
  new WMD("input", "toolbar", { preview: "preview" });
});