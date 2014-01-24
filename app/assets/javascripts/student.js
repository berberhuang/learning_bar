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