var Page = {

				slideToViz: function(line_id, form_id, form_id_2, form_id_3, form_id_4){
					$(line_id).click(function(){
						$(form_id).slideToggle('slow');
						$(form_id_2).slideUp('slow');
						$(form_id_3).slideUp('slow');
						$(form_id_4).slideUp('slow');
					})
				},

				fadeTutorialOnClick: function(class_select, p_fadeOut_id, p_fadeIn_id){
					$(class_select).click(function(){
						$(p_fadeOut_id).fadeOut('slow', function(){
							$(p_fadeIn_id).fadeIn('slow');
						});
					})
				},

				fadeTutorialOnChange: function(class_select, p_fadeOut_id, p_fadeIn_id){
					$(class_select).change(function(){
						$(p_fadeOut_id).fadeOut('slow', function(){
							$(p_fadeIn_id).fadeIn('slow');
						});
					})
				}

};

$(function(){
				// Page.slideToViz('#red-line-container', '#red-line-form');
				Page.slideToViz('#red-line-container', '#red-line-form', '#orange-line-form', '#green-line-form', '#blue-line-form');
				Page.slideToViz('#orange-line-container', '#orange-line-form', '#red-line-form', '#green-line-form', '#blue-line-form');
				Page.slideToViz('#green-line-container', '#green-line-form', '#red-line-form', '#orange-line-form', '#blue-line-form');
				Page.slideToViz('#blue-line-container', '#blue-line-form', '#red-line-form', '#orange-line-form', '#green-line-form');
				Page.fadeTutorialOnClick('.line-container', '#select-line', '#select-station');
				Page.fadeTutorialOnChange('.station-dropdown', '#select-station', '#select-destination');
				Page.fadeTutorialOnClick('input', '#select-destination', '#select-submit');
})