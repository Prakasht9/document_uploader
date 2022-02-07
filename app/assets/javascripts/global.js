$(document).ajaxError(function (e, xhr, settings, thrownError) {
  if (xhr.status == 401) { location.reload() }
});


$(function(){
  if( $("#documents_container").length > 0 ) {
    $('#documents_container .pagination a').on("click", function(){
      $.getScript(this.href);
      return false;
    });
  }
});
