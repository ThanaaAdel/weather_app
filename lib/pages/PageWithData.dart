import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';

class PageWithData extends StatelessWidget {
  const PageWithData({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
var weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
           Text(
             weatherModel!.cityName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at : ${weatherModel!.date.hour.toString()}:${weatherModel.date.minute.toString()}',
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network('https:${weatherModel.iconImage}'),
              Text(
                weatherModel.temp.toInt().toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children:  [
                  Text('maxTemp :${weatherModel.maxTemp.toInt()}'),
                  Text('minTemp : ${weatherModel.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            weatherModel.weatherStateName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      );
  }
}
