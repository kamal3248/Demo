function validateAmt()
{
	
	var valid = false;
	valueAmount = document.getElementById("con_amount_ad").value;
	
	try{

					if(valueAmount==null || valueAmount=='')
					{
						alert('Amount field cannot be empty');
					}
					else if(valueAmount<0)
					{
						alert('User provided amount can not be negative');
					}
					else if(valueAmount>7500)
					{
						alert('Maximum online vending limit is 7500');
					}
					else if(isNaN(valueAmount))
					{
						alert('User provided amount can not be Non Numeric');
					}
					else if(valueAmount.toString().indexOf(".")!=-1)
					{
						alert('User provided amount can not contain any decimal value');
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