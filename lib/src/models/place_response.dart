// To parse this JSON data, do
//
//     final placeResponse = placeResponseFromMap(jsonString);

import 'dart:convert';

class PlaceResponse {
  PlaceResponse({
    required this.places,
  });

  final List<Place> places;

  factory PlaceResponse.fromJson(String str) =>
      PlaceResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlaceResponse.fromMap(Map<String, dynamic> json) => PlaceResponse(
        places: List<Place>.from(json["places"].map((x) => Place.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "places": List<dynamic>.from(places.map((x) => x.toMap())),
      };
}

class Place {
  Place({
    required this.nombre,
    required this.ubicacion,
    required this.calificacion,
    required this.imagen,
    required this.categoria,
  });

  final String nombre;
  final String ubicacion;
  final double calificacion;
  final String imagen;
  final String categoria;

  factory Place.fromJson(String str) => Place.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Place.fromMap(Map<String, dynamic> json) => Place(
        nombre: json["nombre"],
        ubicacion: json["ubicacion"],
        calificacion: json["calificacion"]?.toDouble(),
        imagen: json["imagen"],
        categoria: json["categoria"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "ubicacion": ubicacion,
        "calificacion": calificacion,
        "imagen": imagen,
        "categoria": categoria,
      };
}
