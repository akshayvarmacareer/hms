/**
 * 
 */

 $(function () {
        $("#yes").click(function () {
            if ($(this).is(":checked")) {
                $("#permission").show();
				
			
                
            }
			else {
                $("#permission").hide();
               
            }
			
			
        });
		
		
		
    });
	
	 $(function () {
        $("#gridCheck1").click(function () {
            if ($(this).is(":checked")) {
                $("#list").show();
				
			
                
            }
			else {
                $("#list").hide();
               
            }
			
			
        });
		
		
		
    });
	 $(function () {
        $("#gridCheck2").click(function () {
            if ($(this).is(":checked")) {
                $("#create").show();
				
			
                
            }
			else {
                $("#create").hide();
               
            }
			
			
        });
		
		
		
    });
 $(function () {
        $("#gridCheck3").click(function () {
            if ($(this).is(":checked")) {
                $("#edit").show();
				
			
                
            }
			else {
                $("#edit").hide();
               
            }
			
			
        });
		
		
		
    });
	 $(function () {
        $("#gridCheck4").click(function () {
            if ($(this).is(":checked")) {
                $("#approve").show();
				
			
                
            }
			else {
                $("#approve").hide();
               
            }
			
			
        });
		
		
		
    });
	 $(function () {
        $("#gridCheck5").click(function () {
            if ($(this).is(":checked")) {
                $("#delete").show();
				
			
                
            }
			else {
                $("#delete").hide();
               
            }
			
			
        });
		
		
		
    });
	 $(function () {
        $("#gridCheck6").click(function () {
            if ($(this).is(":checked")) {
                $("#reject").show();
				
			
                
            }
			else {
                $("#reject").hide();
               
            }
			
			
        });
		
		
		
    });
	 $(function () {
        $("#gridCheck7").click(function () {
            if ($(this).is(":checked")) {
                $("#view").show();
				
			
                
            }
			else {
                $("#view").hide();
               
            }
			
			
        });
		
		
		
    });
     function myFunction1() {
  document.getElementById("yes").disabled = true;
}
function myFunction2() {
  document.getElementById("yes").disabled = false;
}