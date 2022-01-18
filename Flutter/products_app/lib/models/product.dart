import 'dart:convert';

class Product {
  Product({
    this.fotoUrl,
    required this.disponible,
    required this.titulo,
    required this.valor,
  });

  bool disponible;
  String? fotoUrl;
  String titulo;
  double valor;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    disponible: json["disponible"],
    fotoUrl: json["fotoUrl"],
    titulo: json["titulo"],
    valor: json["valor"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "disponible": disponible,
    "fotoUrl": fotoUrl,
    "titulo": titulo,
    "valor": valor,
  };
}
