// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require vendor
//= require select2
//= require ace/ace
//= require holder
//= require history_jquery

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
  $("i").addClass("icon-spin");
}
deluxe_spinning_action.load();
