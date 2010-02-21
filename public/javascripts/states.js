$(document).ready(function() {
//	$("#state_panel").corner();
//	$("#state_panel_wrapper").corner();
//	$("#state_panel").corner("round 10px").parent().css('padding', '3px').corner("round 10px")
	$("#state_body").focus(function() {
		$(this).animate({height:'40px'},100);
	});
	$("#state_body").blur(function() {
		$(this).animate({height:'30px'},100);
	});
	$("#state_body").keyup(function() {
	  $("#state_num").text($("#state_body").val().length);
	});

});
