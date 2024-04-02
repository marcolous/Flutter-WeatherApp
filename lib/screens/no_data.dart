// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, use_build_context_synchronously, must_be_immutable
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class NoData extends StatelessWidget {
  NoData({super.key, required this.message});

  final String message;

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        backgroundColor: Colors.grey,
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Search',
          ),
        ),
        child: Stack(
          children: [
            //search bar
            Padding(
              padding: const EdgeInsets.only(top: 55, right: 15, left: 15),
              child: Builder(
                builder: (context) => AnimSearchBar(
                  width: 500,
                  textController: editingController,
                  onSuffixTap: () {},
                  onSubmitted: (value) async {
                    var getWeatherCubit =
                        BlocProvider.of<GetWeatherCubit>(context);
                    getWeatherCubit.getWeather(value: value);
                  },
                  helpText: 'Search...',
                  rtl: true,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Righteous',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
