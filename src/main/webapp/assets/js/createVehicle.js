

 function preview() {
                frame.src = URL.createObjectURL(event.target.files[0]);
				 var fileName = document.getElementById('content_path').value;
	  var i = fileName.indexOf(".mp4");
	  if(fileName.indexOf(".mp4")>0){
		  document.getElementById("contentType").checked=true;
		  document.getElementById("contentType1").checked=false;
	  }else
	  {
		  $("#duration").prop('disabled', false);
		  document.getElementById("contentType").checked=false;
		  document.getElementById("contentType1").checked=true;  
	  }
            }
           
function clearImage2() {
                document.getElementById('1').value = null;
                frame.src = "";
            }
function checkRadio()
  {
	  
	  var fileName = document.getElementById('content_path').value;
	  var i = fileName.indexOf(".mp4");
	  if(fileName.indexOf(".mp4")>0){
		  document.getElementById("contentType").checked=true;
		  document.getElementById("contentType1").checked=false;
	  }else
	  {
		  $("#duration").prop('disabled', false);
		  document.getElementById("contentType").checked=false;
		  document.getElementById("contentType1").checked=true;  
	  }
	  
   }
   
   if (window.File && window.FileReader && window.FileList && window.Blob) {
  document.getElementById('content_path').addEventListener('change', handleFileSelect, false);
 
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

 function clearImage() {
                document.getElementById('formFile').value = null;
                frame.src = "";
            }