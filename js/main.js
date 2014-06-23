$(function(){
	$(".slideshow").each(function(){
		var $slides = $(this).find("img"),
		slideCount = $slides.length,
		currentIndex = 0;
		$slides.eq(currentIndex).fadeIn();
		setInterval(showNextSlide, 7500);

		function showNextSlide(){
			var nextIndex = (currentIndex + 1) % slideCount;
			$slides.eq(currentIndex).fadeOut();
			$slides.eq(nextIndex).fadeIn();
			currentIndex = nextIndex;
		}
	});



	$(".info").each(function(){
		var $imges = $(this).find("a");
		var duration = 300;
		$imges.on("mouseover", function(){
			$(this).find("span").stop(true).animate({
				opacity: 1
			}, duration);

		})
		.on("mouseout", function(){
			$(this).find("span").stop(true).animate({
				opacity: 0
			}, duration);
		});

	});


});


