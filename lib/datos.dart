import 'package:stock/model.dart';

List<Categorias> lista = [
  Categorias(categoria: 'Aceites', listadoproductos: [
    Productos(nombre: 'Natura', costo: '172'),
    Productos(nombre: 'Cocinero', costo: '150')
  ]),
  Categorias(categoria: 'Latas', listadoproductos: [
    Productos(nombre: 'Arvejas', costo: '100'),
    Productos(nombre: 'Tomate Perita', costo: '100')
  ]),
  Categorias(categoria: 'Secos', listadoproductos: [
    Productos(nombre: 'Azucar', costo: '50'),
    Productos(nombre: 'Harinas', costo: '40'),
  ]),
  Categorias(categoria: 'Fiambres', listadoproductos: [
    Productos(nombre: 'Paleta Cocida', costo: '100'),
    Productos(nombre: 'Paleta Sanwichera', costo: '30')
  ]),
  Categorias(
      categoria: 'Leches ',
      listadoproductos: [Productos(nombre: 'Chacra', costo: '130')]),
  Categorias(categoria: 'Quesos', listadoproductos: []),
  Categorias(categoria: 'yogures', listadoproductos: []),
  Categorias(categoria: 'Masitas', listadoproductos: []),
  Categorias(categoria: 'Snack', listadoproductos: []),
];
