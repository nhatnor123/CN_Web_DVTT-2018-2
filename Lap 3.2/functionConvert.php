<?php
	
	$mode = $_POST["pick"];
	$value = $_POST["value"];

	$x = convert($value, $mode);
	if ($mode == 2){
		print($value." degree = ".$x." radians");
	} elseif ($mode == 1){
		print($value." radians = ".$x." degree ");
	}

	function convert($value, $mode){
		if ($mode == 1){
			return ($value*180/pi());
		} elseif ($mode ==2){
			return ($value*pi()/180);
		}
	}

?>