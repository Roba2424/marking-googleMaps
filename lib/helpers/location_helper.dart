import 'dart:convert';

import 'package:http/http.dart' as http;

const googleApiKey = 'AIzaSyDz9_jE-wPpmp6AcZBhgzyAtUfxq2C4-H4';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$googleApiKey';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleApiKey';
    final response = await http.get(Uri.parse(url));
    print(json.decode(response.body)['results']);
    print('oooooooooooooooooooo');
    print(json.decode(response.body)['results'][0]);
    print('aaaaaaaaaaaaaaaaaa');
    print(json.decode(response.body)['results'][0]['formatted_address']);

    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
