// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}


$(document).ready(function(){

	$(".dynamic_add").click(function() {
		var new_id = new Date().getTime();
	  var regexp = new RegExp("new_" + $(this).data("association"),"g");
	 	$(this).parent().before($(this).data("content").replace(regexp, new_id));
		init_tinymce();
	});
	
	$(".add_set").click(function() {
		$("#add_a_set").toggle("slow");
		$(".add_set").toggle();
		$("#four").toggle();
	});

	$("footer ul li#home").remove();
	$("footer ul li#galleries").remove();
	$("footer ul li#maps").remove();
	
	$("footer ul li a").attr("target","_blank");
	$(".group").colorbox({rel:'group',transition:"fade"});
	$("header nav ul li#home a").attr("href","/");
	$("#end_date").click(function() {
	//	alert($("#post_end_at").html());
		if ($('#end_date').is(':checked')) {
			$('#post_end_at_1i').removeAttr('disabled');;
			$('#post_end_at_2i').removeAttr('disabled');;
			$('#post_end_at_3i').removeAttr('disabled');;
		    } else {
		     	$("#post_end_at_1i").attr('disabled', true);
					$("#post_end_at_2i").attr('disabled', true);
					$("#post_end_at_3i").attr('disabled', true);
		    }   
	});
	//$(".mceEditor").markItUp(mySettings);
	//$("section#center p a").attr("target","_blank");
	//$("section#center h1").addClass("title");
});
