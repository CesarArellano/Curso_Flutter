import 'dart:convert';
import 'package:meta/meta.dart'; // Importa el @required

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    ScanModel({
        this.id,
        this.tipo,
        @required this.valor,
    }) {
      if (this.valor.contains('http')) {
        this.tipo = 'http';
      } else {
        this.tipo = 'geo';
      }
    }

    int id;
    String tipo;
    String valor;

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
