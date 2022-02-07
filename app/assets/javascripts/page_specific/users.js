$(function(){
  $('#user_avatar').on('change',function(){
    try {
      var fileName = $(this)[0].files[0].name;
    } catch(e) {
      var fileName = $(this).val();
      console.log(e);
    }
    //get the file name and replace the "Choose a file" label
    $(this).next('.custom-file-label').html( fileName );
  });
});
