$(function() {
  var actions = [
    "#posts-controller.new-action",
    "#posts-controller.edit-action"
  ];
  
  if (!_.any($(actions).map(function(index, action) {
    return !! $(action)[0]
  }))) {
    return;
  }
  
  $("#highlightCode").click(function(){
    $.SyntaxHighlighter.init({
    'lineNumbers': false,
    'debug': true
    });
  });
  
  new WMD("input", "toolbar", { preview: "preview" });  
});

$(function() {
  $("#note").click(function() {
    $(this).slideUp("slow");
  })
});