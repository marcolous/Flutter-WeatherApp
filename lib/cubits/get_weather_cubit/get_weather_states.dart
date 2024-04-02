import 'package:weather_app/models/city_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final CityModel cityModel;

  WeatherLoadedState({required this.cityModel});
}

class WeatherFailureState extends WeatherState {
  final String errorMessage;

  WeatherFailureState(this.errorMessage);
  
}
