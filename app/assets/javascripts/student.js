$("#uploadBtn input[type='file']").change(function () {
	var oFReader = new FileReader();
	oFReader.readAsDataURL($(this)[0].files[0]);
	oFReader.onload = function (oFREvent) {
	    $("#uploadPreview")[0].src = oFREvent.target.result;
	};
	$("#confirm_upload").show();
    // $("#uploadFile").val($(this).val().split('\\').pop());
}) 
$(".edit_avatar").click(function(){
	$("#uploadBtn input[type='file']").click();
})

function disconnectUser(access_token) {
  var revokeUrl = 'https://accounts.google.com/o/oauth2/revoke?token=' +
      access_token;

  // Perform an asynchronous GET request.
  $.ajax({
    type: 'GET',
    url: revokeUrl,
    async: false,
    contentType: "application/json",
    dataType: 'jsonp',
    success: function(nullResponse) {
      // Do something now that user is disconnected
      // The response is always undefined.
    },
    error: function(e) {
      // Handle the error
      // console.log(e);
      // You could point users to manually disconnect if unsuccessful
      // https://plus.google.com/apps
    }
  });
}
// Could trigger the disconnect on a button click
$('#revokeButton').click(disconnectUser);
