String formatearPrecio(dynamic precio) {
  double precioDouble;

  if (precio is double) {
    precioDouble = precio;
  } else if (precio is String) {
    precioDouble = double.tryParse(precio) ?? 0.0;
  } else {
    return ''; // Devuelve una cadena vacía si el precio no es ni double ni string
  }

  // Formatea el precio como un número con 2 decimales
  String precioFormateado = precioDouble.toStringAsFixed(2);

  // Quita los ceros finales después del punto
  precioFormateado = precioFormateado.replaceAll(RegExp(r"([.].*?)0*$"), '');

  // Separa los miles con comas y agrega el espacio después del signo de dólar
  List<String> partes = precioFormateado.split('.');
  String parteEntera = partes[0];
  String parteDecimal = partes.length > 1 ? '.' + partes[1] : '';
  RegExp regex = RegExp(r'\B(?=(\d{3})+(?!\d))');
  parteEntera = parteEntera.replaceAllMapped(regex, (Match match) => '.');

  return '\$ $parteEntera$parteDecimal'; // Agrega el símbolo de dólar con espacio y retorna el precio formateado
}
