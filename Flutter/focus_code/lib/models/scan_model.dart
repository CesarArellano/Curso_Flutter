class ScanModel {

  int? id;
  String? scanType;
  String scanValue;

  ScanModel({
    this.id,
    this.scanType,
    required this.scanValue,
  }) {
    scanType = ( scanValue.contains('http') ) ? 'http' :'geo';
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
    id: json["id"],
    scanType: json["scan_type"],
    scanValue: json["scan_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "scan_type": scanType,
    "scan_value": scanValue,
  };
}
