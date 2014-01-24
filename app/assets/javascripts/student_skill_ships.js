$(document).ready(function(){
    $('.skill_controll_panel').find($('a')).click(function(){
        console.log("test");
        $('.skill_controll_panel').editable($(this));
        $(this).parent().hide();
    });
});
var editable=function(target){
	var description_obj=target.parents('.skill_item').find('.description');
	var region=description_obj.find('p:first');
	var content = region.html(); // notice "this" instead of a specific #myDiv
    var editableText = $("<textarea />");

    var button_container='<div class="edit_button row"></div>';
    var cancel=function(){
	    description_obj.find('textarea').replaceWith($('<p>').append(content));
	    description_obj.find('.edit_button').remove();
    };
    

    var save=function(){
    	var description=description_obj.find('textarea').val();
    	var id=target.data('id');
    	var url='/students/'+target.data('student-id')+'/skills/'+id;
    	$.ajax({url:url,
    		type:'put',
    		data:{id:id,description:description}
    	});
    	content=description;
    	cancel();
    };

	var cancel_button=$('<a class="button">Cancel</a>').click(cancel);
	var save_button=$('<a class="button">Save</a>').click(save);

	b_c=$(button_container);
	b_c.append(cancel_button);
	b_c.append(save_button);

	b_c.appendTo(description_obj);

    editableText.val(content);
    region.replaceWith(editableText);
    editableText.focus();	
};

var clickSkillRadio=function(){
	$("#other_skill_input:first").attr("disabled", $("#other_skill:checked").length==0);
}