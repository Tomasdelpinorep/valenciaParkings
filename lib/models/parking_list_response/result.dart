import 'geo_point2d.dart';
import 'geo_shape.dart';

class Result {
  String? nombre;
  String? direccion;
  int? idAparcamiento;
  String? numeropol;
  int? tipo;
  int? plazastota;
  int? plazaslibr;
  dynamic ultimaMod;
  int? objectid;
  double? ocupacion;
  GeoShape? geoShape;
  GeoPoint2d? geoPoint2d;

  Result({
    this.nombre,
    this.direccion,
    this.idAparcamiento,
    this.numeropol,
    this.tipo,
    this.plazastota,
    this.plazaslibr,
    this.ultimaMod,
    this.objectid,
    this.ocupacion,
    this.geoShape,
    this.geoPoint2d,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        nombre: json['nombre'] as String?,
        direccion: json['direccion'] as String?,
        idAparcamiento: json['id_aparcamiento'] as int?,
        numeropol: json['numeropol'] as String?,
        tipo: json['tipo'] as int?,
        plazastota: json['plazastota'] as int?,
        plazaslibr: json['plazaslibr'] as int?,
        ultimaMod: json['ultima_mod'] as dynamic,
        objectid: json['objectid'] as int?,
        ocupacion: (json['ocupacion'] as num?)?.toDouble(),
        geoShape: json['geo_shape'] == null
            ? null
            : GeoShape.fromJson(json['geo_shape'] as Map<String, dynamic>),
        geoPoint2d: json['geo_point_2d'] == null
            ? null
            : GeoPoint2d.fromJson(json['geo_point_2d'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'direccion': direccion,
        'id_aparcamiento': idAparcamiento,
        'numeropol': numeropol,
        'tipo': tipo,
        'plazastota': plazastota,
        'plazaslibr': plazaslibr,
        'ultima_mod': ultimaMod,
        'objectid': objectid,
        'ocupacion': ocupacion,
        'geo_shape': geoShape?.toJson(),
        'geo_point_2d': geoPoint2d?.toJson(),
      };
}
