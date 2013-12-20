var Page = {

				toggleViz: function(line_id, form_id){
					$(line_id).click(function(){
						$(form_id).toggle();
					})
				}

};

$(function(){
				Page.toggleViz('#red-line-container', '#red-line-form');
				Page.toggleViz('#orange-line-container', '#orange-line-form');
				Page.toggleViz('#green-line-container', '#green-line-form');
				Page.toggleViz('#blue-line-container', '#blue-line-form');
})