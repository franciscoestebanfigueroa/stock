class Productos {
  final nombre;
  final codigo;
  final costo;
  final iva;
  final porcentagemayor;
  final porcentagemenor;
  final cantidadunidades;

  Productos(
      {required this.nombre,
      this.codigo,
      required this.costo,
      this.iva,
      this.porcentagemayor,
      this.porcentagemenor,
      this.cantidadunidades});
}

class Categorias {
  final categoria;
  double from;
  double to;

  int cantidadproductos = 0;
  final List<Productos> listadoproductos;

  Categorias(
      {this.from = 0,
      this.to = 0,
      required this.categoria,
      required this.listadoproductos});
}
