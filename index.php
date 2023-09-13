<?php
	require ('conexion.php');
	$query = "SELECT id_provincia, provincia FROM t_provincia ORDER BY provincia DESC";
	$resultado=$mysqli->query($query);
?>
<html>
	<head>
		<title>ComboBox Ajax, PHP y MySQL</title>
		<script language="javascript" src="js/jquery-3.1.1.min.js"></script>
		<script language="javascript">
			$(document).ready(function(){
				$("#cbx_provincia").change(function () {

					$('#cbx_localidad').find('option').remove().end().append('<option value="whatever"></option>').val('whatever');
					
					$("#cbx_provincia option:selected").each(function () {
						id_provincia = $(this).val();
						$.post("includes/getMunicipio.php", { id_provincia: id_provincia }, function(data){
							$("#cbx_municipio").html(data);
						});            
					});
				})
			});
			
			$(document).ready(function(){
				$("#cbx_municipio").change(function () {
					$("#cbx_municipio option:selected").each(function () {
						id_municipio = $(this).val();
						$.post("includes/getLocalidad.php", { id_municipio: id_municipio }, function(data){
							$("#cbx_localidad").html(data);
						});            
					});
				})
			});
		</script>
		
	</head>
<body>	
	<select>
		<option value="0">Seleccione color</option>
		<option value="1">Rojo</option>
	</select>
		<form id="combo" name="combo" action="guarda.php" method="POST">
			<div>Selecciona Provincia : <select name="cbx_provincia" id="cbx_provincia">
				<option value="0">Seleccionar Provincia</option>
				<?php while($row = $resultado->fetch_assoc()) { ?>
					<option value="<?php echo $row['id_provincia']; ?>"><?php echo $row['provincia']; ?></option>
				<?php } ?>
			</select></div>
			
			<br />
			
			<div>Selecciona Municipio : <select name="cbx_municipio" id="cbx_municipio"></select></div>
			
			<br />
			
			<div>Selecciona Localidad : <select name="cbx_localidad" id="cbx_localidad"></select></div>
			
			<br />
			<input type="submit" id="enviar" name="enviar" value="Guardar" />
		</form>
</body>
</html>
