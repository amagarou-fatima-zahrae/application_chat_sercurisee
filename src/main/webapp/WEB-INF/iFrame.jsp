<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
    <html>
      <head>
      
      </head>
      <body>
      
      <input type="text" id="localPeerId" name="localPeerId" readonly>
      <input type="text" name="remotePeerId" id="remotePeerId">
      <button id="btn-call">Call video</button><br>
       <button id="stop">stop video</button><br>
     
      
     
      <script src="https://unpkg.com/peerjs@1.4.7/dist/peerjs.min.js"></script>
        <script>
       var peer = new Peer();
       var localStream;
       const inputLocalPeerId=document.getElementById("localPeerId");
       const stopBtn=document.getElementById("stop");
       const inputRemotePeerId=document.getElementById("remotePeerId");
      /*  navigator.mediaDevices.getUserMedia({video : true}).then(stream => {
    	   localStream=stream;
    	  const videoElement = document.getElementById("localVideo");
    	   videoElement.srcObject=localStream;
    	   videoElement.onloadedmetadata=()=>videoElement.play(); 
       }); */
     //  const videoElement = document.getElementById("localVideo");
       const btnCall=document.getElementById("btn-call");
       peer.on("open", id=>{
    	   inputLocalPeerId.value=id;
    	   console.log("open!");
    	  /*  navigator.mediaDevices.getUserMedia({video : true}).then(stream => {
        	   localStream=stream;
        	   const videoElement = document.getElementById("localVideo");
        	   videoElement.srcObject=localStream;
        	   videoElement.onloadedmetadata=()=>videoElement.play();
           }); */
    	   });
       
    	   btnCall.addEventListener("click", function(){
    		   console.log("clicked call!");
    	       const remotePeerId=inputRemotePeerId.value;
              navigator.mediaDevices.getUserMedia({video : true}).then(stream => {
           	   localStream=stream;
           	   const videoElement = document.getElementById("localVideo");
           	   videoElement.srcObject=localStream;
           	   videoElement.onloadedmetadata=()=>videoElement.play();
              });
           	   //
           	   navigator.mediaDevices.getUserMedia({video : true,audio: true}).then(stream2 => {
           		 const call= peer.call(remotePeerId, stream2);
        	       call.on("stream", stream=>{
        		   console.log("call on 1");
        		   const remoteVideo=document.getElementById("remoteVideo");
        		   remoteVideo.srcObject=stream;
        		   remoteVideo.onloadedmetadata=()=>remoteVideo.play();
        	     });
               });
       
    	   });
    	   
    	   peer.on("call", call=>{
    		   navigator.mediaDevices.getUserMedia({video : true}).then(stream => {
            	   localStream=stream;
            	   //**    
        	         const videoElement = document.getElementById("localVideo");
        	         videoElement.srcObject=localStream;
        	         videoElement.onloadedmetadata=()=>videoElement.play();
    		   });
            	   navigator.mediaDevices.getUserMedia({video : true,audio: true}).then(stream3 => {
            		   call.answer(stream3);
            		     call.on("stream", stream=>{
            			   console.log("call on 2");
            			   const remoteVideo = document.getElementById("remoteVideo");
            			   remoteVideo.srcObject=stream;
            			   remoteVideo.onloadedmetadata=()=>remoteVideo.play();
            	       });
                 }); 
            	    
        		      /* call.on("stream", stream=>{
        			   console.log("call on 2");
        			   const remoteVideo = document.getElementById("remoteVideo");
        			   remoteVideo.srcObject=stream;
        			   remoteVideo.onloadedmetadata=()=>remoteVideo.play();
        	       });  */

    		   });
    	   
    	   
    	   </script>
    	    </body>
    	       </html>
        