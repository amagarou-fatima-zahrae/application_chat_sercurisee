<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
      <div class="container">
   
		<h1>Chat App </h1>   
	   <button> <a href="AppelVideo" target="_blank">appel video </a></button> 
	   <button> <a href="ListeMessages" >Liste discussions</a></button>  
		<!-- Messaging area -->
		<div class="card mb-3">
			<div class="card-body" id="messageArea">
				<c:forEach items="${Messages}" var="message" varStatus="status">
		         
		             
		              <c:choose>
		               <c:when test="${message.typeMsg == 'text'}"> 
		                <div class="alert alert-success mb-2 " id="text${status.index}">
		                  <c:out value="${message.contenu}"></c:out> 
                             <i class="fas fa-download"   onclick="downloadText(${status.index})"></i>
                             
		                 </div>
		               </c:when>
		               <c:when test="${message.typeMsg =='video' }"> 
		                 <div class="alert alert-success mb-2">
		                     <video class="w-50 h-50" controls><source src="${message.contenu}"></video>
		                     <a href="${message.contenu}" download>
                                 <i class="fas fa-download"></i>
                               </a>
		                 </div>
		               </c:when>
		               <c:when test="${message.typeMsg =='fichier' }"> 
		                 <div class="alert alert-success mb-2">
		                     <embed class="mb-3"  src="${message.contenu}" width="500" height="375"  type="application/pdf">
		                     <a href="${message.contenu}" download>
                                 <i class="fas fa-download"></i>
                               </a>
		                 </div>
		               </c:when>
		               <c:when test="${message.typeMsg=='audio'}"> 
		                 <div class="alert alert-success mb-2">
		                     <audio class="w-50 h-50" controls><source src="${message.contenu}"></audio>
		                      <a href="${message.contenu}" download>
                                 <i class="fas fa-download"></i>
                               </a>
		                 </div>
		               </c:when>
		               <c:otherwise>
		                <div class="alert alert-success mb-2">
		                     <img class="w-50 h-50" src="${message.contenu}"/>
		                       <a href="${message.contenu}" download>
                                 <i class="fas fa-download"></i>
                               </a>
		                 </div>
		               </c:otherwise>
		              </c:choose>
		           
                </c:forEach> 	
			</div>
		</div>
		
		<!-- Input area -->
		 <form action=""  method="post" id="myForm" enctype="multipart/form-data">
                     
           <div class="input-group mb-3">
			 <input type="text" class="form-control" name="message" placeholder="Type your message...">
			
			<div class="input-group-append d-flex justify-content-between align-items-center">
				<!-- <button class="btn btn-outline-secondary  m-3" type="button" >Send</button>  -->
                
                <!-- fffff -->
                <div class="dropdown m-3">
                   <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-ellipsis-v"></i>
                   </button>
                 <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton">
                   <li><a class="dropdown-item" href="#" data-type="audio"><i class="fas fa-music"></i> Audio</a></li>
                   <li> <a class="dropdown-item" href="#" data-type="video"><i class="fas fa-video"></i> Video</a></li>
                   <li> <a class="dropdown-item" href="#" data-type="fichier"><i class="fas fa-file"></i> Fichier</a></li>
                   <li><a class="dropdown-item" href="#" data-type="image"><i class="fas fa-image"></i> Image</a></li>
                 </ul>   
               </div>
                 <div >
                 <i id="recordBtn" class="fas fa-microphone fa-2x text-success fw-1"></i>
                 <i id="stopBtn" class="fas fa-stop-circle fa-2x text-danger d-none"></i>
                 </div>
			</div>
		</div>
                              
            <div >
                 <input type="hidden" name="mediaType" id="mediaType">
                 <input type="hidden" name="mediaUrl" id="mediaUrl">
                 <input type="hidden" name="mediaUrlR" id="mediaUrlR">
                 <button type="button" name="ajout" class="btn btn-success" id="send" onclick="validate(null);" disabled>Send</button>
             </div>
         </form>
          <i class="fas fa-camera fa-2x text-success" id="stream"></i>
          <i class="fas fa-dot-circle fa-2x text-danger d-none" id="take"></i>
          <video id="video" width="300" height="100"></video>
         <!--  <button onclick="takePhoto()">Take Photo</button> -->
          <canvas id="canvas" style="display: none;"></canvas>
         <!-- <div class="container mt-5">
                <div class="row">
                  <div class="col-md-12 text-center">
                   
                  </div>
                </div>            
           </div> -->
       
         <button id="call">call</button>
       
		 <!-- <button onclick="startRecording()">Start Recording</button>
         <button onclick="stopRecording()">Stop Recording</button> -->
         <!--  <button id="btnStart" >Start Recording</button>
         <button id="btnStop">Stop Recording</button>
          <button id="btnPlay">play Recording</button> -->
		
	</div>
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
 Se déconnecter
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Déconnexion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Si vous vous déconnecter, tous vos discussions actuelles seront supprimés</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
        <button type="button" class="btn btn-primary" onclick="deconnecter()">Se déconnecter</button>
      </div>
    </div>
  </div>
</div>
<p id="id" class="d-none">${id}</p>
<p id="id_rec" class="d-none">${id_rec}</p>
	<!-- Load Bootstrap JS and jQuery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" ></script>  
     <script src="https://unpkg.com/peerjs@1.4.7/dist/peerjs.min.js"></script>
                  
	<script>
	/////WEB SOCKETS
	let id=document.getElementById("id").textContent;
	var cpt=10000;
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	let socket = new WebSocket("ws://localhost:8081/WebChat/ServerEndPoint?userID="+id+"="+urlParams.get('id'));
	 socket.onopen = function(e) {
		 document.getElementById('send').removeAttribute("disabled");
		  console.log("[open] Connection established");
		 
		};
		
		socket.onmessage=function(event){
			
			  const Data = event.data;
			  var objectR = JSON.parse(Data);
			  console.log('nouveau message arrive de '+objectR.recepteurId);
			  var messageElement = document.createElement('div');
				messageElement.classList.add('alert', 'alert-success');
			  if (objectR.type === 'text') {
				    console.log('Variable is a text');   
				    messageElement.id="text"+cpt;
					messageElement.innerHTML = objectR.content+'<i class="fas fa-download"   onclick="downloadText('+cpt+')"></i>';
					cpt++;
				}
			  
			  else if(objectR.type=== 'video') {
				  var contenu =objectR.content.substring(0,objectR.content.length-2);
					messageElement.innerHTML = '<video class="w-50 mb-3 h-50" controls><source src="' +contenu+ '"></video><a href="'+contenu+'" download><i class="fas fa-download"></i></a>';
	              } else if (objectR.type === 'audio') {
	            	  var contenu =objectR.content.substring(0,objectR.content.length-2);
	            	  messageElement.innerHTML = '<audio class="w-50 mb-3 h-50" controls><source src="' +contenu+ '"></audio><a href="'+contenu+'" download><i class="fas fa-download"></i></a>';
	              }else if (objectR.type === 'fichier') {
	            	  var contenu =objectR.content.substring(0,objectR.content.length-2);
	            	  messageElement.innerHTML = '<embed class="mb-3" src="'+contenu+'" width="500" height="375"  type="application/pdf"><a href="'+contenu+'" download><i class="fas fa-download"></i></a>';
	              } else {
	            	  var contenu =objectR.content.substring(0,objectR.content.length-2);
	            	  messageElement.innerHTML = '<img class="w-50 mb-3 h-50" src="' +contenu+ '"/><a href="'+contenu+'" download><i class="fas fa-download"></i></a>';
	              }
			  var messageArea = document.getElementById('messageArea');	
			  messageArea.appendChild(messageElement); 
		
		}
		// CLOSE
		socket.onclose=function(){
			console.log("cloosed!");
		}
		
		// DECONNECTER
		function deconnecter(){
			socket.close();
			 window.location.href = 'http://localhost:8081/WebChat/Login';
		}
		
		// ERROR
		socket.onerror = function(error) {
			  console.log(error);
		};
    //******************** END WEB SOCKETS*************************************************
	   /*  send Message */
		function sendMessage(type,url,file) {
			console.log('ana f send message .');
			const queryString = window.location.search;
			const urlParams = new URLSearchParams(queryString);
		  // console.log('im here'+urlParams.get('id'));
			var messageElement = document.createElement('div');
			 var val=document.querySelector('input[type="text"]').value;
		  if(type=='text'){
			  console.log('text');
			  if(val!==""){
				  var message = val;
					messageElement.classList.add('alert', 'alert-primary');
					messageElement.textContent = message;
					 console.log(val);
					 var message = {
							    "recepteurId": urlParams.get('id'),
							    "content": val,
							    "type" : type
							  };
					 var messageJSON = JSON.stringify(message);
					 console.log("messageJSON: "+messageJSON);
					 socket.send(messageJSON); 
					 console.log("sent nnnnn");
			  }
		 }else{
			if (type === 'video') {
				messageElement.innerHTML = '<video class="w-50 h-50" controls><source src="' + url + '"></video>';
              } else if (type === 'audio') {
            	  messageElement.innerHTML = '<audio class="w-50 h-50" controls><source src="' + url + '"></audio>';
              }else if (type === 'fichier') {
            	  messageElement.innerHTML = '<embed class="mb-3" src="'+url+'" width="500" height="375"  type="application/pdf">';
              } else {
            	  messageElement.innerHTML = '<img class="w-50 h-50" src="' + url + '"/>';
              }
			  var formData = new FormData();
			if(file==null){
				const fileInput = document.getElementById('file');
				var file_input =fileInput.files[0];
				document.body.removeChild(fileInput); 
				 formData.append("message", file_input);
			}
			else{
				if(type=='audio'){
					console.log("file "+file);
					const timestamp = new Date().getTime();
					const filename = 'audio_' + timestamp + '.mp3';
					formData.append("message", file, filename);
				}// image
				else{
					console.log("file "+file);
					const timestamp = new Date().getTime();
					const filename = 'image_' + timestamp + '.jpeg';
					formData.append("message", file, filename);
				}
				
			}
			//console.log(fileInput.files[0]);
			//**********************
			 // SEND SERVER AJAX
	      
          
	     // const data = new URLSearchParams(new FormData(form));
	      console.log(formData);
	      console.log('call ajax .');
	     var xhr = new XMLHttpRequest();
	     xhr.open('POST', 'AjaxCall');
	     xhr.onload = function() {
	       if (xhr.status === 200) {
	    	   var responseAjax=xhr.responseText;
	    	   console.log('Response text:', responseAjax);
	    	   var message = {
					    "recepteurId": urlParams.get('id'),
					    "content": responseAjax,
					    "type" : type
					  };
	    	   var messageJSON = JSON.stringify(message);
				 console.log("messageJSON: "+messageJSON);
				 socket.send(messageJSON); 
				 console.log("sent nnnnn");
	       } else {
	    	   console.log('Error:', xhr.status);
	       }
	     }; 
	    // xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	     xhr.send(formData); 
	     /// FIN AJAX 
			//*********************
	}
	     
		   var messageArea = document.getElementById('messageArea');	
			messageArea.appendChild(messageElement);
			document.querySelector('input[type="text"]').value = '';
			
			// var btnSend = document.getElementById('send');
           //  btn.onclick="sendMessage('text','')";
			 var inputHidden = document.getElementById('mediaType');
             var UrlHidden = document.getElementById('mediaUrl');
             var UrlHiddenR = document.getElementById('mediaUrlR');
             UrlHidden.value="";
             inputHidden.value="";
             UrlHiddenR.value="";
		}
		////////////////////Validate/////////////////////////////////////////
		      function validate(file){
		    	  console.log(' ana f validate.');
                var inputHidden = document.getElementById('mediaType');
                var UrlHidden = document.getElementById('mediaUrl');
               
    	        var url = UrlHidden.value;
    	        var type= inputHidden.value;
    	      
    	        if(url==""){
    	        	 sendMessage('text','');
    	        }
    	        else{
    	        	console.log('send message call.');
    	        	sendMessage(type,url,file);
    	        }

            }
		
		///////////////////
		/* dropdown */
	  var dropdownItems = document.querySelectorAll('.dropdown-item');
      dropdownItems.forEach(function(item) {
    	  
        item.addEventListener('click', function(event) {
          event.preventDefault();
          console.log('hi');
          var type = this.getAttribute('data-type');
          var input = document.createElement('input');
          input.type = 'file';
          input.id="file";
          if(type=="fichier"){
        	  input.accept = '.txt,.pdf';
          }else{
        	  input.accept = type + '/*';
          }
          input.style.display = 'none';
          document.body.appendChild(input);
          
          input.addEventListener('change', function() {
            var file = this.files[0];
           // console.log(file);
            if (file) {
                var url = URL.createObjectURL(file);
                var inputHidden = document.getElementById('mediaType');
                var UrlHidden = document.getElementById('mediaUrl');
                var UrlHiddenR = document.getElementById('mediaUrlR');
                UrlHidden.value=url;
                inputHidden.value=type;
              }  
          });
          
          input.click();
        });
        
      });
      ///////////////////////////////////////////////////////////////////
      // quit page

     window.addEventListener("beforeunload", function(event) {
    // Call the AJAX servlet
    const urlParams = new URLSearchParams(window.location.search);
		   
    id=urlParams.get('id');
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "AjaxCall?id="+id, true);
    console.log("i'm quit");
    xhr.send();
    console.log("send request ");
  });
      
     function downloadText(id) {
    	 console.log("id : "+id);
    	  const text = document.getElementById('text'+id).textContent;
    	  console.log(text);
    	  const filename = 'myTextImage.txt';
    	  const blob = new Blob([text], { type: 'text/plain' });
    	  const link = document.createElement('a');
    	  link.href = URL.createObjectURL(blob);
    	  link.download = filename;
    	  document.body.appendChild(link);
    	  link.click();
    	  document.body.removeChild(link);
    	}
     
     
     ///RECORD AUDIO
     var isRecording = false;
    var startTime;
    var TimeInterval;
  var mediaRecorder;
var chunks = [];
const recordBtn = document.getElementById('recordBtn');
const stopBtn = document.getElementById('stopBtn');
/* function startRecording() { */
	recordBtn.addEventListener('click', function() {
		console.log("click start ....");
		
		if (isRecording) {
	        // Stop recording
	       
	      } else {
	        // Start recording
	        isRecording = true;
	        startTime = new Date().getTime();
	        console.log("startTime" +startTime);
	        document.getElementById("recordBtn").classList.add("text-success");
	        document.getElementById("stopBtn").classList.remove("d-none");
	        TimeInterval = setInterval(updateTime, 1000);
	        console.log("Recording started.");
	        
	      //µµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµµ
		    
	        navigator.mediaDevices.getUserMedia({audio: true}).then(function(stream) {
				  mediaRecorder = new MediaRecorder(stream);
				  console.log("mediaRecorder "+mediaRecorder);
				  
				  mediaRecorder.start();
				  console.log('Recording started...'); 
				  
				  mediaRecorder.addEventListener('start', function() {
					  console.log('Recording started.capturing..');
					  mediaRecorder.addEventListener('dataavailable', function(event) {
						    console.log("event" +event);
						    chunks=[];
						    chunks.push(event.data);
						  });
					});
				
				}).catch(function(err) {
				  console.log('Error: ' + err);
				});
	      }
		
		  });
		  
	  stopBtn.addEventListener('click', function() {
		   if(mediaRecorder){
			   mediaRecorder.stop();
			    isRecording = false;
		        clearInterval(TimeInterval);
		       // var duration = new Date().getTime() - startTime;
		        document.getElementById("recordBtn").classList.remove("text-success");
		        document.getElementById("recordBtn").classList.add("text-secondary");
		        document.getElementById("recordBtn").textContent = "";
		        document.getElementById("stopBtn").classList.add("d-none");
		      //  console.log("Recording stopped. Duration: " + duration + "ms");
			    console.log('Recording stopped.');
			    mediaRecorder.addEventListener('stop', function() {
			    const audioBlob = new Blob(chunks, { 'type' : 'audio/mpeg' });
			    console.log('create audio.');
			    const audioUrl = URL.createObjectURL(audioBlob);
			    //**
	              var inputHidden = document.getElementById('mediaType');
	              var UrlHidden = document.getElementById('mediaUrl');
	              var UrlHiddenR = document.getElementById('mediaUrlR');
	              UrlHidden.value=audioUrl;
	              inputHidden.value='audio';
			    //**
			     console.log('validate call.');
			    validate(audioBlob);
			 
			
			    

		   });
		  };
	});
	

    // Function to update time on recording icon
    function updateTime() {
      var Time = new Date().getTime() - startTime;
      console.log("elapsedTime "+Time);
      var seconds = Math.floor(Time / 1000);
      var minutes = Math.floor(seconds / 60);
      seconds = seconds % 60;
      document.getElementById("recordBtn").textContent = minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
    }
 
 //  PHOTO
 const streamBtn = document.getElementById('stream');
 const takeBtn = document.getElementById('take');
 const video = document.getElementById('video');
 const canvas = document.getElementById('canvas');
 const context = canvas.getContext('2d');

 streamBtn.addEventListener('click', function(){
	 console.log("click photo");
	 
	 takeBtn.classList.remove("d-none");
	 navigator.mediaDevices.getUserMedia({ video: true })
	  .then(stream => {
		  console.log("stream video...");
		  video.srcObject = stream;
	    video.play();
	  })
	  .catch(error => {
	    console.error('Error accessing user media:', error);
	  });
 });
 takeBtn.addEventListener('click', function(){
	 takeBtn.classList.add("d-none");
	 console.log("take photo");
	 video.pause();
	  video.classList.add("d-none");
	 console.log("video pause..");
	 // Set the canvas dimensions to match the video dimensions
	  canvas.width = video.videoWidth;
	  canvas.height = video.videoHeight;
	  
	  // Draw the current video frame onto the canvas
	  context.drawImage(video, 0, 0, canvas.width, canvas.height);
	  
	  // Get the image data from the canvas as a data URL
	  const imageData = canvas.toDataURL('image/jpeg');
	 
	  // Create an image element and set its source to the data URL
	 /*  const image = document.createElement('img');
	  image.src = imageData; */
	  console.log("put image");
	  // Add the image element to the page
	 // document.body.appendChild(image);
	// Stop the video stream and release the camera
	   if (video.srcObject  && video.srcObject.getTracks) {
		   console.log("stream found");
		   video.srcObject.getTracks().forEach(function(track) {
            track.stop();
          });
        };
	
	   //-----------------------------
	   var inputHidden = document.getElementById('mediaType');
       var UrlHidden = document.getElementById('mediaUrl');
       var UrlHiddenR = document.getElementById('mediaUrlR');
       UrlHidden.value= imageData;;
       inputHidden.value='image';
//**
       console.log('validate call.');
		  canvas.toBlob(function(blob) {
			  validate(blob);
	    });
		  //----------------------------
	 
 });


    	   
</script>
	
</body>
</html>