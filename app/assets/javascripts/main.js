var Page = {

				toggleViz: function(line_id, form_id){
					$(line_id).click(function(){
						$(form_id).toggle();
					})
				}

};

$(function(){
				Page.toggleViz('#red-line-container', '#red-line-form');
})