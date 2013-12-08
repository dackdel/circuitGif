<?
	
	$symbol = array();
	$h = opendir("images/");
	while (false !== ($entry = readdir($h))) {
		if ($entry != "." && $entry != "..") {
			array_push($symbol, $entry);
		}
	}
	
	$fh = fopen('all.json', 'w');
	fwrite($fh, json_encode($symbol));
	fclose($fh);

?>