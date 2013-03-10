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
//= require chosen-jquery
//= require bootstrap
//= require ace/ace
//= require holder
//= require history_jquery

$(document).ready(function () {
    $('.chzn-select').chosen().change(
    	function(){
	    	var str;
			if($('.chzn-select option:selected').data().syntax == "none"){
				str = null;
			}else{
				str = "ace/mode/"+$('.chzn-select option:selected').data().syntax;
			}
			editor.getSession().setMode(str);
    	});
	var str;
	if($('.chzn-select option:selected').data() != null){
		if($('.chzn-select option:selected').data().syntax == "none"){
			str = null;
		}else{
			str = "ace/mode/"+$('.chzn-select option:selected').data().syntax;
		}
		editor.getSession().setMode(str);
	}
	$('.accordion').on('show hide', function(e){
    	$(e.target).siblings('.solution-heading').find('.accordion-toggle i').toggleClass('icon-angle-down icon-angle-right', 200);
	});
});
