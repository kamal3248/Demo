function validateAll()
{
	var valid = false;
	var valueEmail = document.getElementById("email").value;
	
	var reg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	try{
		
		if(valueEmail==null && valueEmail=='')
		{
			
			alert('Email field cannot be empty');
		}
		else if(!valueEmail.match(reg))
		{
			alert('Enter valid Email ID');
		}
		else
		{
			
			valid = true;
		}
		
	   }
	 catch(ex)
	 {
		 alert(ex.toString());
	 }
	
	return valid;
}