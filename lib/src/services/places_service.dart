import 'package:flutter/services.dart';
import 'package:travel_app/src/models/place_response.dart';

class PlacesService {
  static Future<List<Place>> readFileJson() async {
    final data = await rootBundle.loadString('assets/data/places.json');
    final decodedData = PlaceResponse.fromJson(data);
    print(data);
    return decodedData.places;
  }
}
