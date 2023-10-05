import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_services.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(WeatherService()),
      child:  Builder(
        builder: (context) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel == null ?  Colors.blue : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor()  ,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        }
      ),
    );
  }
}