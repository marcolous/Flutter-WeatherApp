// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/no_data.dart';
import 'package:weather_app/screens/show_weather.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: BlocBuilder<GetWeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherInitialState) {
                    return NoData(
                        message: 'No Weather🌦.. \nStart Searching🔍');
                  } else if (state is WeatherLoadedState) {
                    return ShowWeather();
                  } else {
                    return NoData(message: 'Wrong City name😕');
                  }
                },
              ),
            );
          },
        );
      }),
    );
  }
}

MaterialColor themeColors(String? condition) {
  if (condition == null) {
    return Colors.grey;
  }
  condition = condition.toLowerCase();
  switch (condition) {
    case 'sunny':
      return Colors.orange;
    case 'clear':
      return Colors.blue;
    case 'partly cloudy':
      return Colors.lightBlue;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.grey;
    case 'mist':
      return Colors.lightGreen;
    case 'patchy rain possible':
      return Colors.blue;
    case 'patchy snow possible':
      return Colors.lightBlue; // Light blue instead of white
    case 'patchy sleet possible':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'patchy freezing drizzle possible':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    case 'blowing snow':
      return Colors.blueGrey; // Blue grey instead of white
    case 'blizzard':
      return Colors.blueGrey; // Blue grey instead of white
    case 'fog':
      return Colors.grey;
    case 'freezing fog':
      return Colors.grey;
    case 'patchy light drizzle':
      return Colors.blue;
    case 'light drizzle':
      return Colors.blue;
    case 'freezing drizzle':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'heavy freezing drizzle':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'patchy light rain':
      return Colors.blue;
    case 'light rain':
      return Colors.blue;
    case 'moderate rain at times':
      return Colors.blue;
    case 'moderate rain':
      return Colors.blue;
    case 'heavy rain at times':
      return Colors.blue;
    case 'heavy rain':
      return Colors.blue;
    case 'light freezing rain':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'moderate or heavy freezing rain':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'light sleet':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'moderate or heavy sleet':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'patchy light snow':
      return Colors.lightBlue; // Light blue instead of white
    case 'light snow':
      return Colors.lightBlue; // Light blue instead of white
    case 'patchy moderate snow':
      return Colors.lightBlue; // Light blue instead of white
    case 'moderate snow':
      return Colors.lightBlue; // Light blue instead of white
    case 'patchy heavy snow':
      return Colors.lightBlue; // Light blue instead of white
    case 'heavy snow':
      return Colors.lightBlue; // Light blue instead of white
    case 'ice pellets':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'light rain shower':
      return Colors.blue;
    case 'moderate or heavy rain shower':
      return Colors.blue;
    case 'torrential rain shower':
      return Colors.blue;
    case 'light sleet showers':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'moderate or heavy sleet showers':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'light snow showers':
      return Colors.lightBlue; // Light blue instead of white
    case 'moderate or heavy snow showers':
      return Colors.lightBlue; // Light blue instead of white
    case 'light showers of ice pellets':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'moderate or heavy showers of ice pellets':
      return Colors.blueGrey; // Blue grey instead of light blue accent
    case 'patchy light rain with thunder':
      return Colors.blue;
    case 'moderate or heavy rain with thunder':
      return Colors.blue;
    case 'patchy light snow with thunder':
      return Colors.lightBlue; // Light blue instead of white
    case 'moderate or heavy snow with thunder':
      return Colors.lightBlue; // Light blue instead of white
    default:
      return Colors.blue; // Default color for unknown conditions
  }
}
