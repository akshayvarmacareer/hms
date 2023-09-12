/**
 * 
 */
 

var url_string = window.location;
var url = new URL(url_string);		
var Names = url;//alert(Names);
var t=url.search;
var tvid = url.searchParams.get("id");
console.log(t);
console.log(Names);
console.log(tvid);
 	$.ajax({
		
				type: "GET",
				contentType: "application/json",
				url: "/smc/getVehicleDetails/"+tvid,
				beforeSend: function(request) {
				    request.setRequestHeader("Authorization", token);
				  },
				
				success: function(result) {
					console.log(result);
				obj = JSON.parse(result);

					$("#driver_id").val(obj["driver_id"]);
					$("#insurance_renewal_date").val(obj["insurance_renewal_date"]);
					$("#insurance_valid_date").val(obj["insurance_valid_date"]);
					$("#vehicle_registration_number").val(obj["vehicle_registration_number"]);
					$("#puc_id").val(obj["puc_id"]);
					$("#rto_parsing_number").val(obj["rto_parsing_number"]);
					$("#make_id").val(obj["make_id"]);
					$("#model_id").val(obj["model_id"]);
					$("#zone_id").val(obj["zone_id"]);
					$("#status").val(obj["status"]);
					$("#insurance_number").val(obj["insurance_number"]);
				},
				
				error: function(err){
					console.log(err);
				}
			});