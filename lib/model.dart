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

  int cantidadproductos = 0;
  final List<Productos> listadoproductos;

  Categorias({required this.categoria, required this.listadoproductos});
}
