var visible = false
console.log('hello niall');

// add event listener to toggleEditVideo button 
$('#toggleEditVideo').on('click', function(event){
    toggleEditVideo();
  });

// function to display editVideo element if not already on display
function toggleEditVideo() {

  var element = $('#editVideo');
  if (visible === true){
    element.slideUp('slow');
  } else if (visible === false){
    element.slideDown('slow');
  }
}