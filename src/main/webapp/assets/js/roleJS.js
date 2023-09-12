/**
 * 
 */
 function myFunction()
{
	var myCheckData=document.getElementById("myCheck");
	var text=document.getElementById("textDisplay");
	
	if(myCheckData.checked==true)
	{
		text.style.display="block";
	}
	
	else
	{
		text.style.display="none";
	}
	var myCheckData2=document.getElementById("myCheck2");
	var text2=document.getElementById("textDisplay2");
	if(myCheckData2.checked==true)
	{
		text2.style.display="block";
	}
	
	else
	{
		text2.style.display="none";
	}
	var myCheckCreate=document.getElementById("myCheckCreate");
	var textCreate=document.getElementById("textCreate");
	if(myCheckCreate.checked==true)
	{
		textCreate.style.display="block";
	}
	
	else
	{
		textCreate.style.display="none";
	}
	var myCheckApprove=document.getElementById("myCheckApprove");
	var textApprove=document.getElementById("textApprove");
	if(myCheckApprove.checked==true)
	{
		textApprove.style.display="block";
	}
	
	else
	{
		textApprove.style.display="none";
	}
	var myCheckReject=document.getElementById("myCheckReject");
	var textReject=document.getElementById("textReject");
	if(myCheckReject.checked==true)
	{
		textReject.style.display="block";
	}
	
	else
	{
		textReject.style.display="none";
	}
	var myCheckVehicle=document.getElementById("myCheckVehicle");
	var textVehicle=document.getElementById("textDisplayVehicle");
	if(myCheckVehicle.checked==true)
	{
		textVehicle.style.display="block";
	}
	
	else
	{
		textVehicle.style.display="none";
	}
	var myCheckVehicles=document.getElementById("myCheckVehicles");
	var textVehicles=document.getElementById("textDisplayVehicles");
	
	if(myCheckVehicles.checked==true)
	{
		textVehicles2.style.display="block";
		  
	}
	
	else
	{
		textVehicles.style.display="none";
		
	}
	
}

$(function () {
        $("#myVehicleMake").click(function () {
            if ($(this).is(":checked")) {
                $("#textData").show();
				  
                
            } else {
                $("#textData").hide();
               
            }
			
			
        });
		
		
		
    });/*End of MAin Function*/
	
$(function () {
        $("#myCheckVehicles22").click(function () {
            if ($(this).is(":checked")) {
                $("#textDataVehicle").show();
				
			
                
            } else {
                $("#textDataVehicle").hide();
               
            }
			
			
        });
		
		
		
    });
       
   $(function () {
        $("#myVehicleType").click(function () {
            if ($(this).is(":checked")) {
                $("#textDataType").show();
				
			
                
            } else {
                $("#textDataType").hide();
               
            }
			
			
        });
		
		
		
    });
	$(function () {
        $("#myVehicleRepair").click(function () {
            if ($(this).is(":checked")) {
                $("#textDataRepair").show();
				
			
                
            } else {
                $("#textDataRepair").hide();
               
            }
			
			
        });
		
		
		
    });	
	$(function () {
        $("#myVehicleIndent").click(function () {
            if ($(this).is(":checked")) {
                $("#textDataIndent").show();
				
			
                
            } else {
                $("#textDataIndent").hide();
               
            }
			
			
        });
		
		
		
    });	
	$(function () {
        $("#myVehicleWork").click(function () {
            if ($(this).is(":checked")) {
                $("#textDataWork").show();
				
			
                
            } else {
                $("#textDataWork").hide();
               
            }
			
			
        });
		
		
		
    });	
		$(function () {
        $("#myVehicleChallan").click(function () {
            if ($(this).is(":checked")) {
                $("#textDataChallan").show();
				
			
                
            } else {
                $("#textDataChallan").hide();
               
            }
			
			
        });
		
		
		
    });
	$(function () {
        $("#myVehicleInspection").click(function () {
            if ($(this).is(":checked")) {
                $("#textDataInspection").show();
				
			
                
            } else {
                $("#textDataInspection").hide();
               
            }
			
			
        });
		
		
		
    });
	$(function () {
        $("#myVehicleLedger").click(function () {
            if ($(this).is(":checked")) {
                $("#textDataLedger").show();
				
			
                
            } else {
                $("#textDataLedger").hide();
               
            }
			
			
        });
		
		
		
    });
	