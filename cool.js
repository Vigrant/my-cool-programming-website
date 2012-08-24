$(document).ready(function(){
	
	processingNumber=1;
	maxProcessing=5;
	
  $("#rightArrow").click(function(){
		/*Move the number up*/
		processingNumber+=1;
		
		if(processingNumber>maxProcessing)
		processingNumber%=maxProcessing;
		
		$("#pHolder").remove();
		$("#pPlacer").append('<canvas id="pHolder" data-processing-sources="_processing/processing'+processingNumber+'.pde"></canvas>');
		
		Processing.reload();
  });
	
	$("#leftArrow").click(function(){
		/*Move the number down*/
		processingNumber-=1;
		if(processingNumber<1)
		processingNumber=maxProcessing;
		
		$("#pHolder").remove();
		$("#pPlacer").append('<canvas id="pHolder" data-processing-sources="_processing/processing'+processingNumber+'.pde"></canvas>');
		
		Processing.reload();
  });
	
	
});