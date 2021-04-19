import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    ProductoModel({
      this.id,
      this.titulo = '',
      this.valor = 0.0,
      this.disponible = true,
      this.fotoUrl,
    });

    String id;
    String titulo;
    double valor;
    bool disponible;
    String fotoUrl;

    factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id          : json["id"],
        titulo      : json["titulo"],
        valor       : json["valor"],
        disponible  : json["disponible"],
        fotoUrl     : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "titulo"    : titulo,
        "valor"     : valor,
        "disponible": disponible,
        "fotoUrl"   : fotoUrl,
    };
}
