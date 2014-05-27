// vertical scroll
// $(document).ready(function(){

// 	$('section[data-type="background"]').each(function(){
// 		var $bgobj = $(this); // assigning the object
		
// 		$(window).scroll(function(){
// 			var yPos = -($window.scrollTop() / $bgobj.data('speed'));
			
// 			// Put together our final background position
// 			var coords = '50% ' + yPos + 'px';

// 			// Move the background
// 			$bgobj.css({backgroundPosition: coords});
// 		});
// 	});
// });

$(document).ready(function(){
	// Cache the Window object
	$window = $(window);

	$('section[data-type="background"]').each(function(){
		var $bgobj = $(this); // assigning the object

		$(window).scroll(function(){

			// Scroll the background at var speed
			// the xPos is a negative value because we're scrolling it UP!
			var xPos = -($window.scrollLeft() / $bgobj.data('speed'));

			// Put together our final backgroud position
			var coords = xPos + 'px 50% ';

			// Move the background
			$bgobj.css({ backgroundPosition: coords});
		});
	});
});