<?php
	
	$mode = $_POST["pick"];
	$value = $_POST["value"];

	$x = convert($value, $mode);
	print($x);

	function convert($value, $mode){
		if ($mode == 1){
			return ($value*180/pi());
		} elseif ($mode ==2){
			return ($value*pi()/180);
		}
	}

?>