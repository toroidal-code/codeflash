$(document).ready(function () {
    $("#profilelang").select2();
    $('#solutionlang').select2().change(
    	function(){
	    	var str;
			if($('#solutionlang option:selected').data().syntax == "none"){
				str = null;
			}else{
				str = "ace/mode/"+$('#solutionlang option:selected').data().syntax;
			}
			if(typeof(editor) != 'undefined'){
				editor.getSession().setMode(str);
			}
    	});
	var str;
	if($('#solutionlang option:selected').data() != null){
		if($('#solutionlang option:selected').data().syntax == "none"){
			str = null;
		}else{
			str = "ace/mode/"+$('#solutionlang option:selected').data().syntax;
		}
		if(typeof(editor) != 'undefined'){
			editor.getSession().setMode(str);
		}
	}
	$('.accordion').on('expand collapse', function(e){
    	$(e.target).siblings('.solution-heading').find('.accordion-toggle i').toggleClass('icon-angle-down icon-angle-right', 200);
	});

	$('.icon-heart-empty').hover( function(e){
    	$(this).toggleClass('icon-heart icon-heart-empty', 200);
	}, function(){
		$(this).toggleClass('icon-heart icon-heart-empty', 200);
	});

	$('.icon-heart').hover( function(e){
    	$(this).toggleClass('icon-heart icon-heart-empty', 200);
	}, function(){
		$(this).toggleClass('icon-heart icon-heart-empty', 200);
	});
});

var deluxe_spinning_action = new Konami();
deluxe_spinning_action.code = function() {
  $('i[class^="icon-"], i[class*=" icon-"]').addClass('icon-spin');
  $('img').addClass('spin');
}
deluxe_spinning_action.load();
