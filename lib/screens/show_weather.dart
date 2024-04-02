// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, must_be_immutable, use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/city_model.dart';
import 'package:weather_app/main.dart';

class ShowWeather extends StatelessWidget {
  ShowWeather({super.key});

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CityModel cityModel = BlocProvider.of<GetWeatherCubit>(context).cityModel!;
    return Scaffold(
      body: CupertinoPageScaffold(
        backgroundColor: Colors.grey,
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            cityModel.name,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              themeColors(cityModel.text),
              themeColors(cityModel.text)[300]!,
              themeColors(cityModel.text)[50]!,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 180),
                  Image.network(cityModel.icon.contains('https:')
                      ? cityModel.icon
                      : 'https:${cityModel.icon}'),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cityModel.temp_c.round().toString(),
                        style: TextStyle(
                          fontSize: 80,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Righteous',
                        ),
                      ),
                      Text(
                        '°C',
                        style: TextStyle(
                          fontSize: 30, // Adjust the size of the "°C" text
                          color: Colors.white,
                          fontFamily: 'Righteous',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    cityModel.country,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Righteous',
                    ),
                  ),
                  Text(
                    cityModel.tz_id,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Righteous',
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Spacer(flex: 1),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Feels like',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                          Text(
                            cityModel.feelslike_c.round().toString(),
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        ],
                      ),
                      Spacer(flex: 1),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Max',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                          Text(
                            cityModel.maxtemp_c.round().toString(),
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        ],
                      ),
                      Spacer(flex: 1),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Average',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                          Text(
                            cityModel.avgtemp_c.round().toString(),
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        ],
                      ),
                      Spacer(flex: 1),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Min',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                          Text(
                            cityModel.mintemp_c.round().toString(),
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Righteous',
                            ),
                          ),
                        ],
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(
                    cityModel.text,
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Righteous',
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: CupertinoButton(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    BlocProvider.of<GetWeatherCubit>(context).resetWeather();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

CityModel? cityModel;
