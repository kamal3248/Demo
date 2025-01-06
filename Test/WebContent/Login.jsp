<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% response.setHeader("server", "/"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="overflow-y: scroll;">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!--Import Google Icon Font-->
	<link href="./css/icon.css" rel="stylesheet">
<!--     <link href="/irj/go/km/docs/bills/SJVN/Pages/flUhRq6tzZclQEJ-Vdg-IuiaDsNc.woff2" rel="stylesheet"> -->
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
    
	<title>Login</title>
	
	<link rel="icon" type="image/png" href="./images/favicon.ico" />
	<link type="text/css" rel="stylesheet" href="./css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="./css/style.css">
	
	<script type="text/javascript" src="./js/jquery.min.js"></script>
	<script type="text/javascript" src="./js/bootstrap.min.js"></script>

<%
   response.setHeader("Strict-Transport-Security", "max-age=31536000");
 response.setHeader("X-Frame-Options","SAMEORIGIN");
 response.setHeader("X-Content-Type-Options","nosniff");
 response.setHeader("X-XSS-Protection","1");
 response.setHeader("Content-Security-Policy","default-src 'self'; script-src 'unsafe-inline' 'self'; object-src 'none'; style-src 'unsafe-inline'; style-src-elem https://fonts.googleapis.com/icon 'self'; font-src https://fonts.gstatic.com/s/materialicons/v134/flUhRq6tzZclQEJ-Vdg-IuiaDsNc.woff2");
 response.setHeader("frame-ancestors","none");
   %>
</head>
<body>
	<div>
		<div>
			<br>
			<img alt="./images/sjvnl_banner.jpg" src="./images/sjvnl_banner.jpg" style="width: 100%;">
			<br>
		</div>
	
		<!-- Modal -->
		<div id="id_dialog" class="modal" style="background: initial;">
		
		    <!-- Modal content-->
		    <div style="text-align: center;">
		        <img src="./images/loader.gif">
		    </div>
		</div>
		
		<div id="id_div_payProcessing">
			<h4 style="text-align: center;color: blue;">Please wait while we connect you to your account...</h4>
		</div>
		
		<div id="id_div_error" style="text-align: center;color: crimson;">
			<p id = "id_para_error"></p>
		<br>
		</div>
		
		<div id="div_con_login">
		
		<div class = "login_body">
		<br></br>
			<div>
				<h1 style="text-align: center;color: #0575a0">Applicant Login</h1>
				<br>
			</div>
			<!-- Text input-->
	 		
			<div class="form-group col-md-12">
			  <label class="col-md-12 control-label">Registration ID </label>  
			    <div class="inputGroupContainer">
			    <div class="input-group">
			  		<input id="j_user" name="j_user" placeholder="" class="form-control" type="text" maxlength="20">
			    </div>
			  </div>
			</div>
			
			<div class="form-group col-md-12">
			<label class="col-md-12 control-label">Captcha </label>  
			    <div class="inputGroupContainer">
			    <div class="input-group">
			  		<input type="text" class="form-control" readonly id="generated-captcha">
			  		<input class="form-control" type="submit" onclick="generate()" value="Generate New" id="gen">
			    </div>
			  </div>
			</div>
			
			<div class="form-group col-md-12">
			    <div class="inputGroupContainer">
			    <div class="input-group">
			  		<input type="text" class="form-control" id="entered-captcha" placeholder="Enter the captcha..">
			    </div>
			  </div>
			</div>
			
			<div id = "div_btn_otp" class="form-group col-md-12">
			  <div>
			    <button type ="submit" id="submit_otp" class="btn btn-warning">Send OTP </button>
			  </div>
			</div>
						
			<div id="div_otp_login">
			
				<div class="form-group col-md-12">
				  <label class="col-md-12 control-label">Password </label>  
				    <div class="inputGroupContainer">
				    <div class="input-group">
				  		<input id="j_password" name="j_password" placeholder="" class="form-control" type="password" autocomplete="off" maxlength="20">
				    </div>
				  </div>
				</div>
			
				<div class="form-group col-md-12">
				  <label class="col-md-12 control-label">OTP</label>  
				    <div class="inputGroupContainer">
				    <div class="input-group">
				  		<input id="j_otp" name="j_otp" placeholder="" class="form-control" type="password" maxlength="20">
				    </div>
				  </div>
				</div>
				<div id = "div_btn_re_otp" class="form-group col-md-12">
				  	<div>
				    	<button type ="submit" id="submit_re_otp" class="btn btn-warning">Resend OTP </button>
				  		<span style="margin: 7%;"></span>
					    <button type ="submit" id="submit_validate" class="btn btn-warning">Login </button>
					</div>
				</div>
			</div>
			
			<div id = "div_selfreg" class="form-group col-md-12">
				  	<div>
				    	<span class="urLblStdBar"><nobr>Register Yourself?</nobr></span>
						<a class=urLnk target="_Blank" href="/webdynpro/resources/demo.sap.com/selfregsjvn/SelfRegApp"><span class=urTxtStd>Click here</span></a>
					</div>
				</div>
				
				<div id = "div_fgpwd" class="form-group col-md-12">
				  	<div>
				    	<span class="urLblStdBar"><nobr>Reset Password?</nobr></span>
						<a class=urLnk target="_Blank" href="/webdynpro/resources/demo.sap.com/frgtpssjvn/ForgotPassApp"><span class=urTxtStd>Click here</span></a>
					</div>
				</div>
			
			<br></br>
		</div>
		
		</div>
	</div>
</body>


<script>
let captcha;
let alphabets = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz";
//console.log(alphabets.length);
/*let status = document.getElementById('status');
status.innerText = "Captcha Generator";*/

function generate() {
let first = alphabets[Math.floor(Math.random() * alphabets.length)];
let second = Math.floor(Math.random() * 10);
let third = Math.floor(Math.random() * 10);
let fourth = alphabets[Math.floor(Math.random() * alphabets.length)];
let fifth = alphabets[Math.floor(Math.random() * alphabets.length)];
let sixth = Math.floor(Math.random() * 10);
captcha = first.toString()+second.toString()+third.toString()+fourth.toString()+fifth.toString()+sixth.toString();
//console.log(captcha);
document.getElementById('generated-captcha').value = captcha;
document.getElementById("entered-captcha").value = '';
//status.innerText = "Captcha Generator"
}

function check() {
let userValue = document.getElementById("entered-captcha").value;
//console.log(captcha);
//console.log(userValue);
if(userValue == captcha){
    //status.innerText = "Correct!!"
	return true;
}else{
    /*status.innerText = "Try Again!!"
    document.getElementById("entered-captcha").value = '';*/
	return false;
}
}


function reset(){
	
	$('#div_con_login').show();
	$('#div_btn_otp').show();
	
	$('#div_btn_re_otp').hide();
	$('#div_otp_login').hide();
	$('#id_div_payProcessing').hide();
	$('#div_pay_failed').hide();
	$('#div_pay_success').hide();
	$('#id_div_error').hide();
	$("#id_dialog").hide();
};

$(document).ready(function() 
{
	reset();
	generate();
	$.ajax({
		url: 'ValidateUser',
		type: 'POST',
		data : {
			flag : "s"
		},
		success: function(outputdata)
		{
			console.log("cookies secured");
			
		}
	});
	
	
	
	var cOtp;
	var modal = document.getElementById('id_dialog');
			
	try{
		
		$("#submit_otp").click(function(e)
		{
			$('#id_div_error').text("");
			$('#id_div_error').hide();
			//fetch registered mob no and send otp
			
			var j_user = $('#j_user').val();
			if (j_user==null || j_user==""){
				alert("Registration ID cannot be left blank");
				
			}else{
				modal.style.display = "block";
				//$('#j_user').attr("disabled", true);
				$('#j_user').attr("readonly","readonly");
				
				$.ajax({
		  		    url: 'SendOTP',
					type: 'POST',
					async : true,
					data : 
					{
						j_user : $('#j_user').val(),	 			
					},
					success: function(otpResponse){
						modal.style.display = "none";
						$("#id_dialog").hide();
						//console.log(otpResponse);
						if(otpResponse.indexOf('NoSuchUserException') != -1){
							console.log(otpResponse);
							$('#id_div_error').text("User Not Found! Please contact support.");
							$('#id_div_error').show();
							$('#j_user').removeAttr("readonly");
						}
						else if(otpResponse.indexOf('Exception') != -1){
							console.log(otpResponse);
							$('#id_div_error').text("Error Occured!!! Please contact support.");
							$('#id_div_error').show();
							$('#j_user').removeAttr("readonly");
						}
						else if(isNaN(otpResponse)){
							console.log(otpResponse);
							$('#id_div_error').text("Registration ID not found. Please contact support.");
							$('#id_div_error').show();
							$('#j_user').removeAttr("readonly");
							generate();
						}
						else if(check() == false){
							$('#id_div_error').text("Invalid Captcha.");
							$('#id_div_error').show();
							$('#j_user').removeAttr("readonly");
							generate();
						}
						else{
							//cOtp = otpResponse;
							//alert('Use this otp for Testing only: '+otpResponse);
							$('#div_btn_otp').hide();
							$('#div_otp_login').show();
							$('#div_btn_re_otp').show();
						}						
					},
					error: function(validateResponse){
						console.log(validateResponse);
						modal.style.display = "none";
						$("#id_dialog").hide();
						$('#id_div_error').text("Something happened wrong. Please try after sometime");
						$('#id_div_error').show();
					}
			  });
			}
		});
			
		$("#submit_re_otp").click(function(e)
		{
			$('#id_div_error').text("");
			$('#id_div_error').hide();
			
			document.getElementById('submit_otp').click();
		});
		
		
		$("#submit_validate").click(function(e)
		{
							
			var vtbox = $('#j_user').val();//document.getElementById('j_user');
			var vpbox = $('#j_password').val();//document.getElementById('j_password');
			var vobox = $('#j_otp').val();
			
			if (vtbox==null || vtbox=="" || vtbox=="User Name" || $.trim(vtbox)==""){
				alert("User Name cannot be left blank");
				
			}else if (vpbox==null || vpbox=="" || $.trim(vpbox)==""){
				alert("Password cannot be left blank");
				
			}else if (vobox==null || vobox=="" || $.trim(vobox)==""){
				alert("OTP cannot be left blank");
				
			}else if (check() == false){
				alert("Invalid Captcha.");
				generate();
			}else if (vobox!=null){
				$.ajax({
		  		    url: 'SendOTP',
					type: 'POST',
					async : false,
					data : 
					{
						flag : 'X',
						j_otp : $('#j_otp').val(),	 			
					},
					success: function(otpResponse){
						
						//console.log(otpResponse);
						//alert(otpResponse);
						if (otpResponse==="xC@#qw:=/.;s"){
							
							//alert("correct otp");
							modal.style.display = "block";
							$.ajax({
					  		    url: 'ValidateUser',
								type: 'POST',
								async : true,
								data : 
								{
									j_user : $('#j_user').val(),
									j_password : $('#j_password').val(),
								},
								success: function(validationResponse){
									modal.style.display = "none";
									$("#id_dialog").hide();
									//console.log(validationResponse);
									if(validationResponse===$('#j_user').val()){
										
										var mapForm = document.createElement("form");
								    	mapForm.id = "Map";
								        mapForm.target = "_self";//"Map";
								        mapForm.method = "POST"; // or "post" if appropriate
								        mapForm.action = "/irj/portal/";
								        var mapInput = document.createElement("input");
								        mapInput.type = "hidden";
								        mapInput.name = "j_user";
								        mapInput.value = $('#j_user').val();
								        mapForm.appendChild(mapInput);
								        mapInput = document.createElement("input");
								        mapInput.type = "hidden";
								        mapInput.name = "j_password";
								        mapInput.value = $('#j_password').val();
								        mapForm.appendChild(mapInput);
								        document.body.appendChild(mapForm);
								        
								        //Map.submit();
								        document.getElementById('Map').submit();
									}else if("F"===validationResponse){
										alert("Incorrect Login Credentials");
										generate();
									}
									else{
										//$('#id_div_error').text(validationResponse);
										//$('#id_div_error').show();
										
										alert(validationResponse);
									}						
								},
								error: function(validateResponse){
									console.log(validateResponse);
									modal.style.display = "none";
									$("#id_dialog").hide();
									$('#id_div_error').text("Incorrect Login Details");
									$('#id_div_error').show();
								}
						  });
						}
					
						else{
							alert('Incorrect otp');
							generate();
						}}});
						}
			}
			
			
		);
		
	}catch(e){
		console.log(e);
		$('#id_div_error').text("Something happened wrong. Please try after sometime");
		$('#id_div_error').show();
	}
});
</script>
</html>