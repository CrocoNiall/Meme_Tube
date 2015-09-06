var visible = false
console.log('hello niall');



  $('#toggleEditVideo').on('click', function(event){
    toggleEditVideo();
  });






function toggleEditVideo() {

  var element = $('#editVideo');
  if (visible === true){
    element.slideUp('slow');
    visible = false;
  } else if (visible === false){
    element.slideDown('slow');
    visible = false;
  }
}