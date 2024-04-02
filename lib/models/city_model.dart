// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

class CityModel {
  final String name;
  final String country;
  final String tz_id;
  final double temp_c;
  final String text;
  final String icon;
  final double feelslike_c;
  final double maxtemp_c;
  final double mintemp_c;
  final double avgtemp_c;

  CityModel({
    required this.name,
    required this.country,
    required this.tz_id,
    required this.temp_c,
    required this.text,
    required this.icon,
    required this.feelslike_c,
    required this.maxtemp_c,
    required this.mintemp_c,
    required this.avgtemp_c,
  });

  factory CityModel.fromJson(json) {
    return CityModel(
      name: json['location']['name'],
      country: json['location']['country'],
      tz_id: json['location']['tz_id'],
      temp_c: json['current']['temp_c'],
      text: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'],
      feelslike_c: json['current']['feelslike_c'],
      maxtemp_c: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp_c: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      avgtemp_c: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
    );
  }
}
