import 'package:dio/dio.dart';
import 'package:weather_app/models/city_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '32934beedf544fe4945130711240204';
  WeatherService();

  Future<CityModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      CityModel cityModel = CityModel.fromJson(response.data);
      return cityModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'there is an error';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('there is an error');
    }
  }
}
