<!DOCTYPE html>
<html>
<head>
	<title>
		Date time validation
	</title>

</head>
<body>
	<?php
	$YourName = "";
	$ngay = $thang = $nam = $gio = $phut = $giay = 0;
	$max_ngay = 31;
	if($_SERVER["REQUEST_METHOD"] == "POST"){
		$YourName = $_POST["YourName"];
		$ngay = $_POST["ngay"];
		$thang = $_POST["thang"];
		$nam = $_POST["nam"];
		$gio = $_POST["gio"];
		$phut = $_POST["phut"];
		$giay = $_POST["giay"];	
		if ($thang == 2){
			if ((($nam % 4 == 0) && ($nam % 100!= 0)) || ($nam%400 == 0)){
				$max_ngay = 29;
			} else {
				$max_ngay = 28;
			}
		} elseif ($thang == 4 || $thang ==6||$thang ==9||$thang ==11) {
			$max_ngay = 30;
		} else {
			$max_ngay = 31;
		}
	}

	?>
	Enter your name and select date and time for the appointment
	<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method = "POST" > 
		<table>
            <tr>
                <td>
                    Your name :
                </td>
                <td>
                    <input type="text" name="YourName">
                </td>
            </tr>
            <tr>
                <td>
                    Date :
                </td>
                <td>
                    <select name="ngay" id="ngay">
                    </select>
                        
                    <select name="thang" id="thang">
                    </select>

                    <select name="nam" id="nam">
                    </select>
    
                </td>
            </tr>
            <tr>
                <td>
                    Time :
                </td>
                <td>
                    
                    <select name="gio" id="gio">
                    </select>
                    
                    <select name="phut" id="phut">
                    </select>
                    
                    <select name="giay" id="giay">
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <input type="submit" name="SUBMIT">
                </td>
                <td align="left">
                    <input type="reset" name="RESET">
                </td>
            </tr>
        </table>
		
		<div> 
			<?php 
			if ($YourName != null){
				print("Hi $YourName");
				print("</br>You have choose to have an appointment on $gio:$phut:$giay, $ngay/$thang/$nam");
				print("</br>More infomation");
				if ($gio >=12){
					$gio -=12;
					print("<br/>In 12 hours, the time and date is $gio:$phut:$giay PM, $ngay/$thang/$nam");
				} else {
				print("<br/>In 12 hours, the time and date is $gio:$phut:$giay AM, $ngay/$thang/$nam");}
				print("<br/>This mounth has $max_ngay day");
			}

			?>
			



		</div>
		
	</form>

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <script >
    	$(document).ready(function(){
   
    function RenderOption(Id, from, to){
        for (let index = from; index <= to; index++) {
            $(Id)
            .append($("<option></option>")
                       .attr("value",index)
                       .text(index)); 
           } 
    }

    RenderOption("#thang",1,12);
    RenderOption("#ngay",1,30);
    RenderOption("#nam",1990,2019);
    RenderOption("#gio",0,24);
    RenderOption("#phut",0,60);
    RenderOption("#giay",0,60);


   function checkNamNhuan(nam){
        if (nam % 4 == 0 || (nam % 100 == 0 && nam % 400 == 0)) {
            return true;
        }
        return false;
   }

   $("#thang").change(function(){
      thang  = parseInt($('#thang option:selected').val());
      nam = parseInt($('#nam option:selected').val());
      $("#ngay").html("");
      if (thang == 1 || thang == 3 || thang == 5 || thang == 7 || thang == 8 || thang == 10 || thang == 12){
        RenderOption("#ngay",1,31);
      }else if(thang == 2 && checkNamNhuan(nam)){
        RenderOption("#ngay",1,29);
      }else if(thang == 2 && !checkNamNhuan(nam)){
        RenderOption("#ngay",1,28);
      }else{
        RenderOption("#ngay",1,30);
      }
   });
  });
    </script>

</body>
</html> 
