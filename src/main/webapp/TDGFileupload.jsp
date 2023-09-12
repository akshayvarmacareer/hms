
<%@page import="servlets.ApiCalls"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page language="java"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>TDG Display</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="assets/styles/css/themes/lite-purple.min.css">
    <link rel="stylesheet" href="assets/styles/vendor/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/styles/vendor/datatables.min.css">
	<link rel="stylesheet" href="assets/styles/vendor/dropzone.min.css">
	<link rel="stylesheet" href="assets/styles/vendor/sweetalert2.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.css">
  <style>
  
   input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
  

  </style>
  
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    SuperUS
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->

<style>
    #preview {
      max-width: 300px;
      max-height: 300px;
      display: flex;
      justify-content: center;
      align-items: center;
	  
    }
    #preview img {
      max-width: 100%;
      max-height: 100%;
	  border-style: double;
	  justify-content: center;
    }
	
	#filePathsContainer {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
    }

    .fileImage {
      width: 200px;
      height: 200px;
      object-fit: cover;
      cursor: pointer;
    }
	
	.latestImage {
      border: 2px solid blue;
	  pointer-events: none;
    }
  </style>
  
</head>
<body>
 <%@ include file="html/load.html" %>

<%
if(session.getAttribute("user") !=null){
ApiCalls user = new ApiCalls();
boolean isValid = user.validateUser(session.getAttribute("user").toString(), session.getAttribute("sToken").toString());
if(session.getAttribute("user")!=null  && isValid && session.getAttribute("group_id")!=null && session.getAttribute("Entity_id")!=null){
 System.out.println("Entred Dashboard"); 
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
			<br>
				<div class="tab-content">
					<div class="row">
						<div class="col-md-2 form-group mb-5">
							<h2><b>Device ID</b></h2>
							<br>
							<h3 id="id_device"></h3>
						</div>
						<div class="col-md-2 form-group mb-5">
							<h2><b>Device Name</b></h2>
							<br>
							<h3 id="device_name">DEVICE45679843757</h3>
						</div>
						<div class="col-md-2 form-group mb-5">
							<h2><b>Type</b></h2>
							<br>
							<h3>WIFI</h3>
						</div>
						<div class="col-md-2 form-group mb-5">
							<h2><b>Status</b></h2>
							<br>
							<h3 id="status"></h3>
						</div>
						<div class="col-md-2 form-group mb-5">
							<h2><b>Last Connected</b></h2>
							<br>
							<h3 id="last_connected"></h3>
						</div>
						<div class="col-md-2 form-group mb-5">
							<h2><b>Battery</b></h2>
							<br>
							<h3 id="battery"></h3>
						</div>
					</div>
				</div>
      </div>
		</div>
	</div>
<div class="col-12 mx-auto">       
	<div class="card mb-12">
		<div class="card-body">
			<div class="card-title text-center">File upload</div>
			<br>
      <form class="needs-validation" id="customerForm" method="post" autocomplete="off" novalidate>
				<div class="tab-content">
					<div class="row">
						<div class="col-md-6 form-group mb-5">
							<label for="lastName1" >Enter Image <span class="required" style="color:red">*</span></label>
							<div class="form-group form-file-upload form-file-multiple">
							  <input type="file"  name="doc_path" accept=".jpg" id="logo_path" class="inputFileHidden" accept="image/*" onchange="previewFile()" required style="display:none">
							  <div class="input-group">
								<input type="text" class="form-control inputFileVisible" placeholder="Choose File *">
								<input type="hidden" id="selectedImageSrc" name="selectedImageSrc">
								<span class="input-group-btn">
								<button type="button" class="btn btn-fab btn-round btn-primary">
								  <i class="material-icons">attach_file</i>
								</button>
								</span>
							  </div>
							</div>
							<div class="col-md-12 mt-3 text-center">
								<div class="ml-auto">
								</div>
								  <button type="submit" class="btn-lg btn-next btn-fill btn-primary m-3" name="finish" value="Submit">Submit</button>
							  </div>
							<label class="switch pr-5 switch-primary mr-3">
								<span>Dithering</span>
								<input type="checkbox" id="isDithering">
								<span class="slider"></span>
							</label>
							<br>
							<br>
							<div id="preview"></div>
							<div id="filePathsContainer"></div>
						</div>
						<div class="col-md-6 form-group mb-5 d-flex justify-content-center">
							<br><br><br>
							<div class="row">
								<div class="col-md-6 form-group mb-5 d-flex justify-content-center"> 
									<h2 class="d-flex justify-content-center">Latest Image</h2>
								</div>
								<div id="LatestImagePre" class="col-md-6 form-group mb-5 d-flex justify-content-center">    </div>
							</div>
						</div>
					</div>
				</div>
      </form>
      </div>
		</div>
	</div>
</div>


 <script>
    function previewFile() {
      const preview = document.getElementById('preview');
      const file = document.querySelector('input[type=file]').files[0];
      const reader = new FileReader();
      reader.addEventListener('load', function () {
        const image = new Image();
        image.src = reader.result;
        image.style.maxWidth = '100%';
        image.style.maxHeight = '100%';
        preview.innerHTML = '';
        preview.appendChild(image);
      }, false);

      if (file) {
        reader.readAsDataURL(file);
      }
    }
  </script>
				
<%@ include file="html/jsTags.html" %>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.js"></script>
  <script src="your-script.js"></script>						
</body>
<script src="assets/js/jquery.serializejson.js"></script>
<script src="assets/js/dropzone.script.js"></script>
<script src="assets/js/vendor/dropzone.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
<script type="text/javascript">

	document.addEventListener("DOMContentLoaded", function() {
		var searchParams = new URLSearchParams(window.location.search); 
        var device_id = searchParams.get("id");
		var id_device = document.getElementById('id_device');
		id_device.innerHTML = device_id;
		ImagesList(device_id);
		DeviceStatus(device_id);
    });
	
	//this function will call api to share some extra Data
	function DeviceStatus(device_id){
			var token =  "Bearer <%=session.getAttribute("sToken").toString()%>";
			$.ajax({
					type: "GET",
						contentType: "application/json",
					url: "/smartesl/tdgDevicedata/"+device_id,
					beforeSend: function(request) {
						request.setRequestHeader("Authorization",token);
					  },
					//dataType: 'json',
					success: function(result) {
						console.log(result);
						var obj = JSON.parse(result);
						var device_name = document.getElementById('device_name');
						device_name.innerHTML = obj.device_name;
						var battery = document.getElementById('battery');
						battery.innerHTML = obj.battery;
						var last_connected = document.getElementById('last_connected');
						//var initialDate = new Date(obj.last_connected);
						//alert(initialDate);
						// Format the resulting date
						//var formattedDate = initialDate.toString().replace('T', ' ').replace('Z', '').replace('.000','');
						//alert('actual ' + formattedDate);
						last_connected.innerHTML = obj.last_connected;
						var status = document.getElementById('status');
						status.innerHTML = obj.status;
						
					},
					error: function(err){
						console.log(err);
						console.log("inside error for branch");
					
					}
					
				
				});
	}
	
	function ImagesList(device_id)
		{
			 var token =  "Bearer <%=session.getAttribute("sToken").toString()%>";
			$.ajax({
					type: "GET",
						contentType: "application/json",
					url: "/smartesl/DeviceImageList/"+device_id,
					beforeSend: function(request) {
						request.setRequestHeader("Authorization",token);
					  },
					//dataType: 'json',
					success: function(result) {
						console.log(result);
						var obj = JSON.parse(result);
						var selectedImage = null;
						var container = document.getElementById("filePathsContainer");
						var latestImagecontainer = document.getElementById("LatestImagePre");
						var imageInput = document.getElementById("logo_path");
						var selectedImageSrcInput = document.getElementById("selectedImageSrc");
						for(var b=0;b < obj.length;b++){
							var item = obj[b];
							var img = document.createElement("img");
							  img.src = item;
							  img.classList.add("fileImage");
							  img.addEventListener("click", function() {
								selectImage(this);
							  });
							  container.appendChild(img);
							  if(b == obj.length - 1){
								latestImagecontainer.appendChild(img);
							  }
						}
						
						function selectImage(imageElement) {
						  // Clear previous selection style
						  if (selectedImage) {
							selectedImage.style.border = "none";
						  }

						  // Apply new selection style
						  imageElement.style.border = "2px solid red";
						  selectedImage = imageElement;
						  
						  selectedImageSrcInput.value = imageElement.src;
						}

						
						var images = latestImagecontainer.getElementsByClassName("fileImage");
						if (images.length > 0) {
						  images[images.length - 1].classList.add("latestImage");
						}
						
					},
					error: function(err){
						console.log(err);
						console.log("inside error for branch");
					
					}
					
				
				});
			
		}
		
		
		 
</script>
<script type="text/javascript">
  if (window.File && window.FileReader && window.FileList && window.Blob) {
              document.getElementById('logo_path').addEventListener('change', handleFileSelect, false);
             
            } else {
              alert('The File APIs are not fully supported in this browser.');
            }
  
            var file = "";
            var filename = "";
            function handleFileSelect(evt) {
              var f = evt.target.files[0]; // FileList object
              console.log(f);
              filename = f.name
              var reader = new FileReader();
              // Closure to capture the file information.
              reader.onload = (function(theFile) {
                return function(e) {
                  var binaryData = e.target.result;
                  //Converting Binary Data to base 64
                  var base64String = window.btoa(binaryData);
                  //showing file converted to base64
                file = base64String;
                };
              })(f);
              // Read in the image file as a data URL.
              reader.readAsBinaryString(f);
            }
    
    var token =  "Bearer <%=session.getAttribute("sToken").toString()%>";
    
    $('#customerForm').on('submit', function(e) {
        e.preventDefault();
        var data = $(this).serializeJSON();
        var searchParams = new URLSearchParams(window.location.search);
        var idParam = searchParams.get("id");
		var srcPoint = $("input[name=selectedImageSrc]").val();
        var flexiplelist = idParam ? idParam.split("=")[1] : null;
		var isDithering = $('#isDithering');
		if (isDithering.is(':checked')) {
            data['isDithering'] = true;
        } else {
            data['isDithering'] = false;
        }
      data['doc_path'] = file;
      data['filename'] = filename;
      data['device_id'] = idParam;
	  data['imageURL'] = srcPoint;
      //Program for Null Fields and Null Values of JSON
          
       swal({
          title: 'Data Getting Saved',
          icon: 'info',
          html:
          '<div class="progress"> ' +
          '<div class="progress-bar progress-bar-striped progress-bar-animated" id="progress_bar" role="progressbar" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100" style="width: 15%"></div> ' +
          '</div>',
          showCloseButton: false,
          showCancelButton: false,
          focusConfirm: false,
          showConfirmButton: false,
          allowOutsideClick: false
        })
        console.log(data);
        $.ajax({
          xhr: function() {
          var xhr = new window.XMLHttpRequest();
  
          xhr.upload.addEventListener("progress", function(evt) {
            if (evt.lengthComputable) {
            var percentComplete = evt.loaded / evt.total;
            percentComplete = parseInt(percentComplete * 100);
            console.log(percentComplete+'%');
            $('#progress_bar').width(percentComplete+'%');
            }
          }, false);
  
          return xhr;
          },
          type: "POST",
          contentType: "application/json",
          url: "/smartesl/TDGFileUpload",
        enctype: 'multipart/form-data',
          beforeSend: function(request) {
              request.setRequestHeader("Authorization", token);
            },
          data: JSON.stringify(data),
          dataType: 'json',
          success: function(result) {
			//  connect();
          swal({ title:"Success!",
            text: "Filed Uploaded Successfully Added!",
            type: "success", buttonsStyling: true,
            showConfirmButton: true,
            confirmButtonClass: "btn btn-success"}).then(function(){
              location.reload();
            });	
            
           
          },
          error: function(err){
          swal({ title:"Failure!",
            text: err.responseText,
            type: "error", buttonsStyling: true,
            confirmButtonClass: "btn btn-error"})
            console.log(err);
          }
        });
      });
  
  
  
	var mqttClient;
	var reconnectTimeout = 30000;
	var host = "110.227.212.90";
	var port=61614;
        function connect() {
            var broker = "mqtt://broker.example.com";  // Replace with your MQTT broker URL
            var clientId = "client1";  // Replace with your desired client ID
            mqttClient = new Paho.MQTT.Client(host,port, clientId);
            mqttClient.connect({ onSuccess: onConnect });
        }

        function onConnect() {
            alert("Connected to MQTT broker.");
            // Once connected, you can publish messages
            publishMessage("my/topic", "Hello, MQTT!");
        }

        function publishMessage(topic, message) {
            var mqttMessage = new Paho.MQTT.Message(message);
            mqttMessage.destinationName = topic;
            mqttClient.send(mqttMessage);
            alert("Message published successfully.");
        }

 
  </script>
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
 




<%
 }}else{
	 response.sendRedirect("index.jsp?sessiontimeout");
%>
<a href="index.jsp">You are not authorized to view this page.</a>

<%
 }
%>
</html>