var Page = {

				toggleViz: function(line_id, form_id){
					$(line_id).click(function(){
						$(form_id).toggle();
					})
				},

				// slideToViz: function(line_id, form_id){
				// 	$(line_id).click(function(){
				// 		if ($(form_id).is(':hidden')){
				// 			$(form_id).slideDown('slow');
				// 		} else {
				// 			$(form_id).hide();
				// 		}
				// 	})
				// }

				slideToViz: function(line_id, form_id){
					$(line_id).click(function(){
						$(form_id).slideToggle('slow');
					})
				}

};

$(function(){
				Page.slideToViz('#red-line-container', '#red-line-form');
				Page.slideToViz('#orange-line-container', '#orange-line-form');
				Page.slideToViz('#green-line-container', '#green-line-form');
				Page.slideToViz('#blue-line-container', '#blue-line-form');
})