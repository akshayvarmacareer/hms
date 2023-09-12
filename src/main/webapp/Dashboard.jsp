<%@page import="org.json.JSONArray"%>
<%@page import="servlets.ApiCalls"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dashboard</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="assets/styles/css/themes/lite-purple.min.css">
    <link rel="stylesheet" href="assets/styles/vendor/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/styles/vendor/datatables.min.css">
	<link rel="stylesheet" href="assets/styles/vendor/dropzone.min.css">
	<link rel="stylesheet" href="assets/styles/vendor/sweetalert2.min.css">
</head>
 <%@ include file="html/load.html" %>
<body>

<%
if(session.getAttribute("user") !=null){
ApiCalls user = new ApiCalls();
boolean isValid = user.validateUser(session.getAttribute("user").toString(), session.getAttribute("sToken").toString());
if(session.getAttribute("user")!=null  && isValid && session.getAttribute("group_id")!=null && session.getAttribute("Entity_id")!=null){
	
	String alldevice_group = user.getdeviceGroupData(session.getAttribute("user").toString(), session.getAttribute("sToken").toString(), session.getAttribute("Entity_id").toString(),session.getAttribute("group_id").toString());
	JSONArray alldevicegroupArray =  new JSONArray(alldevice_group);
	String allcustomer = user.getcustomerUpdate(session.getAttribute("user").toString(), session.getAttribute("sToken").toString(), session.getAttribute("group_id").toString(),session.getAttribute("Entity_id").toString());
	JSONArray allcustomerAarry = new JSONArray(allcustomer);
	String TDGDevices = user.getTDGDevice(session.getAttribute("user").toString(),session.getAttribute("sToken").toString(), session.getAttribute("Entity_id").toString(),
			session.getAttribute("group_id").toString());
			
	JSONArray AllTDGDevices = new JSONArray(TDGDevices);
%>
<div class="main-header">
		<div class="logo px-2" style="width:152px;height:50px">
			<img src="/superus_Black.png" alt="" class="w-100">
		</div>


		<div style="margin: auto"></div>

		<div class="header-part-right">
			<!-- Grid menu Dropdown -->
			<div class="dropdown"></div>
			<div class="dropdown">
				<div class="user colalign-self-end">
					<img src="./assets/images/74235.png" id="userDropdown" alt=""
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="userDropdown">
						<div class="dropdown-header">
							<i class="i-Lock-User mr-1"></i> User Profile
						</div>
						<a class="dropdown-item" href="ChangePassword.jsp">Change
							Password</a> <a class="dropdown-item" href="index.jsp">Sign out</a>
					</div>
				</div>
			</div>
		</div>

	</div>

<div class="col-12 mx-auto">
         
                    <div class="card mb-12">
                        <div class="card-body">
                            <div class="card-title text-center">Device List</div>
							<br>
							  <div class="tab-content">
								<div class="tab-pane active" id="about">
								<table id="zero_configuration_table" class="display table table-striped table-bordered" style="width:100%">
									<thead>
										<tr>
											<th scope="col">Device Name</th>
											<th scope="col">Mac Address</th>
											<th scope="col">Last Image</th>
											<th scope="col">Actions</th>
										</tr>
									</thead>
									<tbody>
									<%for(Object obj : AllTDGDevices){ 
											JSONObject jsonObject = (JSONObject) obj;
										%>
										<tr>
											<td><%=jsonObject.get("DeviceName") %></td>
											<td><%=jsonObject.get("Mac_address") %></td>
											<td>
												<a data-toggle="modal" data-target="#templatePreview" href="#"
													onclick="getImage('<%=jsonObject.get("LatestImagePath")%>')"><img
														src="<%=jsonObject.get("LatestImagePath")%>"
														height="250px" width="250px" /></a>
											</td>
											<td>
												<a class="dropdown-item ul-widget__link--font" data-toggle="modal" onclick="getDeviceImages('<%=jsonObject.get("Device_id")%>')" data-whatever="@mdo">
													<i class="i-Data-Save"> </i>
														Update Image
												</a>  
											</td>
										</tr>										
										<% }%>
									</tbody>
								</table>
									<form class="needs-validation" id="customerForm" method="post" autocomplete="off" novalidate>
									
									</form>
                                </div>
                           </div>
						</div>
					</div>
				</div>
				<div class="modal fade" id="templatePreview" tabindex="-1"
					role="dialog" aria-labelledby="templatePreview" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">

							<div class="modal-body">

								<img src="" height="auto" id="ShowImage" width="auto"  />
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>

							</div>
						</div>
					</div>
				</div>

</body>


<script src="assets/js/vendor/jquery-3.3.1.min.js "></script>
    <script src="assets/js/vendor/bootstrap.bundle.min.js "></script>
    <script src="assets/js/vendor/perfect-scrollbar.min.js "></script>
    <script src="assets/js/vendor/echarts.min.js "></script>
    <script src="assets/js/vendor/datatables.min.js"></script>
    <script src="assets/js/es5/echart.options.min.js"></script>
    <script src="assets/js/es5/dashboard.v4.script.min.js "></script>
    <script src="assets/js/es5/widgets-statistics.min.js"></script>
    <script src="assets/js/vendor/apexcharts.min.js"></script>
    <script src="assets/js/es5/script.min.js"></script>
    <script src="assets/js/es5/sidebar.large.script.min.js"></script>
    <script src="assets/js/es5/apexSparklineChart.script.min.js"></script>
    <script src="assets/js/es5/echarts.script.min.js"></script>   
    <script src="assets/js/datatables.script.js"></script>	
     <script src="assets/js/form.validation.script.js"></script>
	 <script src="assets/js/dropzone.script.js"></script>
 	 <script src="assets/js/vendor/dropzone.min.js"></script>
	<script src="assets/js/jquery.serializejson.js"></script>
	 <script src="assets/js/vendor/sweetalert2.min.js"></script>
	 <!-- Added 2 imports forJS -->
	  <script src="assets/js/jquery.serializejson.js"></script>
  <script src="assets/js/form.validation.script.js"></script>
	 
    <script src="assets/js/sweetalert.script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script src="assets/js/vendor/datatables.min.js"></script>
<script type="text/javascript">
  		 // FileInput
    $('.form-file-simple .inputFileVisible').click(function() {
      $(this).siblings('.inputFileHidden').trigger('click');
    });

    $('.form-file-simple .inputFileHidden').change(function() {
      var filename = $(this).val().replace(/C:\\fakepath\\/i, '');
      $(this).siblings('.inputFileVisible').val(filename);
    });

    $('.form-file-multiple .inputFileVisible, .form-file-multiple .input-group-btn').click(function() {
      $(this).parent().parent().find('.inputFileHidden').trigger('click');
      $(this).parent().parent().addClass('is-focused');
    });

    $('.form-file-multiple .inputFileHidden').change(function() {
      var names = '';
      for (var i = 0; i < $(this).get(0).files.length; ++i) {
        if (i < $(this).get(0).files.length - 1) {
          names += $(this).get(0).files.item(i).name + ',';
        } else {
          names += $(this).get(0).files.item(i).name;
        }
      }
      $(this).siblings('.input-group').find('.inputFileVisible').val(names);
    });

    $('.form-file-multiple .btn').on('focus', function() {
      $(this).parent().siblings().trigger('focus');
    });

    $('.form-file-multiple .btn').on('focusout', function() {
      $(this).parent().siblings().trigger('focusout');
    });
	

  </script>
  
  <script>
  function getImage(url)
  {
	//  document.getElementById('ShowImage').src=url;
	//  var img = document.getElementById("ShowImage");

			// Set the source dynamically
	//		var imageUrl = "path/to/image.jpg";
	//		img.setAttribute("src", url);
			$("#ShowImage").attr("src",url);
  }
  
	$('.closeData').on('click', function (e) {
  var item = $('.modal-backdrop');
  item.removeClass('fade'); 
});

function getDeviceImages(device_id){
	window.location.assign("TDGFileupload.jsp?id="+device_id);
//	alert('Device_id : ' + device_id);
//$.ajax({
//		type: "POST",
//		contentType: "application/json",
//		url: "/smartesl/getDeviceImages/"+device_id,
//		beforeSend: function(request) {
//			request.setRequestHeader("Authorization", token);
//		  },
	//	data: JSON.stringify(formData),
//		success: function(result) {
//			var obj = JSON.parse(result);
	//		var html12 = '';
			//alert(obj);
	//			html12+='<option value="none" selected disabled hidden>Select an Option</option>'
	//		for(var b=0;b < obj.length;b++){
//var item = obj[b];				
	//			html12+='<option value="'+item.product_id+'" name="product_id">'+item.product_name+' / '+item.product_description+'</option>'
	//		}
			console.log("inside success for branch : " + obj);
			//$("#branch_id").selectpicker("destroy");
		//	$("#product_id").html(html12);
			//$("#branch_id").selectpicker("render");
			
			//alert(html12);
			
	//	},
//		error: function(err){
//			console.log(err);
//			console.log("inside error for branch");
		
//		}
//	});
}
	</script>
<script type="text/javascript">

function getProduct(customer){
	
	var formData = {
			Id: <%=session.getAttribute("Entity_id").toString()%>,
			customer: customer,
			role_id:<%=session.getAttribute("group_id").toString()%>	}
	//alert('in ajax hit  for product     >>>> ' + formData);
	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: "/smartesl/ListOfProductsbyCustomer",
		beforeSend: function(request) {
			request.setRequestHeader("Authorization", token);
		  },
		data: JSON.stringify(formData),
		success: function(result) {
			var obj = JSON.parse(result);
			var html12 = '';
			//alert(obj);
				html12+='<option value="none" selected disabled hidden>Select an Option</option>'
			for(var b=0;b < obj.length;b++){
				var item = obj[b];				
				html12+='<option value="'+item.product_id+'" name="product_id">'+item.product_name+' / '+item.product_description+'</option>'
			}
			console.log("inside success for branch");
			//$("#branch_id").selectpicker("destroy");
			$("#product_id").html(html12);
			//$("#branch_id").selectpicker("render");
			
			//alert(html12);
			
		},
		error: function(err){
			console.log(err);
			console.log("inside error for branch");
		
		}
	});
}
</script>
<script type="text/javascript">
var token =  "Bearer <%=session.getAttribute("sToken").toString()%>";

<%if(session.getAttribute("group_id").toString().equals("645") || session.getAttribute("group_id").toString().equals("198")){%>
//alert('I should work here when customer is login');
getBranchData($("#created_by").val());
getProduct($("#created_by").val());

<%}%>

$('#customer_id').on('change', function() {
	var customer = $(this).val();
	getBranchData(customer);
		//alert('before the product call ' + customer);
	getProduct(customer);	
});	
	
$('#customer_id').on('change', function() {
	var customer = $(this).val();
	getBranchData(customer);
		//alert('before the product call ' + customer);
	getProduct(customer);	
});	
function getBranchData(customer){
	$.ajax({
		type: "GET",
		contentType: "application/json",
		url: "/smartesl/branchSelection/"+customer,
		beforeSend: function(request) {
			request.setRequestHeader("Authorization", token);
		  },
		//dataType: 'json',
		success: function(result) {
			var obj = JSON.parse(result);
			var html12 = '';
			//alert(obj);
				html12+='<option value="none" selected disabled hidden>Select an Option</option>'
				//alert(html12);
			for(var b=0;b < obj.length;b++){
				var item = obj[b];
				html12+='<option value="'+item.branch_id+'" name="branch_id">'+item.branch_name+'</option>'
			}
			console.log("inside success for branch");
			//$("#branch_id").selectpicker("destroy");
			$("#branch_id").html(html12);
			$("#branch_idassign").html(html12);
			//$("#branch_id").selectpicker("render");
			
			console.log(result);
			
		},
		error: function(err){
			console.log(err);
			console.log("inside error for branch");
		
		}
	});
}
</script>
<script type="text/javascript">
var token =  "Bearer <%=session.getAttribute("sToken").toString()%>";

function getProduct(customer){
	
	var formData = {
			Id: <%=session.getAttribute("Entity_id").toString()%>,
			customer: customer,
			role_id:<%=session.getAttribute("group_id").toString()%>	}
	//alert('in ajax hit  for product     >>>> ' + formData);
	$.ajax({
		type: "POST",
		contentType: "application/json",
		url: "/smartesl/ListOfProductsbyCustomer",
		beforeSend: function(request) {
			request.setRequestHeader("Authorization", token);
		  },
		data: JSON.stringify(formData),
		success: function(result) {
			var obj = JSON.parse(result);
			var html12 = '';
			//alert(obj);
				html12+='<option value="none" selected disabled hidden>Select an Option</option>'
			for(var b=0;b < obj.length;b++){
				var item = obj[b];				
				html12+='<option value="'+item.product_id+'" name="product_id">'+item.product_name+' / '+item.product_description+'</option>'
			}
			console.log("inside success for Product");
			//$("#branch_id").selectpicker("destroy");
			$("#product_id").html(html12);
			//$("#branch_id").selectpicker("render");
			
			//alert(html12);
			
		},
		error: function(err){
			console.log(err);
			console.log("inside error for branch");
		
		}
	});
}
</script>
</body>
<%
 }}else{
	 response.sendRedirect("index.jsp?sessiontimeout"); 
%>
<a href="index.jsp">You are not authorized to view this page.</a>

<%
  } 
%>

</html> 