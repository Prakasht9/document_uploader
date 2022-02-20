$(function(){
  $("#new_comments_container").on('click', '.cancel_comment', function(){
    $(this).closest('#new_comments_container').html('')
  });
});
