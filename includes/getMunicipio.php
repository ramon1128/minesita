<?php
	require ('../conexion.php');
	$id_provincia = $_POST['id_provincia'];
	$queryM = "SELECT id_municipio, municipio FROM t_municipio WHERE id_provincia = '$id_provincia' ORDER BY municipio";
	$resultadoM = $mysqli->query($queryM);
	$html= "<option value='0'>Seleccionar Municipio</option>";
	while($rowM = $resultadoM->fetch_assoc()){
		$html.= "<option value='".$rowM['id_municipio']."'>".$rowM['municipio']."</option>";
	}
	echo $html;
?>		