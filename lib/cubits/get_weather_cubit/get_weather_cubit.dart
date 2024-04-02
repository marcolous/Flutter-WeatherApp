import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  CityModel? cityModel;
  void resetWeather() {
    emit(WeatherInitialState());
  }

  Future<void> getWeather({required String value}) async {
    try {
      cityModel = await WeatherService().getCurrentWeather(cityName: value);
      emit(WeatherLoadedState(cityModel: cityModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
